import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_desktop_app_v2/app/layout/split_panel_layout.dart';
import 'package:gravity_desktop_app_v2/app/providers.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/domain/entities/startup_state.dart';
import 'package:gravity_desktop_app_v2/features/setup/presentation/first_run_setup_placeholder.dart';

class GravityApp extends ConsumerWidget {
  const GravityApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startupAsync = ref.watch(startupStateProvider);

    return MaterialApp(
      title: 'Gravity Cashier Desk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: const Color(0xFFFBF306), // Restrained Brand Yellow
        scaffoldBackgroundColor: const Color(
          0xFFF5F5F5,
        ), // Light gray background
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFBF306),
          brightness: Brightness.light,
          primary: const Color(0xFFFBF306),
          onPrimary: Colors.black,
          surface: Colors.white,
          onSurface: const Color(0xFF333333),
          outline: const Color(0xFFD5D5D5),
        ),
        fontFamily: 'Inter',
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF333333),
          elevation: 0,
          shape: Border(bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1)),
        ),
      ),
      home: startupAsync.when(
        data: (state) {
          switch (state) {
            case StartupState.complete:
              return const SplitPanelLayout();
            case StartupState.needsSetup:
              return const FirstRunSetupPlaceholder();
          }
        },
        loading: () => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFBF306)),
            ),
          ),
        ),
        error: (error, stackTrace) => Scaffold(
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.gpp_bad_outlined,
                                size: 36,
                                color: Colors.red.shade700,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Database Rescue Console',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red.shade900,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  const Text(
                                    'Critical Database Startup Failure',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'The local SQLite database failed to initialize. This error usually occurs due to file corruption, file locking, or incorrect folder write permissions.',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            color: Color(0xFF444444),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Error Details:',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),
                              SelectableText(
                                error.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Courier',
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        FutureBuilder<File>(
                          future: getDatabaseFile(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final dbPath = snapshot.data!.path;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Database File Location:',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          child: SelectableText(
                                            dbPath,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.copy_all_outlined,
                                          size: 20,
                                        ),
                                        tooltip: 'Copy File Path',
                                        onPressed: () {
                                          Clipboard.setData(
                                            ClipboardData(text: dbPath),
                                          );
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Database path copied to clipboard.',
                                              ),
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'TIP: Keep a copy of this corrupted database file before attempting recovery.',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                        const SizedBox(height: 24),
                        const Divider(),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton.icon(
                              icon: const Icon(Icons.refresh, size: 16),
                              label: const Text('Retry Connection'),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Color(0xFFD5D5D5),
                                ),
                                foregroundColor: Colors.black87,
                              ),
                              onPressed: () {
                                ref.invalidate(startupStateProvider);
                              },
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton.icon(
                              icon: const Icon(
                                Icons.settings_backup_restore_outlined,
                                size: 16,
                              ),
                              label: const Text('Import GCP Backup'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFBF306),
                                foregroundColor: Colors.black,
                                elevation: 0,
                              ),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (dialogContext) {
                                    return AlertDialog(
                                      title: const Text('Manual Restore Guide'),
                                      content: const Text(
                                        'GCP Cloud Backup Restoration tool will be fully integrated in Feature 04/22.\n\nTo recover your data for now, copy your backup file over the corrupted local file shown above.',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(dialogContext).pop(),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
