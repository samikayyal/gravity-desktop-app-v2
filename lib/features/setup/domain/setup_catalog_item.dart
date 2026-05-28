import 'package:flutter/foundation.dart';

@immutable
class InitialCatalogProduct {
  const InitialCatalogProduct({
    required this.name,
    required this.sku,
    required this.unitPriceSyp,
    required this.initialStock,
  });

  final String name;
  final String sku;
  final int unitPriceSyp;
  final int initialStock;
}
