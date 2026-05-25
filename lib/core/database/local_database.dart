import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'local_database.g.dart';

// --- TABLE DEFINITIONS ---

class Players extends Table {
  TextColumn get id => text()();
  TextColumn get fullName => text()();
  IntColumn get age => integer()();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();
  BoolColumn get hasActiveSession => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}

class PlayerPhones extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get playerId => text().references(Players, #id)();
  TextColumn get phoneNumber => text()();
  BoolColumn get isPrimary => boolean()();
}

class Sessions extends Table {
  TextColumn get id => text()();
  TextColumn get playerId => text().references(Players, #id)();
  TextColumn get entryType => text()(); // 'fixed' or 'open'
  IntColumn get reservedBlocks => integer().nullable()();
  TextColumn get checkInAt => text()();
  TextColumn get checkOutAt => text().nullable()();
  TextColumn get status =>
      text()(); // 'active', 'overdue', 'stale', 'closed', 'voided'
  TextColumn get subscriptionId =>
      text().nullable().references(Subscriptions, #id)();
  IntColumn get calculatedCharge => integer()();
  IntColumn get finalCharge => integer()();
  IntColumn get discountAmount => integer()();
  TextColumn get discountReason => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Subscriptions extends Table {
  TextColumn get id => text()();
  TextColumn get playerId => text().references(Players, #id)();
  IntColumn get totalMinutes => integer()();
  IntColumn get remainingMinutes => integer()();
  TextColumn get purchasedAt => text()();
  TextColumn get expiresAt => text()();
  TextColumn get status =>
      text()(); // 'active', 'expired', 'exhausted', 'voided'
  TextColumn get unpaidDebtId => text().nullable().references(Debts, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

class SubscriptionUsageLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get subscriptionId => text().references(Subscriptions, #id)();
  TextColumn get sessionId => text().references(Sessions, #id)();
  IntColumn get minutesConsumed => integer()();
  TextColumn get createdAt => text()();
}

class Products extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get sku => text().customConstraint('UNIQUE NOT NULL')();
  IntColumn get unitPrice => integer()();
  IntColumn get currentStock => integer()();
  BoolColumn get isActive => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}

class ProductSales extends Table {
  TextColumn get id => text()();
  TextColumn get playerId => text().nullable().references(Players, #id)();
  TextColumn get soldAt => text()();
  IntColumn get totalCharge => integer()();
  TextColumn get status => text()(); // 'completed', 'voided'

  @override
  Set<Column> get primaryKey => {id};
}

class SaleItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get saleId => text().references(ProductSales, #id)();
  TextColumn get productId => text().references(Products, #id)();
  TextColumn get productNameSnapshot => text()();
  IntColumn get quantity => integer()();
  IntColumn get unitPriceSnapshot => integer()();
}

class Payments extends Table {
  TextColumn get id => text()();
  TextColumn get paymentGroupId => text()();
  TextColumn get playerId => text().nullable().references(Players, #id)();
  TextColumn get paymentMethod => text()(); // 'cash', 'card'
  IntColumn get amountPaid => integer()();
  IntColumn get tipAmount => integer()();
  TextColumn get status => text()(); // 'completed', 'voided'
  TextColumn get createdAt => text()();
  TextColumn get sessionId => text().nullable().references(Sessions, #id)();
  TextColumn get saleId => text().nullable().references(ProductSales, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

class Debts extends Table {
  TextColumn get id => text()();
  TextColumn get playerId => text().references(Players, #id)();
  IntColumn get originalAmount => integer()();
  IntColumn get remainingAmount => integer()();
  TextColumn get createdAt => text()();
  TextColumn get status => text()(); // 'active', 'settled', 'voided'
  TextColumn get originatingSessionId =>
      text().nullable().references(Sessions, #id)();
  TextColumn get originatingSaleId =>
      text().nullable().references(ProductSales, #id)();
  TextColumn get originatingSubscriptionId =>
      text().nullable().references(Subscriptions, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

class DebtPayments extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get debtId => text().references(Debts, #id)();
  TextColumn get paymentId => text().references(Payments, #id)();
  IntColumn get amountApplied => integer()();
  TextColumn get createdAt => text()();
}

class InventoryMovements extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productId => text().references(Products, #id)();
  TextColumn get movementType =>
      text()(); // 'restock', 'sale', 'correction', 'void'
  IntColumn get quantityChange => integer()();
  IntColumn get stockBefore => integer()();
  IntColumn get stockAfter => integer()();
  TextColumn get notes => text().nullable()();
  TextColumn get createdAt => text()();
  TextColumn get associatedSaleId =>
      text().nullable().references(ProductSales, #id)();
}

class EndDayCloses extends Table {
  TextColumn get id => text()();
  TextColumn get closedAt => text()();
  TextColumn get businessDate => text()(); // YYYY-MM-DD
  IntColumn get expectedCash => integer()();
  IntColumn get expectedCard => integer()();
  IntColumn get countedCash => integer()();
  IntColumn get countedCard => integer()();
  IntColumn get cashMismatch => integer()();
  IntColumn get cardMismatch => integer()();
  IntColumn get totalDebtIssued => integer()();
  IntColumn get totalDebtCollected => integer()();
  IntColumn get totalTips => integer()();
  BoolColumn get isMissedClose => boolean()();
  TextColumn get backupStatus => text()(); // 'pending', 'success', 'failed'

  @override
  Set<Column> get primaryKey => {id};
}

class AuditEvents extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get eventType =>
      text()(); // 'price_change', 'stale_correction', etc.
  TextColumn get description => text()();
  TextColumn get triggeredAt => text()();
  TextColumn get metadata => text().nullable()(); // JSON string
}

class BackupRuns extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get triggeredAt => text()();
  TextColumn get triggerType =>
      text()(); // 'scheduled', 'manual', 'app_close', 'end_day'
  TextColumn get status => text()(); // 'running', 'success', 'failed'
  TextColumn get backupFilename => text()();
  TextColumn get errorMessage => text().nullable()();
}

class SystemSettings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
  TextColumn get updatedAt => text()();

  @override
  Set<Column> get primaryKey => {key};
}

class Corrections extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get originalId => text()();
  TextColumn get originalTable => text()();
  TextColumn get correctionType => text()(); // 'void', 'adjustment', 'reversal'
  IntColumn get auditEventId => integer().references(AuditEvents, #id)();
  TextColumn get createdAt => text()();
}

// --- DATABASE CLASS ---

@DriftDatabase(
  tables: [
    Players,
    PlayerPhones,
    Sessions,
    Subscriptions,
    SubscriptionUsageLogs,
    Products,
    ProductSales,
    SaleItems,
    Payments,
    Debts,
    DebtPayments,
    InventoryMovements,
    EndDayCloses,
    AuditEvents,
    BackupRuns,
    SystemSettings,
    Corrections,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;
}

Future<File> getDatabaseFile() async {
  final dbFolder = await getApplicationSupportDirectory();
  return File(p.join(dbFolder.path, 'gravity_local_v1.db'));
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final file = await getDatabaseFile();
    return NativeDatabase.createInBackground(file);
  });
}
