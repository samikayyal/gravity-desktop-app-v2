import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_desktop_app/core/database/app_database.dart';

void main() {
  test('opens an in-memory Drift database baseline', () async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);

    final row = await database.customSelect('SELECT 1 AS value').getSingle();

    expect(database.schemaVersion, 1);
    expect(row.read<int>('value'), 1);
  });
}
