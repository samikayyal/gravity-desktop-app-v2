import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_desktop_app_v2/app/providers.dart';
import 'package:gravity_desktop_app_v2/core/config/app_settings.dart';

final adminAuthControllerProvider =
    NotifierProvider<AdminAuthController, AdminAuthState>(
      AdminAuthController.new,
    );

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

  DateTime Function() get _now => DateTime.now;

  @override
  AdminAuthState build() {
    ref.onDispose(() => _expiryTimer?.cancel());
    return const AdminAuthState.locked();
  }

  Future<bool> unlockWithPassword(String password) async {
    final isValidPassword = await _verifyAdminPassword(password);
    if (!isValidPassword) {
      lock();
      return false;
    }

    final authorization = AdminAuthorization._issue(
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

    authorization._revoke();
    final refreshedAuthorization = authorization._refresh(
      now: _now(),
      lifetime: sessionDuration,
    );
    state = AdminAuthState.unlocked(refreshedAuthorization);
    _scheduleExpiry(refreshedAuthorization);
  }

  void lock() {
    _expiryTimer?.cancel();
    _expiryTimer = null;
    state.authorization?._revoke();
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

    _expiryTimer = Timer(delay, lock);
  }

  Future<bool> _verifyAdminPassword(String password) async {
    final database = ref.read(databaseProvider);
    final setting =
        await (database.select(database.systemSettings)
              ..where((table) => table.key.equals(SettingKeys.adminPassword)))
            .getSingleOrNull();

    return (setting?.value ?? AppSettings.defaults.adminPassword) == password;
  }
}

@immutable
class AdminAuthorization {
  const AdminAuthorization._({
    required this.issuedAt,
    required this.expiresAt,
    required _AdminAuthorizationLease lease,
  }) : _lease = lease;

  factory AdminAuthorization._issue({
    required DateTime now,
    required Duration lifetime,
  }) {
    return AdminAuthorization._(
      issuedAt: now.toUtc(),
      expiresAt: now.toUtc().add(lifetime),
      lease: _AdminAuthorizationLease(),
    );
  }

  final DateTime issuedAt;
  final DateTime expiresAt;
  final _AdminAuthorizationLease _lease;

  bool isActiveAt(DateTime now) {
    return !_lease.isRevoked && now.toUtc().isBefore(expiresAt);
  }

  AdminAuthorization _refresh({
    required DateTime now,
    required Duration lifetime,
  }) {
    return AdminAuthorization._issue(now: now, lifetime: lifetime);
  }

  void _revoke() {
    _lease.isRevoked = true;
  }
}

class _AdminAuthorizationLease {
  bool isRevoked = false;
}

class AdminAuthorizationException implements Exception {
  const AdminAuthorizationException();

  @override
  String toString() => 'AdminAuthorizationException()';
}
