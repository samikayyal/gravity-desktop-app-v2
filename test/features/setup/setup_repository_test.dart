import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_desktop_app_v2/core/config/app_settings.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/data/repositories/setup_repository.dart';
import 'package:gravity_desktop_app_v2/features/setup/domain/setup_catalog_item.dart';

void main() {
  late AppDatabase database;

  setUp(() {
    database = AppDatabase.forTesting(
      DatabaseConnection(NativeDatabase.memory()),
    );
  });

  tearDown(() async {
    await database.close();
  });

  test(
    'completes setup and seeds default products with stock ledger rows',
    () async {
      final repository = SetupRepository(
        database,
        now: () => DateTime.utc(2026, 5, 28, 10),
      );

      await repository.completeNewInstallation(
        adminPassword: 'AdminGravity',
        gcpEnabled: false,
        products: const [
          InitialCatalogProduct(
            name: 'Grippy Socks',
            sku: 'SOCKS-GRIP',
            unitPriceSyp: 12000,
            initialStock: 100,
          ),
          InitialCatalogProduct(
            name: 'Bottled Water',
            sku: 'WATER-500',
            unitPriceSyp: 2000,
            initialStock: 50,
          ),
        ],
      );

      final settings = await database.select(database.systemSettings).get();
      final settingsMap = {for (final row in settings) row.key: row.value};
      expect(settingsMap[SettingKeys.adminPassword], 'AdminGravity');
      expect(settingsMap[SettingKeys.gcpEnabled], '0');
      expect(settingsMap[SettingKeys.setupComplete], '1');

      final products = await database.select(database.products).get();
      expect(products, hasLength(2));
      expect(products.map((product) => product.sku), {
        'SOCKS-GRIP',
        'WATER-500',
      });
      expect(
        products.firstWhere((product) => product.sku == 'SOCKS-GRIP').unitPrice,
        12000,
      );

      final movements = await database
          .select(database.inventoryMovements)
          .get();
      expect(movements, hasLength(2));
      expect(movements.map((movement) => movement.movementType).toSet(), {
        'restock',
      });
      expect(movements.map((movement) => movement.quantityChange).toSet(), {
        100,
        50,
      });
      expect(movements.every((movement) => movement.stockBefore == 0), isTrue);
    },
  );

  test('rejects duplicate setup product SKUs defensively', () async {
    final repository = SetupRepository(database);

    await expectLater(
      repository.completeNewInstallation(
        adminPassword: 'AdminGravity',
        gcpEnabled: false,
        products: const [
          InitialCatalogProduct(
            name: 'Grippy Socks',
            sku: 'DUPLICATE',
            unitPriceSyp: 12000,
            initialStock: 100,
          ),
          InitialCatalogProduct(
            name: 'Bottled Water',
            sku: ' duplicate ',
            unitPriceSyp: 2000,
            initialStock: 50,
          ),
        ],
      ),
      throwsA(isA<SetupCatalogValidationException>()),
    );

    expect(await database.select(database.products).get(), isEmpty);
    expect(await database.select(database.inventoryMovements).get(), isEmpty);
    expect(await database.select(database.systemSettings).get(), isEmpty);
  });
}
