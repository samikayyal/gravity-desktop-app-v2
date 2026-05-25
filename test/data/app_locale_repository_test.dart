import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/data/repositories/app_locale_repository.dart';

void main() {
  late AppDatabase database;
  late AppLocaleRepository repository;

  setUp(() {
    database = AppDatabase.forTesting(
      DatabaseConnection(NativeDatabase.memory()),
    );
    repository = AppLocaleRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('persists and updates the selected app locale setting', () async {
    expect(await repository.loadLocaleCode(), isNull);

    await repository.saveLocaleCode('ar');
    expect(await repository.loadLocaleCode(), 'ar');

    await repository.saveLocaleCode('en');
    expect(await repository.loadLocaleCode(), 'en');

    final rows = await database.select(database.systemSettings).get();
    expect(rows, hasLength(1));
    expect(rows.single.key, AppLocaleRepository.localeSettingKey);
  });
}
