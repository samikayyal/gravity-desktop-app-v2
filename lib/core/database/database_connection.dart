import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

QueryExecutor openAppDatabase() {
  return LazyDatabase(() async {
    final supportDirectory = await getApplicationSupportDirectory();
    final databaseDirectory = Directory(
      path.join(supportDirectory.path, 'GravityDesktopApp'),
    );

    await databaseDirectory.create(recursive: true);

    final databaseFile = File(
      path.join(databaseDirectory.path, 'gravity_desktop.sqlite'),
    );

    return NativeDatabase.createInBackground(databaseFile);
  });
}
