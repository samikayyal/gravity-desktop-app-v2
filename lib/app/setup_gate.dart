import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/setup/presentation/first_run_setup_screen.dart';
import 'providers.dart';
import 'shell/foundation_shell.dart';
import 'theme/app_spacing.dart';

class SetupGate extends ConsumerWidget {
  const SetupGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapshot = ref.watch(setupSnapshotProvider);

    return snapshot.when(
      data: (setup) {
        if (setup.isSetupComplete) {
          return FoundationShell(setupSnapshot: setup);
        }

        return const FirstRunSetupScreen();
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stackTrace) => Scaffold(
        appBar: AppBar(title: const Text('Gravity Front Desk')),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Setup status could not be loaded',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    'Restart the app. If this keeps happening, check the local database and logs.',
                    style: Theme.of(context).textTheme.bodyMedium,
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
