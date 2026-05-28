import 'package:drift/drift.dart';
import 'package:gravity_desktop_app_v2/core/config/app_settings.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/features/setup/domain/setup_catalog_item.dart';

class SetupCatalogValidationException implements Exception {
  const SetupCatalogValidationException(this.message);

  final String message;

  @override
  String toString() => 'SetupCatalogValidationException: $message';
}

class SetupRepository {
  SetupRepository(AppDatabase database, {DateTime Function()? now})
    : _database = database,
      _now = now ?? DateTime.now;

  final AppDatabase _database;
  final DateTime Function() _now;

  Future<void> completeNewInstallation({
    required String adminPassword,
    required bool gcpEnabled,
    required List<InitialCatalogProduct> products,
  }) async {
    await _database.transaction(() async {
      _throwIfDuplicateProductSkus(products);

      await _upsertSetting(SettingKeys.adminPassword, adminPassword);
      await _upsertSetting(SettingKeys.gcpEnabled, gcpEnabled ? '1' : '0');

      for (final product in products) {
        await _seedProduct(product);
      }

      await _upsertSetting(SettingKeys.setupComplete, '1');
    });
  }

  Future<void> _upsertSetting(String key, String value) async {
    await _database
        .into(_database.systemSettings)
        .insertOnConflictUpdate(
          SystemSettingsCompanion.insert(
            key: key,
            value: value,
            updatedAt: _now().toUtc().toIso8601String(),
          ),
        );
  }

  Future<void> _seedProduct(InitialCatalogProduct product) async {
    final existingProduct = await (_database.select(
      _database.products,
    )..where((table) => table.sku.equals(product.sku))).getSingleOrNull();

    final productId = existingProduct?.id ?? _productIdForSku(product.sku);
    final stockBefore = existingProduct?.currentStock ?? 0;

    if (existingProduct == null) {
      await _database
          .into(_database.products)
          .insert(
            ProductsCompanion.insert(
              id: productId,
              name: product.name,
              sku: product.sku,
              unitPrice: product.unitPriceSyp,
              currentStock: product.initialStock,
              isActive: true,
            ),
          );
    } else {
      await (_database.update(
        _database.products,
      )..where((table) => table.id.equals(productId))).write(
        ProductsCompanion(
          name: Value(product.name),
          unitPrice: Value(product.unitPriceSyp),
          currentStock: Value(product.initialStock),
          isActive: const Value(true),
        ),
      );
    }

    await _database
        .into(_database.inventoryMovements)
        .insert(
          InventoryMovementsCompanion.insert(
            productId: productId,
            movementType: 'restock',
            quantityChange: product.initialStock - stockBefore,
            stockBefore: stockBefore,
            stockAfter: product.initialStock,
            notes: const Value('Initial setup stock'),
            createdAt: _now().toUtc().toIso8601String(),
          ),
        );
  }

  void _throwIfDuplicateProductSkus(List<InitialCatalogProduct> products) {
    final seenSkus = <String>{};
    for (final product in products) {
      final normalizedSku = product.sku.trim().toLowerCase();
      if (!seenSkus.add(normalizedSku)) {
        throw SetupCatalogValidationException(
          'Duplicate product SKU during setup: ${product.sku}',
        );
      }
    }
  }

  String _productIdForSku(String sku) {
    final normalized = sku
        .trim()
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]+'), '-')
        .replaceAll(RegExp(r'^-+|-+$'), '');
    return 'setup-product-$normalized';
  }
}
