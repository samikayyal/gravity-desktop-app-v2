import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_desktop_app/app/app.dart';
import 'package:gravity_desktop_app/app/providers.dart';
import 'package:gravity_desktop_app/core/backup/initial_backup_runner.dart';
import 'package:gravity_desktop_app/core/database/app_database.dart';
import 'package:gravity_desktop_app/domain/setup/first_run_setup.dart';

void main() {
  testWidgets('fresh app renders first-run setup gate', (tester) async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);

    await tester.pumpWidget(_testApp(database));
    await tester.pumpAndSettle();

    expect(find.text('Gravity Front Desk'), findsOneWidget);
    expect(find.text('First-run setup'), findsOneWidget);
    expect(find.text('New Installation'), findsOneWidget);
    expect(find.text('Restore Backup'), findsOneWidget);
  });

  testWidgets('new installation setup opens the post-setup shell', (
    tester,
  ) async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);

    await tester.pumpWidget(
      _testApp(
        database,
        backupRunner: const _FakeInitialBackupRunner(
          BackupAttemptResult.failure('network unavailable'),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final fields = find.byType(EditableText);
    expect(fields, findsNWidgets(10));
    await tester.enterText(fields.at(0), 'admin-secret');
    await tester.enterText(fields.at(1), 'admin-secret');
    await tester.enterText(fields.at(2), 'gravity-backups');
    await tester.enterText(fields.at(3), 'front-desk');
    await tester.enterText(fields.at(4), '25000');
    await tester.enterText(fields.at(5), '40');
    await tester.enterText(fields.at(6), '8');
    await tester.enterText(fields.at(7), '10000');
    await tester.enterText(fields.at(8), '24');
    await tester.enterText(fields.at(9), '6');
    await tester.ensureVisible(
      find.text('GCP credentials are configured on this computer'),
    );
    await tester.tap(
      find.text('GCP credentials are configured on this computer'),
    );
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Complete setup'));
    await tester.tap(find.text('Complete setup'));
    await tester.pumpAndSettle();

    expect(find.text('Setup complete'), findsOneWidget);
    expect(find.text('network unavailable'), findsOneWidget);
  });
}

Widget _testApp(
  AppDatabase database, {
  InitialBackupRunner backupRunner = const _FakeInitialBackupRunner(
    BackupAttemptResult.success(),
  ),
}) {
  return ProviderScope(
    overrides: [
      appDatabaseProvider.overrideWithValue(database),
      initialBackupRunnerProvider.overrideWithValue(backupRunner),
    ],
    child: const GravityDesktopApp(),
  );
}

class _FakeInitialBackupRunner implements InitialBackupRunner {
  const _FakeInitialBackupRunner(this.result);

  final BackupAttemptResult result;

  @override
  Future<BackupAttemptResult> attemptInitialBackup() async => result;
}
