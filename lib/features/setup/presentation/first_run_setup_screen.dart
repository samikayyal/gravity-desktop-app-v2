import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_radii.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../domain/setup/first_run_setup.dart';

enum SetupMode { newInstallation, restoreBackup }

class FirstRunSetupScreen extends ConsumerStatefulWidget {
  const FirstRunSetupScreen({super.key});

  @override
  ConsumerState<FirstRunSetupScreen> createState() =>
      _FirstRunSetupScreenState();
}

class _FirstRunSetupScreenState extends ConsumerState<FirstRunSetupScreen> {
  final _adminPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _bucketNameController = TextEditingController();
  final _bucketPrefixController = TextEditingController(text: 'gravity');
  final _socksPriceController = TextEditingController();
  final _socksStockController = TextEditingController();
  final _socksLowStockController = TextEditingController();
  final _waterPriceController = TextEditingController();
  final _waterStockController = TextEditingController();
  final _waterLowStockController = TextEditingController();

  SetupMode _mode = SetupMode.newInstallation;
  var _credentialsConfigured = false;
  var _submitting = false;
  List<SetupValidationIssue> _issues = const [];
  String? _formError;

  @override
  void dispose() {
    _adminPasswordController.dispose();
    _confirmPasswordController.dispose();
    _bucketNameController.dispose();
    _bucketPrefixController.dispose();
    _socksPriceController.dispose();
    _socksStockController.dispose();
    _socksLowStockController.dispose();
    _waterPriceController.dispose();
    _waterStockController.dispose();
    _waterLowStockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gravity Front Desk')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'First-run setup',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Cashier operations are blocked until setup is complete.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  SegmentedButton<SetupMode>(
                    segments: const [
                      ButtonSegment(
                        value: SetupMode.newInstallation,
                        icon: Icon(Icons.add_business_outlined),
                        label: Text('New Installation'),
                      ),
                      ButtonSegment(
                        value: SetupMode.restoreBackup,
                        icon: Icon(Icons.restore_outlined),
                        label: Text('Restore Backup'),
                      ),
                    ],
                    selected: {_mode},
                    onSelectionChanged: (selected) {
                      setState(() {
                        _mode = selected.single;
                        _issues = const [];
                        _formError = null;
                      });
                    },
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  if (_mode == SetupMode.newInstallation)
                    _NewInstallationPanel(
                      submitting: _submitting,
                      credentialsConfigured: _credentialsConfigured,
                      issues: _issues,
                      formError: _formError,
                      adminPasswordController: _adminPasswordController,
                      confirmPasswordController: _confirmPasswordController,
                      bucketNameController: _bucketNameController,
                      bucketPrefixController: _bucketPrefixController,
                      socksPriceController: _socksPriceController,
                      socksStockController: _socksStockController,
                      socksLowStockController: _socksLowStockController,
                      waterPriceController: _waterPriceController,
                      waterStockController: _waterStockController,
                      waterLowStockController: _waterLowStockController,
                      onCredentialsChanged: (value) {
                        setState(() => _credentialsConfigured = value);
                      },
                      onSubmit: _completeNewInstallation,
                    )
                  else
                    const _RestorePanel(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _completeNewInstallation() async {
    setState(() {
      _submitting = true;
      _issues = const [];
      _formError = null;
    });

    final draft = NewInstallationSetupDraft(
      adminPassword: _adminPasswordController.text,
      confirmAdminPassword: _confirmPasswordController.text,
      backupBucketName: _bucketNameController.text,
      backupBucketPrefix: _bucketPrefixController.text,
      backupCredentialsConfigured: _credentialsConfigured,
      socks: ProductSetupDraft(
        code: 'socks',
        name: 'Socks',
        priceSyp: _parseWholeNumber(_socksPriceController.text),
        startingStock: _parseWholeNumber(_socksStockController.text),
        lowStockThreshold: _parseWholeNumber(_socksLowStockController.text),
      ),
      waterBottle: ProductSetupDraft(
        code: 'water_bottle',
        name: 'Water Bottle',
        priceSyp: _parseWholeNumber(_waterPriceController.text),
        startingStock: _parseWholeNumber(_waterStockController.text),
        lowStockThreshold: _parseWholeNumber(_waterLowStockController.text),
      ),
    );

    try {
      await ref
          .read(firstRunSetupServiceProvider)
          .completeNewInstallation(draft);
      ref.invalidate(setupSnapshotProvider);
    } on SetupValidationException catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _issues = error.issues;
        _submitting = false;
      });
    } on Object {
      if (!mounted) {
        return;
      }
      setState(() {
        _formError =
            'Setup could not complete safely. No cashier data was opened.';
        _submitting = false;
      });
    }
  }

  int _parseWholeNumber(String value) {
    return int.tryParse(value.trim()) ?? -1;
  }
}

class _NewInstallationPanel extends StatelessWidget {
  const _NewInstallationPanel({
    required this.submitting,
    required this.credentialsConfigured,
    required this.issues,
    required this.formError,
    required this.adminPasswordController,
    required this.confirmPasswordController,
    required this.bucketNameController,
    required this.bucketPrefixController,
    required this.socksPriceController,
    required this.socksStockController,
    required this.socksLowStockController,
    required this.waterPriceController,
    required this.waterStockController,
    required this.waterLowStockController,
    required this.onCredentialsChanged,
    required this.onSubmit,
  });

  final bool submitting;
  final bool credentialsConfigured;
  final List<SetupValidationIssue> issues;
  final String? formError;
  final TextEditingController adminPasswordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController bucketNameController;
  final TextEditingController bucketPrefixController;
  final TextEditingController socksPriceController;
  final TextEditingController socksStockController;
  final TextEditingController socksLowStockController;
  final TextEditingController waterPriceController;
  final TextEditingController waterStockController;
  final TextEditingController waterLowStockController;
  final ValueChanged<bool> onCredentialsChanged;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (formError != null) ...[
          _StatusMessage(
            title: 'Setup failed',
            message: formError!,
            tone: _StatusTone.error,
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
        if (issues.isNotEmpty) ...[
          _StatusMessage(
            title: 'Required setup is incomplete',
            message: issues.map(_issueText).join('\n'),
            tone: _StatusTone.error,
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
        Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.lg,
          children: [
            _SetupSection(
              title: 'Admin Password',
              width: 352,
              child: Column(
                children: [
                  _SetupTextField(
                    label: 'Admin password',
                    controller: adminPasswordController,
                    obscureText: true,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _SetupTextField(
                    label: 'Confirm admin password',
                    controller: confirmPasswordController,
                    obscureText: true,
                  ),
                ],
              ),
            ),
            _SetupSection(
              title: 'GCP Backup',
              width: 352,
              child: Column(
                children: [
                  _SetupTextField(
                    label: 'Bucket name',
                    controller: bucketNameController,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _SetupTextField(
                    label: 'Installation prefix',
                    controller: bucketPrefixController,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    value: credentialsConfigured,
                    onChanged: (value) {
                      onCredentialsChanged(value ?? false);
                    },
                    title: const Text(
                      'GCP credentials are configured on this computer',
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ],
              ),
            ),
            _ProductSection(
              title: 'Socks',
              priceController: socksPriceController,
              stockController: socksStockController,
              lowStockController: socksLowStockController,
            ),
            _ProductSection(
              title: 'Water Bottles',
              priceController: waterPriceController,
              stockController: waterStockController,
              lowStockController: waterLowStockController,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xl),
        Align(
          alignment: Alignment.centerRight,
          child: FilledButton.icon(
            onPressed: submitting ? null : onSubmit,
            icon: submitting
                ? const SizedBox.square(
                    dimension: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.check_circle_outline),
            label: Text(submitting ? 'Completing setup' : 'Complete setup'),
          ),
        ),
      ],
    );
  }

  String _issueText(SetupValidationIssue issue) {
    return switch (issue) {
      SetupValidationIssue.adminPasswordRequired => 'Enter the admin password.',
      SetupValidationIssue.adminPasswordConfirmationMismatch =>
        'Admin password confirmation must match.',
      SetupValidationIssue.backupBucketRequired => 'Enter the GCP bucket name.',
      SetupValidationIssue.backupPrefixRequired =>
        'Enter the installation backup prefix.',
      SetupValidationIssue.backupCredentialsRequired =>
        'Confirm that GCP credentials are configured on this Windows computer.',
      SetupValidationIssue.socksPriceInvalid =>
        'Enter a whole SYP amount for socks.',
      SetupValidationIssue.socksStartingStockInvalid =>
        'Enter a whole starting stock quantity for socks.',
      SetupValidationIssue.socksLowStockThresholdInvalid =>
        'Enter a whole low-stock threshold for socks.',
      SetupValidationIssue.waterBottlePriceInvalid =>
        'Enter a whole SYP amount for water bottles.',
      SetupValidationIssue.waterBottleStartingStockInvalid =>
        'Enter a whole starting stock quantity for water bottles.',
      SetupValidationIssue.waterBottleLowStockThresholdInvalid =>
        'Enter a whole low-stock threshold for water bottles.',
      SetupValidationIssue.backupIntervalInvalid =>
        'Backup interval must be greater than zero minutes.',
      SetupValidationIssue.staleSessionThresholdInvalid =>
        'Stale-session threshold must be greater than zero minutes.',
    };
  }
}

class _ProductSection extends StatelessWidget {
  const _ProductSection({
    required this.title,
    required this.priceController,
    required this.stockController,
    required this.lowStockController,
  });

  final String title;
  final TextEditingController priceController;
  final TextEditingController stockController;
  final TextEditingController lowStockController;

  @override
  Widget build(BuildContext context) {
    return _SetupSection(
      title: title,
      width: 352,
      child: Column(
        children: [
          _SetupTextField(
            label: 'Price SYP',
            controller: priceController,
            numeric: true,
          ),
          const SizedBox(height: AppSpacing.md),
          _SetupTextField(
            label: 'Starting stock',
            controller: stockController,
            numeric: true,
          ),
          const SizedBox(height: AppSpacing.md),
          _SetupTextField(
            label: 'Low-stock threshold',
            controller: lowStockController,
            numeric: true,
          ),
        ],
      ),
    );
  }
}

class _RestorePanel extends StatelessWidget {
  const _RestorePanel();

  @override
  Widget build(BuildContext context) {
    return _SetupSection(
      title: 'Restore Existing Backup',
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _StatusMessage(
            title: 'Restore is protected',
            message:
                'Restore will require a verified backup manifest, matching checksum, admin password verification, and a local safety copy before replacing the active database.',
            tone: _StatusTone.info,
          ),
          const SizedBox(height: AppSpacing.lg),
          FilledButton.icon(
            onPressed: null,
            icon: const Icon(Icons.restore_outlined),
            label: const Text('Restore backup'),
          ),
        ],
      ),
    );
  }
}

class _SetupSection extends StatelessWidget {
  const _SetupSection({
    required this.title,
    required this.child,
    required this.width,
  });

  final String title;
  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(color: AppColors.borderDefault),
          borderRadius: BorderRadius.circular(AppRadii.lg),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: AppSpacing.lg),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

class _SetupTextField extends StatelessWidget {
  const _SetupTextField({
    required this.label,
    required this.controller,
    this.numeric = false,
    this.obscureText = false,
  });

  final String label;
  final TextEditingController controller;
  final bool numeric;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: numeric ? TextInputType.number : TextInputType.text,
      inputFormatters: numeric
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
      decoration: InputDecoration(labelText: label),
    );
  }
}

enum _StatusTone { error, info }

class _StatusMessage extends StatelessWidget {
  const _StatusMessage({
    required this.title,
    required this.message,
    required this.tone,
  });

  final String title;
  final String message;
  final _StatusTone tone;

  @override
  Widget build(BuildContext context) {
    final colors = switch (tone) {
      _StatusTone.error => (
        background: AppColors.statusBackupFailureBg,
        foreground: AppColors.statusBackupFailureFg,
        border: AppColors.statusBackupFailureBorder,
      ),
      _StatusTone.info => (
        background: AppColors.statusInfoBg,
        foreground: AppColors.statusInfoFg,
        border: AppColors.statusInfoBorder,
      ),
    };

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.background,
        border: Border.all(color: colors.border),
        borderRadius: BorderRadius.circular(AppRadii.md),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: colors.foreground,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              message,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: colors.foreground),
            ),
          ],
        ),
      ),
    );
  }
}
