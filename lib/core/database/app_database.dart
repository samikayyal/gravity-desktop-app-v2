import 'package:drift/drift.dart';

import 'database_connection.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? openAppDatabase());

  @override
  int get schemaVersion => 1;
}
