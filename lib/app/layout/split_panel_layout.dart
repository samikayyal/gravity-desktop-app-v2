import 'package:flutter/material.dart';
import 'package:gravity_desktop_app_v2/app/theme/color_tokens.dart';
import 'package:gravity_desktop_app_v2/app/theme/spacing_tokens.dart';

class SplitPanelLayout extends StatefulWidget {
  const SplitPanelLayout({super.key});

  @override
  State<SplitPanelLayout> createState() => _SplitPanelLayoutState();
}

class _SplitPanelLayoutState extends State<SplitPanelLayout> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.dashboard_outlined),
                selectedIcon: Icon(Icons.dashboard),
                label: Text('Board'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people_alt_outlined),
                selectedIcon: Icon(Icons.people_alt),
                label: Text('Players'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.shopping_bag_outlined),
                selectedIcon: Icon(Icons.shopping_bag),
                label: Text('Products'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.inventory_2_outlined),
                selectedIcon: Icon(Icons.inventory_2),
                label: Text('Inventory'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.analytics_outlined),
                selectedIcon: Icon(Icons.analytics),
                label: Text('Reports'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),
          const VerticalDivider(width: 1, thickness: 1),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(
                          context,
                          'Active Board',
                          Icons.timer_outlined,
                        ),
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
                ),
                const VerticalDivider(width: 1, thickness: 1),
                Expanded(
                  flex: 4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: colorScheme.surface),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(
                          context,
                          'Action Panel',
                          Icons.bolt_outlined,
                        ),
                        const Expanded(child: _ActionPanelEmptyState()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
    final appColors = context.appColors;

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
                    'Player Profile Placeholder ${index + 1}',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    'Duration: 60 min | Check-in: 14:30',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xs,
                vertical: AppSpacing.xxs,
              ),
              decoration: BoxDecoration(
                color: appColors.statusSurface(
                  appColors.statusActive,
                  alpha: 0.12,
                ),
                borderRadius: AppRadius.smBorder,
                border: Border.all(
                  color: appColors.statusActive.withValues(alpha: 0.35),
                ),
              ),
              child: Text(
                'Active',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: appColors.statusActive,
                ),
              ),
            ),
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
              'No Active Selection',
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Select a player session from the Active Board or select a sidebar module to load cashier tasks.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
