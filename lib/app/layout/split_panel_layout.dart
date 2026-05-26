import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_desktop_app_v2/app/localization/app_supported_locales.dart';
import 'package:gravity_desktop_app_v2/app/localization/cashier_formatters.dart';
import 'package:gravity_desktop_app_v2/app/localization/localization_extensions.dart';
import 'package:gravity_desktop_app_v2/app/providers.dart';
import 'package:gravity_desktop_app_v2/app/theme/spacing_tokens.dart';
import 'package:gravity_desktop_app_v2/app/widgets/gravity_split_scaffold.dart';
import 'package:gravity_desktop_app_v2/app/widgets/gravity_status_chip.dart';

class SplitPanelLayout extends StatefulWidget {
  const SplitPanelLayout({super.key});

  @override
  State<SplitPanelLayout> createState() => _SplitPanelLayoutState();
}

class _SplitPanelLayoutState extends State<SplitPanelLayout> {
  static const int _settingsIndex = 5;

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.l10n;
    final isSettingsSelected = _selectedIndex == _settingsIndex;

    return GravitySplitScaffold(
      leadingNavigation: NavigationRail(
        key: const Key('mainNavigationRail'),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        labelType: NavigationRailLabelType.all,
        destinations: [
          NavigationRailDestination(
            icon: const Icon(Icons.dashboard_outlined),
            selectedIcon: const Icon(Icons.dashboard),
            label: Text(l10n.labelBoard),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.people_alt_outlined),
            selectedIcon: const Icon(Icons.people_alt),
            label: Text(l10n.labelPlayers),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.shopping_bag_outlined),
            selectedIcon: const Icon(Icons.shopping_bag),
            label: Text(l10n.labelProducts),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.inventory_2_outlined),
            selectedIcon: const Icon(Icons.inventory_2),
            label: Text(l10n.labelInventory),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.analytics_outlined),
            selectedIcon: const Icon(Icons.analytics),
            label: Text(l10n.labelReports),
          ),
          NavigationRailDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: Text(l10n.labelSettings),
          ),
        ],
      ),
      leftPanel: DecoratedBox(
        decoration: BoxDecoration(color: theme.scaffoldBackgroundColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, l10n.titleActiveBoard, Icons.timer_outlined),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.md),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _ActiveSessionPlaceholder(index: index);
                },
              ),
            ),
          ],
        ),
      ),
      rightPanel: DecoratedBox(
        key: ValueKey<String>(
          isSettingsSelected
              ? 'splitPanel.rightPanel.settings'
              : 'splitPanel.rightPanel.action',
        ),
        decoration: BoxDecoration(color: colorScheme.surface),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(
              context,
              isSettingsSelected ? l10n.titleSettings : l10n.titleActionPanel,
              Icons.bolt_outlined,
            ),
            Expanded(
              child: isSettingsSelected
                  ? const _SettingsLocalePanel()
                  : const _ActionPanelEmptyState(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String title, IconData icon) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          bottom: BorderSide(color: colorScheme.outline, width: 1),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: colorScheme.onSurface),
          const SizedBox(width: AppSpacing.sm),
          Text(title, style: theme.textTheme.titleLarge),
        ],
      ),
    );
  }
}

class _ActiveSessionPlaceholder extends StatelessWidget {
  const _ActiveSessionPlaceholder({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.l10n;
    final timerText = CashierFormatters.formatTimer(
      Duration(minutes: 60 - (index * 5)),
    );

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              child: Text(
                '${index + 1}',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: colorScheme.onPrimary,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.labelPlayerProfilePlaceholder(index + 1),
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    l10n.msgSessionSummary(60, '14:30'),
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              timerText,
              style: theme.dataTableTheme.dataTextStyle?.copyWith(
                color: colorScheme.onSurface,
                fontFeatures: const [FontFeature.tabularFigures()],
                fontFamily: theme.dataTableTheme.dataTextStyle?.fontFamily,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            GravityStatusChip.active(label: l10n.chipActive),
          ],
        ),
      ),
    );
  }
}

class _ActionPanelEmptyState extends StatelessWidget {
  const _ActionPanelEmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.l10n;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.analytics_outlined,
              size: 48,
              color: colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              l10n.titleNoActiveSelection,
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              l10n.msgNoActiveSelectionInstructions,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsLocalePanel extends ConsumerWidget {
  const _SettingsLocalePanel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final localeAsync = ref.watch(appLocaleControllerProvider);
    final selectedLocale = AppSupportedLocales.normalize(
      localeAsync.valueOrNull ?? Localizations.localeOf(context),
    );

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        Text(l10n.titleSettings, style: theme.textTheme.titleLarge),
        const SizedBox(height: AppSpacing.md),
        DropdownButtonFormField<Locale>(
          key: ValueKey<String>(selectedLocale.languageCode),
          initialValue: selectedLocale,
          isExpanded: true,
          decoration: InputDecoration(labelText: l10n.labelLanguage),
          items: [
            DropdownMenuItem<Locale>(
              value: AppSupportedLocales.english,
              child: Text(l10n.labelEnglishUs),
            ),
            DropdownMenuItem<Locale>(
              value: AppSupportedLocales.arabic,
              child: Text(l10n.labelArabicSyria),
            ),
          ],
          onChanged: (locale) async {
            if (locale == null) {
              return;
            }

            try {
              await ref
                  .read(appLocaleControllerProvider.notifier)
                  .setLocale(locale);
              if (!context.mounted) {
                return;
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.l10n.msgLanguageUpdated)),
              );
            } catch (_) {
              if (!context.mounted) {
                return;
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.l10n.msgLanguageUpdateFailed)),
              );
            }
          },
        ),
      ],
    );
  }
}
