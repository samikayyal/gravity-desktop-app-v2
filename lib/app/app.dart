import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_desktop_app_v2/app/layout/scaled_app_shell.dart';
import 'package:gravity_desktop_app_v2/app/layout/split_panel_layout.dart';
import 'package:gravity_desktop_app_v2/app/localization/app_supported_locales.dart';
import 'package:gravity_desktop_app_v2/app/localization/localization_extensions.dart';
import 'package:gravity_desktop_app_v2/app/providers.dart';
import 'package:gravity_desktop_app_v2/app/theme/app_theme.dart';
import 'package:gravity_desktop_app_v2/app/theme/color_tokens.dart';
import 'package:gravity_desktop_app_v2/app/theme/spacing_tokens.dart';
import 'package:gravity_desktop_app_v2/core/config/system_settings_provider.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/domain/entities/startup_state.dart';
import 'package:gravity_desktop_app_v2/features/setup/presentation/setup_wizard_screen.dart';
import 'package:gravity_desktop_app_v2/l10n/app_localizations.dart';

class GravityApp extends ConsumerWidget {
  const GravityApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startupAsync = ref.watch(startupStateProvider);
    final localeAsync = ref.watch(appLocaleControllerProvider);
    final locale = localeAsync.valueOrNull ?? AppSupportedLocales.defaultLocale;
    final theme = AppTheme.lightForLocale(locale);

    return MaterialApp(
      onGenerateTitle: (context) => context.l10n.titleApp,
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: theme,
      darkTheme: theme,
      themeMode: ThemeMode.light,
      home: startupAsync.when(
        data: (state) {
          switch (state) {
            case StartupState.complete:
              final settingsAsync = ref.watch(systemSettingsControllerProvider);
              return settingsAsync.when(
                data: (settings) =>
                    const ScaledAppShell(scale: 1.0, child: SplitPanelLayout()),
                loading: () => const _StartupLoadingScreen(),
                error: (error, stackTrace) =>
                    _DatabaseRescueScreen(error: error),
              );
            case StartupState.needsSetup:
              return const SetupWizardScreen();
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
    final l10n = context.l10n;

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
                                l10n.titleDatabaseRescueConsole,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  color: appColors.statusStockNegative,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                l10n.titleCriticalDatabaseStartupFailure,
                                style: theme.textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      l10n.msgDatabaseStartupFailure,
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
                            l10n.labelErrorDetails,
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
                          label: Text(l10n.btnRetryConnection),
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
                          label: Text(l10n.btnImportGcpBackup),
                          onPressed: () {
                            showDialog<void>(
                              context: context,
                              builder: (dialogContext) {
                                return AlertDialog(
                                  title: Text(l10n.titleManualRestoreGuide),
                                  content: Text(l10n.msgManualRestoreGuide),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(dialogContext).pop(),
                                      child: Text(l10n.btnOk),
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
    final l10n = context.l10n;

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
            Text(
              l10n.labelDatabaseFileLocation,
              style: theme.textTheme.labelLarge,
            ),
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
                  tooltip: l10n.labelCopyFilePath,
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: dbPath));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.msgDatabasePathCopied),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              l10n.msgKeepCorruptedDatabaseCopy,
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
