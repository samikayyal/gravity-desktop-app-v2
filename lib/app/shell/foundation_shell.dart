import 'package:flutter/material.dart';

import '../theme/app_radii.dart';
import '../theme/app_spacing.dart';

class FoundationShell extends StatelessWidget {
  const FoundationShell({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Gravity Front Desk')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: BorderRadius.circular(AppRadii.lg),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Setup pending', style: textTheme.headlineSmall),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'The Windows app foundation is ready for the first-run setup workflow.',
                    style: textTheme.bodyLarge,
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
