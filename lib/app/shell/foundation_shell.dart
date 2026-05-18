import 'package:flutter/material.dart';

import '../../domain/setup/first_run_setup.dart';
import '../theme/app_colors.dart';
import '../theme/app_radii.dart';
import '../theme/app_spacing.dart';

class FoundationShell extends StatelessWidget {
  const FoundationShell({super.key, this.setupSnapshot});

  final SetupSnapshot? setupSnapshot;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final backupWarning = setupSnapshot?.hasBackupWarning ?? false;

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
                  Text('Setup complete', style: textTheme.headlineSmall),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Cashier operations are still waiting for the next feature slices.',
                    style: textTheme.bodyLarge,
                  ),
                  if (backupWarning) ...[
                    const SizedBox(height: AppSpacing.lg),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.statusBackupFailureBg,
                        border: Border.all(
                          color: AppColors.statusBackupFailureBorder,
                        ),
                        borderRadius: BorderRadius.circular(AppRadii.md),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Text(
                          setupSnapshot?.firstBackupMessage ??
                              'First backup upload failed.',
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppColors.statusBackupFailureFg,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
