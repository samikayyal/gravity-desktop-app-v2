import 'package:flutter/material.dart';
import 'package:gravity_desktop_app_v2/app/theme/spacing_tokens.dart';

class FirstRunSetupPlaceholder extends StatelessWidget {
  const FirstRunSetupPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Card(
            margin: const EdgeInsets.all(AppSpacing.lg),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.settings_suggest_outlined,
                      size: 32,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'First-Run Setup Wizard',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Welcome to Gravity Cashier! Initialize your local administrator password, verify backup bucket configurations, and seed the default product catalogs.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Launch Setup Wizard'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
