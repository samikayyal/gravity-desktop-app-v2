import 'package:flutter/foundation.dart';

@immutable
class AdminAuthorization {
  const AdminAuthorization._({
    required this.issuedAt,
    required this.expiresAt,
    required _AdminAuthorizationLease lease,
  }) : _lease = lease;

  factory AdminAuthorization.issue({
    required DateTime now,
    required Duration lifetime,
  }) {
    final utcNow = now.toUtc();
    return AdminAuthorization._(
      issuedAt: utcNow,
      expiresAt: utcNow.add(lifetime),
      lease: _AdminAuthorizationLease(),
    );
  }

  final DateTime issuedAt;
  final DateTime expiresAt;
  final _AdminAuthorizationLease _lease;

  bool isActiveAt(DateTime now) {
    return !_lease.isRevoked && now.toUtc().isBefore(expiresAt);
  }

  AdminAuthorization refresh({
    required DateTime now,
    required Duration lifetime,
  }) {
    return AdminAuthorization.issue(now: now, lifetime: lifetime);
  }

  void revoke() {
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
