import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_desktop_app_v2/app/providers.dart';
import 'package:gravity_desktop_app_v2/core/security/admin_authorization.dart';
import 'package:gravity_desktop_app_v2/data/repositories/admin_auth_repository.dart';

typedef AdminAuthTimerFactory =
    Timer Function(Duration duration, void Function() callback);

final adminAuthControllerProvider =
    NotifierProvider<AdminAuthController, AdminAuthState>(
      AdminAuthController.new,
    );

final adminAuthRepositoryProvider = Provider<AdminAuthRepository>((ref) {
  return AdminAuthRepository(ref.watch(databaseProvider));
});

final adminAuthClockProvider = Provider<DateTime Function()>((ref) {
  return DateTime.now;
});

final adminAuthTimerFactoryProvider = Provider<AdminAuthTimerFactory>((ref) {
  return (duration, callback) => Timer(duration, callback);
});

@immutable
class AdminAuthState {
  const AdminAuthState._({required this.authorization});

  const AdminAuthState.locked() : this._(authorization: null);

  const AdminAuthState.unlocked(AdminAuthorization authorization)
    : this._(authorization: authorization);

  final AdminAuthorization? authorization;

  bool isAuthenticatedAt(DateTime now) {
    return authorization?.isActiveAt(now) ?? false;
  }
}

class AdminAuthController extends Notifier<AdminAuthState> {
  static const Duration sessionDuration = Duration(minutes: 5);

  Timer? _expiryTimer;

  DateTime Function() get _now => ref.read(adminAuthClockProvider);

  AdminAuthTimerFactory get _timerFactory {
    return ref.read(adminAuthTimerFactoryProvider);
  }

  @override
  AdminAuthState build() {
    ref.onDispose(() => _expiryTimer?.cancel());
    return const AdminAuthState.locked();
  }

  Future<bool> unlockWithPassword(String password) async {
    final isValidPassword = await ref
        .read(adminAuthRepositoryProvider)
        .verifyPlaintextPassword(password);
    if (!isValidPassword) {
      lock();
      return false;
    }

    final authorization = AdminAuthorization.issue(
      now: _now(),
      lifetime: sessionDuration,
    );
    state = AdminAuthState.unlocked(authorization);
    _scheduleExpiry(authorization);
    return true;
  }

  AdminAuthorization requireActiveAuthorization() {
    final authorization = state.authorization;
    if (authorization == null || !authorization.isActiveAt(_now())) {
      lock();
      throw const AdminAuthorizationException();
    }
    return authorization;
  }

  void refreshSession(AdminAuthorization authorization) {
    if (!identical(state.authorization, authorization)) {
      lock();
      throw const AdminAuthorizationException();
    }

    authorization.revoke();
    final refreshedAuthorization = authorization.refresh(
      now: _now(),
      lifetime: sessionDuration,
    );
    state = AdminAuthState.unlocked(refreshedAuthorization);
    _scheduleExpiry(refreshedAuthorization);
  }

  void lock() {
    _expiryTimer?.cancel();
    _expiryTimer = null;
    state.authorization?.revoke();
    state = const AdminAuthState.locked();
  }

  void _scheduleExpiry(AdminAuthorization authorization) {
    _expiryTimer?.cancel();
    final now = _now().toUtc();
    final delay = authorization.expiresAt.difference(now);

    if (delay <= Duration.zero) {
      lock();
      return;
    }

    _expiryTimer = _timerFactory(delay, lock);
  }
}
