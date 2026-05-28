import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_desktop_app_v2/app/providers.dart';
import 'package:gravity_desktop_app_v2/data/repositories/audit_repository.dart';

final auditRepositoryProvider = Provider<AuditRepository>((ref) {
  return AuditRepository(ref.watch(databaseProvider));
});

@immutable
class AuditEventsPageRequest {
  const AuditEventsPageRequest({required this.pageIndex, this.pageSize = 10});

  final int pageIndex;
  final int pageSize;

  @override
  bool operator ==(Object other) {
    return other is AuditEventsPageRequest &&
        other.pageIndex == pageIndex &&
        other.pageSize == pageSize;
  }

  @override
  int get hashCode => Object.hash(pageIndex, pageSize);
}

final auditEventsPageProvider =
    FutureProvider.family<AuditEventPage, AuditEventsPageRequest>((
      ref,
      request,
    ) {
      return ref
          .watch(auditRepositoryProvider)
          .fetchAuditEventsPage(
            pageIndex: request.pageIndex,
            pageSize: request.pageSize,
          );
    });
