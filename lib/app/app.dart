import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_desktop_app_v2/app/layout/split_panel_layout.dart';
import 'package:gravity_desktop_app_v2/app/providers.dart';
import 'package:gravity_desktop_app_v2/app/theme/app_theme.dart';
import 'package:gravity_desktop_app_v2/app/theme/color_tokens.dart';
import 'package:gravity_desktop_app_v2/app/theme/spacing_tokens.dart';
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
      theme: AppTheme.light,
      darkTheme: AppTheme.light,
      themeMode: ThemeMode.light,
      home: startupAsync.when(
        data: (state) {
          switch (state) {
            case StartupState.complete:
              return const SplitPanelLayout();
            case StartupState.needsSetup:
              return const FirstRunSetupPlaceholder();
          }
        },
        loading: () => const _StartupLoadingScreen(),
        error: (error, stackTrace) => _DatabaseRescueScreen(error: error),
      ),
    );
  }
}

class _StartupLoadingScreen extends StatelessWidget {
  const _StartupLoadingScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class _DatabaseRescueScreen extends ConsumerWidget {
  const _DatabaseRescueScreen({required this.error});

  final Object error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final appColors = context.appColors;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.xs),
                          decoration: BoxDecoration(
                            color: appColors.statusSurface(
                              appColors.statusOverdue,
                              alpha: 0.12,
                            ),
                            borderRadius: AppRadius.mdBorder,
                          ),
                          child: Icon(
                            Icons.gpp_bad_outlined,
                            size: 36,
                            color: appColors.statusStockNegative,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Database Rescue Console',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  color: appColors.statusStockNegative,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Critical Database Startup Failure',
                                style: theme.textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      'The local SQLite database failed to initialize. This error usually occurs due to file corruption, file locking, or incorrect folder write permissions.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        borderRadius: AppRadius.smBorder,
                        border: Border.all(color: colorScheme.outline),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Error Details:',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xxs),
                          SelectableText(
                            error.toString(),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.error,
                              fontFamily: 'Consolas',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    const _RescuePathDetails(),
                    const SizedBox(height: AppSpacing.lg),
                    const Divider(),
                    const SizedBox(height: AppSpacing.md),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton.icon(
                          icon: const Icon(Icons.refresh, size: 16),
                          label: const Text('Retry Connection'),
                          onPressed: () {
                            ref.invalidate(startupStateProvider);
                          },
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        ElevatedButton.icon(
                          icon: const Icon(
                            Icons.settings_backup_restore_outlined,
                            size: 16,
                          ),
                          label: const Text('Import GCP Backup'),
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
    );
  }
}

class _RescuePathDetails extends StatelessWidget {
  const _RescuePathDetails();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return FutureBuilder<File>(
      future: getDatabaseFile(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        final dbPath = snapshot.data!.path;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Database File Location:', style: theme.textTheme.labelLarge),
            const SizedBox(height: AppSpacing.xs),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: AppRadius.smBorder,
                      border: Border.all(color: colorScheme.outline),
                    ),
                    child: SelectableText(
                      dbPath,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                IconButton(
                  icon: const Icon(Icons.copy_all_outlined, size: 20),
                  tooltip: 'Copy File Path',
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: dbPath));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Database path copied to clipboard.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'TIP: Keep a copy of this corrupted database file before attempting recovery.',
              style: theme.textTheme.bodySmall?.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        );
      },
    );
  }
}
