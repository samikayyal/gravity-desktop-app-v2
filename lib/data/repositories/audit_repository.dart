import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:gravity_desktop_app_v2/core/audit/audit_service.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';

@immutable
class AuditEventPage {
  const AuditEventPage({
    required this.records,
    required this.pageIndex,
    required this.pageSize,
    required this.totalCount,
  });

  final List<AuditEventRecord> records;
  final int pageIndex;
  final int pageSize;
  final int totalCount;

  int get totalPages {
    if (totalCount == 0) {
      return 1;
    }
    return (totalCount / pageSize).ceil();
  }

  bool get hasPreviousPage => pageIndex > 0;

  bool get hasNextPage => pageIndex + 1 < totalPages;
}

class AuditRepository {
  AuditRepository(
    this._database, {
    DateTime Function()? now,
    AuditService auditService = const AuditService(),
  }) : _now = now ?? DateTime.now,
       _auditService = auditService;

  final AppDatabase _database;
  final DateTime Function() _now;
  final AuditService _auditService;

  Future<int> insertAuditEvent(AuditEventDraft draft) async {
    try {
      return await _database
          .into(_database.auditEvents)
          .insert(
            AuditEventsCompanion.insert(
              eventType: draft.eventType.storageValue,
              description: draft.description,
              triggeredAt: _now().toUtc().toIso8601String(),
              metadata: Value(draft.encodedMetadata),
            ),
          );
    } catch (_, stackTrace) {
      Error.throwWithStackTrace(
        AuditWriteException('Failed to write ${draft.eventType.storageValue}'),
        stackTrace,
      );
    }
  }

  Future<AuditEventPage> fetchAuditEventsPage({
    required int pageIndex,
    required int pageSize,
  }) async {
    final safePageIndex = pageIndex < 0 ? 0 : pageIndex;
    final safePageSize = pageSize < 1 ? 1 : pageSize;
    final totalCount = await _countAuditEvents();
    final rows =
        await (_database.select(_database.auditEvents)
              ..orderBy([
                (table) => OrderingTerm.desc(table.triggeredAt),
                (table) => OrderingTerm.desc(table.id),
              ])
              ..limit(safePageSize, offset: safePageIndex * safePageSize))
            .get();

    return AuditEventPage(
      records: [
        for (final row in rows)
          _auditService.recordFromStorage(
            id: row.id,
            eventType: row.eventType,
            description: row.description,
            triggeredAt: row.triggeredAt,
            metadata: row.metadata,
          ),
      ],
      pageIndex: safePageIndex,
      pageSize: safePageSize,
      totalCount: totalCount,
    );
  }

  Future<int> _countAuditEvents() async {
    final countExpression = _database.auditEvents.id.count();
    final query = _database.selectOnly(_database.auditEvents)
      ..addColumns([countExpression]);
    return await query.map((row) => row.read(countExpression) ?? 0).getSingle();
  }
}
