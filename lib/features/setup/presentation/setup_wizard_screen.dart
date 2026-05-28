import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_desktop_app_v2/app/localization/localization_extensions.dart';
import 'package:gravity_desktop_app_v2/app/theme/spacing_tokens.dart';
import 'package:gravity_desktop_app_v2/app/widgets/gravity_button.dart';
import 'package:gravity_desktop_app_v2/app/widgets/gravity_status_chip.dart';
import 'package:gravity_desktop_app_v2/app/widgets/gravity_text_field.dart';
import 'package:gravity_desktop_app_v2/features/setup/presentation/setup_notifier.dart';

class SetupWizardScreen extends ConsumerStatefulWidget {
  const SetupWizardScreen({super.key});

  @override
  ConsumerState<SetupWizardScreen> createState() => _SetupWizardScreenState();
}

class _SetupWizardScreenState extends ConsumerState<SetupWizardScreen> {
  late final TextEditingController _adminPasswordController;
  late final TextEditingController _confirmPasswordController;
  late final List<_CatalogRowControllers> _catalogControllers;

  @override
  void initState() {
    super.initState();
    final initialState = ref.read(setupNotifierProvider);
    _adminPasswordController = TextEditingController(
      text: initialState.adminPassword,
    );
    _confirmPasswordController = TextEditingController(
      text: initialState.confirmPassword,
    );
    _catalogControllers = initialState.catalogDrafts
        .map(_CatalogRowControllers.fromDraft)
        .toList(growable: false);
  }

  @override
  void dispose() {
    _adminPasswordController.dispose();
    _confirmPasswordController.dispose();
    for (final controller in _catalogControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(setupNotifierProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _SetupHeader(state: state),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 980),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        border: Border.all(color: theme.colorScheme.outline),
                        borderRadius: AppRadius.mdBorder,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.xl),
                        child: AnimatedSwitcher(
                          duration: AppMotion.fast,
                          child: _buildCurrentStep(state),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            _SetupActionsBar(state: state),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentStep(SetupState state) {
    return switch (state.step) {
      SetupWizardStep.password => _PasswordStep(
        key: const ValueKey('setup.step.password'),
        adminPasswordController: _adminPasswordController,
        confirmPasswordController: _confirmPasswordController,
      ),
      SetupWizardStep.restore => const _RestoreStep(
        key: ValueKey('setup.step.restore'),
      ),
      SetupWizardStep.cloud => const _CloudStep(
        key: ValueKey('setup.step.cloud'),
      ),
      SetupWizardStep.catalog => _CatalogStep(
        key: const ValueKey('setup.step.catalog'),
        controllers: _catalogControllers,
      ),
    };
  }
}

class _SetupHeader extends StatelessWidget {
  const _SetupHeader({required this.state});

  final SetupState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final labels = [
      l10n.labelSetupStepPassword,
      l10n.labelSetupStepRestore,
      l10n.labelSetupStepCloud,
      l10n.labelSetupStepCatalog,
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.lg,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        border: Border(bottom: BorderSide(color: theme.colorScheme.outline)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.titleFirstRunSetupWizard,
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.msgFirstRunSetupIntro,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.xs,
            children: [
              for (var i = 0; i < labels.length; i++)
                if (i < state.stepIndex)
                  GravityStatusChip(
                    key: Key('setup.step.chip.$i'),
                    label: labels[i],
                    tone: GravityStatusTone.active,
                    icon: Icons.check,
                    filled: false,
                    compact: true,
                    showDot: false,
                  )
                else
                  GravityStatusChip.sync(
                    key: Key('setup.step.chip.$i'),
                    label: labels[i],
                    tone: i == state.stepIndex
                        ? GravityStatusTone.cloudOk
                        : GravityStatusTone.neutral,
                  ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PasswordStep extends ConsumerWidget {
  const _PasswordStep({
    super.key,
    required this.adminPasswordController,
    required this.confirmPasswordController,
  });

  final TextEditingController adminPasswordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(setupNotifierProvider);
    final notifier = ref.read(setupNotifierProvider.notifier);
    final l10n = context.l10n;

    return _StepBody(
      title: l10n.titleSetupPasswordStep,
      description: l10n.msgSetupPasswordIntro,
      child: Column(
        children: [
          GravityTextField.blind(
            key: const Key('setup.adminPassword'),
            controller: adminPasswordController,
            label: l10n.labelAdminPassword,
            revealTooltip: l10n.tooltipRevealPassword,
            hideTooltip: l10n.tooltipHidePassword,
            textInputAction: TextInputAction.next,
            autofocus: true,
            onChanged: notifier.updatePassword,
            errorText: _passwordErrorText(context, state),
          ),
          const SizedBox(height: AppSpacing.md),
          GravityTextField.blind(
            key: const Key('setup.confirmPassword'),
            controller: confirmPasswordController,
            label: l10n.labelConfirmAdminPassword,
            revealTooltip: l10n.tooltipRevealPassword,
            hideTooltip: l10n.tooltipHidePassword,
            textInputAction: TextInputAction.done,
            onChanged: notifier.updateConfirmPassword,
            onFieldSubmitted: (_) => notifier.goNext(),
          ),
        ],
      ),
    );
  }

  String? _passwordErrorText(BuildContext context, SetupState state) {
    final l10n = context.l10n;
    if (state.adminPassword.isEmpty && state.confirmPassword.isEmpty) {
      return null;
    }
    return switch (state.passwordValidationCode) {
      'admin_password_min_6' => l10n.msgInvalidSetupPasswordLength,
      'admin_password_mismatch' => l10n.msgAdminPasswordMismatch,
      _ => null,
    };
  }
}

class _RestoreStep extends ConsumerWidget {
  const _RestoreStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(setupNotifierProvider);
    final l10n = context.l10n;
    final status = switch (state.restoreStatus) {
      SetupRestoreStatus.restoring => GravityStatusChip.sync(
        label: l10n.labelRestoring,
        tone: GravityStatusTone.neutral,
      ),
      SetupRestoreStatus.restored => GravityStatusChip.sync(
        label: l10n.msgRestoreSuccess,
        tone: GravityStatusTone.cloudOk,
      ),
      SetupRestoreStatus.failed => GravityStatusChip.sync(
        label: state.restoreMessage ?? l10n.msgRestoreFailed,
        tone: GravityStatusTone.cloudError,
      ),
      SetupRestoreStatus.idle => GravityStatusChip.sync(
        label: l10n.labelOptional,
        tone: GravityStatusTone.neutral,
      ),
    };

    return _StepBody(
      title: l10n.titleSetupRestoreStep,
      description: l10n.msgSetupRestoreIntro,
      trailing: status,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GravityButton.secondary(
            key: const Key('setup.selectDbFile'),
            label: l10n.btnSelectDbFile,
            leadingIcon: Icons.folder_open_outlined,
            onPressed: state.restoreStatus == SetupRestoreStatus.restoring
                ? null
                : () => _selectAndRestore(context, ref),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            l10n.msgRestoreSkipHint,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Future<void> _selectAndRestore(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final file = await openFile(
      acceptedTypeGroups: [
        XTypeGroup(
          label: l10n.labelSqliteDatabaseFile,
          extensions: const ['db', 'sqlite', 'sqlite3'],
        ),
      ],
    );
    if (file == null) {
      return;
    }
    await ref
        .read(setupNotifierProvider.notifier)
        .restoreFromFile(File(file.path));
  }
}

class _CloudStep extends ConsumerWidget {
  const _CloudStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(setupNotifierProvider);
    final l10n = context.l10n;
    final status = switch (state.cloudStatus) {
      SetupCloudStatus.checking => GravityStatusChip.sync(
        label: l10n.labelChecking,
        tone: GravityStatusTone.neutral,
      ),
      SetupCloudStatus.configDetected => GravityStatusChip.sync(
        label: l10n.msgCloudTestSuccess,
        tone: GravityStatusTone.cloudOk,
      ),
      SetupCloudStatus.failed => GravityStatusChip.sync(
        label: l10n.msgCloudTestFailed,
        tone: GravityStatusTone.cloudError,
      ),
      SetupCloudStatus.skipped => GravityStatusChip.sync(
        label: l10n.msgCloudSetupSkipped,
        tone: GravityStatusTone.neutral,
      ),
      SetupCloudStatus.notTested => GravityStatusChip.sync(
        label: l10n.labelOptional,
        tone: GravityStatusTone.neutral,
      ),
    };

    return _StepBody(
      title: l10n.titleSetupCloudStep,
      description: l10n.msgSetupCloudIntro,
      trailing: status,
      child: Wrap(
        spacing: AppSpacing.sm,
        runSpacing: AppSpacing.sm,
        children: [
          GravityButton.secondary(
            key: const Key('setup.testGcp'),
            label: l10n.btnTestGcp,
            leadingIcon: Icons.cloud_sync_outlined,
            onPressed: state.cloudStatus == SetupCloudStatus.checking
                ? null
                : ref
                      .read(setupNotifierProvider.notifier)
                      .checkCloudConfiguration,
          ),
          GravityButton.primary(
            key: const Key('setup.skipGcp'),
            label: l10n.btnSkipGcp,
            leadingIcon: Icons.cloud_off_outlined,
            onPressed: ref.read(setupNotifierProvider.notifier).skipCloudSetup,
          ),
        ],
      ),
    );
  }
}

class _CatalogStep extends ConsumerWidget {
  const _CatalogStep({super.key, required this.controllers});

  final List<_CatalogRowControllers> controllers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(setupNotifierProvider);
    final l10n = context.l10n;

    return _StepBody(
      title: l10n.titleSetupCatalogStep,
      description: l10n.msgSetupCatalogIntro,
      trailing: GravityStatusChip.sync(
        label: l10n.labelEditableDefaults,
        tone: GravityStatusTone.cloudOk,
      ),
      child: Column(
        children: [
          for (var i = 0; i < state.catalogDrafts.length; i++)
            Padding(
              padding: EdgeInsets.only(
                bottom: i == state.catalogDrafts.length - 1 ? 0 : AppSpacing.md,
              ),
              child: _CatalogDraftRow(
                index: i,
                draft: state.catalogDrafts[i],
                controllers: controllers[i],
              ),
            ),
          if (!state.canFinishCatalog) ...[
            const SizedBox(height: AppSpacing.sm),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                state.hasDuplicateEnabledSku
                    ? l10n.msgDuplicateCatalogSku
                    : l10n.msgInvalidCatalogRow,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ],
          if (state.restoreMessage == 'setup_finish_failed') ...[
            const SizedBox(height: AppSpacing.sm),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                l10n.msgSetupFinishFailed,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _CatalogDraftRow extends ConsumerWidget {
  const _CatalogDraftRow({
    required this.index,
    required this.draft,
    required this.controllers,
  });

  final int index;
  final SetupCatalogDraft draft;
  final _CatalogRowControllers controllers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final notifier = ref.read(setupNotifierProvider.notifier);

    void update(SetupCatalogDraft updated) {
      notifier.updateCatalogDraft(index, updated);
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border: Border.all(color: theme.colorScheme.outline),
        borderRadius: AppRadius.mdBorder,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: GravityTextField(
                key: Key('setup.catalog.name.$index'),
                controller: controllers.name,
                label: l10n.labelProductName,
                onChanged: (value) => update(draft.copyWith(name: value)),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              flex: 3,
              child: GravityTextField.money(
                key: Key('setup.catalog.price.$index'),
                controller: controllers.price,
                label: l10n.labelProductPrice,
                suffixText: 'SYP',
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) =>
                    update(draft.copyWith(unitPriceText: value)),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              flex: 2,
              child: GravityTextField(
                key: Key('setup.catalog.stock.$index'),
                controller: controllers.stock,
                label: l10n.labelProductStock,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textAlign: TextAlign.end,
                onChanged: (value) => update(draft.copyWith(stockText: value)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CatalogRowControllers {
  _CatalogRowControllers({
    required this.name,
    required this.price,
    required this.stock,
  });

  factory _CatalogRowControllers.fromDraft(SetupCatalogDraft draft) {
    return _CatalogRowControllers(
      name: TextEditingController(text: draft.name),
      price: TextEditingController(text: draft.unitPriceText),
      stock: TextEditingController(text: draft.stockText),
    );
  }

  final TextEditingController name;
  final TextEditingController price;
  final TextEditingController stock;

  void dispose() {
    name.dispose();
    price.dispose();
    stock.dispose();
  }
}

class _SetupActionsBar extends ConsumerWidget {
  const _SetupActionsBar({required this.state});

  final SetupState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final notifier = ref.read(setupNotifierProvider.notifier);
    final isLastStep = state.step == SetupWizardStep.catalog;
    final canPressPrimary = switch (state.step) {
      SetupWizardStep.password => state.canContinueFromPassword,
      SetupWizardStep.restore =>
        state.restoreStatus != SetupRestoreStatus.restoring,
      SetupWizardStep.cloud => state.cloudStatus != SetupCloudStatus.checking,
      SetupWizardStep.catalog => state.canFinishCatalog && !state.isFinishing,
    };

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GravityButton.secondary(
            key: const Key('setup.backButton'),
            label: l10n.btnBack,
            leadingIcon: Icons.arrow_back_outlined,
            onPressed: state.stepIndex == 0 || state.isFinishing
                ? null
                : notifier.goBack,
          ),
          const SizedBox(width: AppSpacing.sm),
          GravityButton.primary(
            key: const Key('setup.nextButton'),
            label: isLastStep ? l10n.btnFinish : l10n.btnNext,
            leadingIcon: isLastStep
                ? Icons.check_circle_outline
                : Icons.arrow_forward_outlined,
            onPressed: canPressPrimary
                ? (isLastStep ? notifier.finishSetup : notifier.goNext)
                : null,
          ),
        ],
      ),
    );
  }
}

class _StepBody extends StatelessWidget {
  const _StepBody({
    required this.title,
    required this.description,
    required this.child,
    this.trailing,
  });

  final String title;
  final String description;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      key: ValueKey<String>(title),
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Text(title, style: theme.textTheme.headlineSmall)),
            if (trailing != null) ...[
              const SizedBox(width: AppSpacing.md),
              trailing!,
            ],
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          description,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        child,
      ],
    );
  }
}
