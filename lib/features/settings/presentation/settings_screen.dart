import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_desktop_app_v2/app/localization/cashier_formatters.dart';
import 'package:gravity_desktop_app_v2/app/localization/app_supported_locales.dart';
import 'package:gravity_desktop_app_v2/app/localization/localization_extensions.dart';
import 'package:gravity_desktop_app_v2/app/providers.dart';
import 'package:gravity_desktop_app_v2/app/theme/color_tokens.dart';
import 'package:gravity_desktop_app_v2/app/theme/spacing_tokens.dart';
import 'package:gravity_desktop_app_v2/app/widgets/gravity_button.dart';
import 'package:gravity_desktop_app_v2/app/widgets/gravity_data_table.dart';
import 'package:gravity_desktop_app_v2/app/widgets/gravity_text_field.dart';
import 'package:gravity_desktop_app_v2/core/audit/audit_providers.dart';
import 'package:gravity_desktop_app_v2/core/config/app_settings.dart';
import 'package:gravity_desktop_app_v2/core/config/system_settings_provider.dart';
import 'package:gravity_desktop_app_v2/core/security/admin_authorization.dart';
import 'package:gravity_desktop_app_v2/core/security/admin_auth_notifier.dart';
import 'package:gravity_desktop_app_v2/core/security/admin_password_dialog.dart';
import 'package:gravity_desktop_app_v2/data/repositories/audit_repository.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  double? _volumeDraft;
  bool _isSavingPublic = false;
  bool _isSavingAdmin = false;

  @override
  Widget build(BuildContext context) {
    final settingsAsync = ref.watch(systemSettingsControllerProvider);
    final adminAuthState = ref.watch(adminAuthControllerProvider);
    final adminAuthorization = adminAuthState.authorization;
    final isAdminUnlocked =
        adminAuthorization?.isActiveAt(DateTime.now()) ?? false;

    return settingsAsync.when(
      data: (settings) {
        _volumeDraft ??= settings.notificationVolumePercent.toDouble();

        return DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(
                    icon: const Icon(Icons.tune_outlined, size: 18),
                    text: context.l10n.titleCashierOptions,
                  ),
                  Tab(
                    icon: const Icon(Icons.admin_panel_settings, size: 18),
                    text: context.l10n.titleAdminOperations,
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _CashierSettingsTab(
                      settings: settings,
                      volumeDraft: _volumeDraft!,
                      isSaving: _isSavingPublic,
                      onVolumeDraftChanged: (value) {
                        setState(() {
                          _volumeDraft = value;
                        });
                      },
                      onSavePublic: _savePublicSettings,
                    ),
                    _AdminSettingsTab(
                      settings: settings,
                      isUnlocked: isAdminUnlocked,
                      authorization: isAdminUnlocked
                          ? adminAuthorization
                          : null,
                      isSaving: _isSavingAdmin,
                      onUnlockPressed: _showUnlockDialog,
                      onLockPressed: () =>
                          ref.read(adminAuthControllerProvider.notifier).lock(),
                      onSaveAdmin: _saveAdminSettings,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => _SettingsLoadError(
        onRetry: () => ref.invalidate(systemSettingsControllerProvider),
      ),
    );
  }

  Future<void> _savePublicSettings({
    bool? overdueAudioMuted,
    int? notificationVolumePercent,
    double? screenScale,
  }) async {
    setState(() {
      _isSavingPublic = true;
    });

    try {
      await ref
          .read(systemSettingsControllerProvider.notifier)
          .savePublicSettings(
            overdueAudioMuted: overdueAudioMuted,
            notificationVolumePercent: notificationVolumePercent,
            screenScale: screenScale,
          );
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.msgSettingsSaved)));
    } catch (_) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.msgSettingsSaveFailed)),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSavingPublic = false;
        });
      }
    }
  }

  Future<void> _saveAdminSettings(AppSettings settings) async {
    setState(() {
      _isSavingAdmin = true;
    });

    try {
      await ref
          .read(systemSettingsControllerProvider.notifier)
          .saveAdminSettings(settings);
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.msgSettingsSaved)));
    } catch (_) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.msgSettingsSaveFailed)),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSavingAdmin = false;
        });
      }
    }
  }

  Future<void> _showUnlockDialog() async {
    final unlocked = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => const AdminPasswordDialog(),
    );

    if (unlocked == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.msgAdminSettingsUnlocked)),
      );
    }
  }
}

class _CashierSettingsTab extends ConsumerWidget {
  const _CashierSettingsTab({
    required this.settings,
    required this.volumeDraft,
    required this.isSaving,
    required this.onVolumeDraftChanged,
    required this.onSavePublic,
  });

  final AppSettings settings;
  final double volumeDraft;
  final bool isSaving;
  final ValueChanged<double> onVolumeDraftChanged;
  final Future<void> Function({
    bool? overdueAudioMuted,
    int? notificationVolumePercent,
    double? screenScale,
  })
  onSavePublic;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final localeAsync = ref.watch(appLocaleControllerProvider);
    final selectedLocale = AppSupportedLocales.normalize(
      localeAsync.valueOrNull ?? Localizations.localeOf(context),
    );
    final volumePercent = volumeDraft.round();

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        Text(l10n.titleCashierOptions, style: theme.textTheme.titleLarge),
        const SizedBox(height: AppSpacing.md),
        DropdownButtonFormField<Locale>(
          key: ValueKey<String>(
            'settings.language.${selectedLocale.languageCode}',
          ),
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
          onChanged: isSaving
              ? null
              : (locale) async {
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
                      SnackBar(
                        content: Text(context.l10n.msgLanguageUpdateFailed),
                      ),
                    );
                  }
                },
        ),
        const SizedBox(height: AppSpacing.lg),
        _SectionHeader(
          icon: Icons.notifications_active_outlined,
          title: l10n.labelNotificationVolume,
          trailing: l10n.labelPercentValue(volumePercent),
        ),
        Slider(
          value: volumeDraft,
          min: 0,
          max: 100,
          divisions: 10,
          label: l10n.labelPercentValue(volumePercent),
          onChanged: isSaving || settings.overdueAudioMuted
              ? null
              : onVolumeDraftChanged,
          onChangeEnd: isSaving || settings.overdueAudioMuted
              ? null
              : (value) async {
                  await onSavePublic(notificationVolumePercent: value.round());
                },
        ),
        const SizedBox(height: AppSpacing.md),
        _AlarmSoundSelector(
          isMuted: settings.overdueAudioMuted,
          isSaving: isSaving,
          onChanged: (muted) async {
            await onSavePublic(overdueAudioMuted: muted);
          },
        ),
      ],
    );
  }
}

class _AdminSettingsTab extends StatelessWidget {
  const _AdminSettingsTab({
    required this.settings,
    required this.isUnlocked,
    required this.authorization,
    required this.isSaving,
    required this.onUnlockPressed,
    required this.onLockPressed,
    required this.onSaveAdmin,
  });

  final AppSettings settings;
  final bool isUnlocked;
  final AdminAuthorization? authorization;
  final bool isSaving;
  final VoidCallback onUnlockPressed;
  final VoidCallback onLockPressed;
  final Future<void> Function(AppSettings settings) onSaveAdmin;

  @override
  Widget build(BuildContext context) {
    final activeAuthorization = authorization;
    if (!isUnlocked || activeAuthorization == null) {
      return _LockedAdminSettings(onUnlockPressed: onUnlockPressed);
    }

    return _AdminSettingsForm(
      key: ValueKey<int>(settings.hashCode),
      settings: settings,
      authorization: activeAuthorization,
      isSaving: isSaving,
      onLockPressed: onLockPressed,
      onSave: onSaveAdmin,
    );
  }
}

class _LockedAdminSettings extends StatelessWidget {
  const _LockedAdminSettings({required this.onUnlockPressed});

  final VoidCallback onUnlockPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.l10n;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            border: Border.all(color: colorScheme.outline),
            borderRadius: AppRadius.mdBorder,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.lock_outline,
                size: 42,
                color: colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                l10n.titleAdminSettingsLocked,
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                l10n.msgAdminSettingsLockedDescription,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(height: AppSpacing.lg),
              GravityButton.primary(
                label: l10n.btnTapToEditAdminSettings,
                leadingIcon: Icons.lock_open_outlined,
                onPressed: onUnlockPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AdminSettingsForm extends StatefulWidget {
  const _AdminSettingsForm({
    super.key,
    required this.settings,
    required this.authorization,
    required this.isSaving,
    required this.onLockPressed,
    required this.onSave,
  });

  final AppSettings settings;
  final AdminAuthorization authorization;
  final bool isSaving;
  final VoidCallback onLockPressed;
  final Future<void> Function(AppSettings settings) onSave;

  @override
  State<_AdminSettingsForm> createState() => _AdminSettingsFormState();
}

class _AdminSettingsFormState extends State<_AdminSettingsForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _adminPasswordController;
  late final TextEditingController _leewayController;
  late final TextEditingController _staleThresholdController;
  late final TextEditingController _fixed30Controller;
  late final TextEditingController _fixed60Controller;
  late final TextEditingController _fixed90Controller;
  late final TextEditingController _fixed120Controller;
  late final TextEditingController _fixedAdditionalController;
  late final TextEditingController _openFirstHourController;
  late final TextEditingController _openAdditionalController;
  late final TextEditingController _socksPriceController;
  late final TextEditingController _waterPriceController;

  @override
  void initState() {
    super.initState();
    _adminPasswordController = TextEditingController();
    _leewayController = TextEditingController();
    _staleThresholdController = TextEditingController();
    _fixed30Controller = TextEditingController();
    _fixed60Controller = TextEditingController();
    _fixed90Controller = TextEditingController();
    _fixed120Controller = TextEditingController();
    _fixedAdditionalController = TextEditingController();
    _openFirstHourController = TextEditingController();
    _openAdditionalController = TextEditingController();
    _socksPriceController = TextEditingController();
    _waterPriceController = TextEditingController();
    _resetControllers();
  }

  @override
  void dispose() {
    _adminPasswordController.dispose();
    _leewayController.dispose();
    _staleThresholdController.dispose();
    _fixed30Controller.dispose();
    _fixed60Controller.dispose();
    _fixed90Controller.dispose();
    _fixed120Controller.dispose();
    _fixedAdditionalController.dispose();
    _openFirstHourController.dispose();
    _openAdditionalController.dispose();
    _socksPriceController.dispose();
    _waterPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  l10n.titleAdminOperations,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.xs,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.end,
                children: [
                  _AdminSessionBadge(authorization: widget.authorization),
                  GravityButton.secondary(
                    label: l10n.btnLockSystem,
                    leadingIcon: Icons.lock_outline,
                    onPressed: widget.isSaving ? null : widget.onLockPressed,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          _SectionHeader(
            icon: Icons.password_outlined,
            title: l10n.titleAdminPassword,
          ),
          GravityTextField.blind(
            key: const Key('settings.adminPassword'),
            label: l10n.labelAdminPassword,
            controller: _adminPasswordController,
            enabled: !widget.isSaving,
            revealTooltip: l10n.tooltipRevealPassword,
            hideTooltip: l10n.tooltipHidePassword,
            validator: _adminPasswordValidator,
          ),
          const SizedBox(height: AppSpacing.lg),
          _SectionHeader(
            icon: Icons.timer_outlined,
            title: l10n.titleLeewayAndStaleTimers,
          ),
          _SettingsFieldGrid(
            children: [
              GravityTextField(
                key: const Key('settings.leewayMinutes'),
                label: l10n.labelLeewayGracePeriod,
                controller: _leewayController,
                enabled: !widget.isSaving,
                helperText: l10n.helperMinutes,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.end,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: _leewayValidator,
              ),
              GravityTextField(
                key: const Key('settings.staleThresholdMinutes'),
                label: l10n.labelStaleThreshold,
                controller: _staleThresholdController,
                enabled: !widget.isSaving,
                helperText: l10n.helperMinutes,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.end,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: _staleThresholdValidator,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          _SectionHeader(
            icon: Icons.confirmation_number_outlined,
            title: l10n.titleJumpPricingMatrix,
          ),
          Text(l10n.titleFixedBlocks, style: theme.textTheme.titleSmall),
          const SizedBox(height: AppSpacing.sm),
          _SettingsFieldGrid(
            children: [
              _moneyField(
                'settings.fixed30Mins',
                l10n.labelFixed30Mins,
                _fixed30Controller,
              ),
              _moneyField(
                'settings.fixed60Mins',
                l10n.labelFixed60Mins,
                _fixed60Controller,
              ),
              _moneyField(
                'settings.fixed90Mins',
                l10n.labelFixed90Mins,
                _fixed90Controller,
              ),
              _moneyField(
                'settings.fixed120Mins',
                l10n.labelFixed120Mins,
                _fixed120Controller,
              ),
              _moneyField(
                'settings.fixedAdditional30',
                l10n.labelAdditional30,
                _fixedAdditionalController,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(l10n.titleOpenTime, style: theme.textTheme.titleSmall),
          const SizedBox(height: AppSpacing.sm),
          _SettingsFieldGrid(
            children: [
              _moneyField(
                'settings.openFirstHour',
                l10n.labelOpenFirstHour,
                _openFirstHourController,
              ),
              _moneyField(
                'settings.openExtra30',
                l10n.labelOpenExtra30,
                _openAdditionalController,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          _SectionHeader(
            icon: Icons.inventory_2_outlined,
            title: l10n.titleDefaultInventoryPrices,
          ),
          _SettingsFieldGrid(
            children: [
              _moneyField(
                'settings.jumpSocksPrice',
                l10n.labelJumpSocksPrice,
                _socksPriceController,
              ),
              _moneyField(
                'settings.waterBottlePrice',
                l10n.labelWaterBottlePrice,
                _waterPriceController,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          const _AuditEventsPanel(),
          const SizedBox(height: AppSpacing.xl),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GravityButton.secondary(
                label: l10n.btnCancel,
                onPressed: widget.isSaving ? null : _resetControllers,
              ),
              const SizedBox(width: AppSpacing.sm),
              GravityButton.primary(
                label: l10n.btnSaveChanges,
                leadingIcon: Icons.save_outlined,
                onPressed: widget.isSaving ? null : _submit,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _moneyField(
    String keyName,
    String label,
    TextEditingController controller,
  ) {
    return GravityTextField.money(
      key: Key(keyName),
      label: label,
      controller: controller,
      enabled: !widget.isSaving,
      helperText: context.l10n.helperSyp,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: _moneyValidator,
    );
  }

  void _resetControllers() {
    final settings = widget.settings;
    final pricing = settings.pricingMatrix;
    final fixed = pricing.fixedDurationRates;
    final open = pricing.openTimeRates;

    _adminPasswordController.text = settings.adminPassword;
    _leewayController.text = settings.leewayMinutes.toString();
    _staleThresholdController.text = settings.staleThresholdMinutes.toString();
    _fixed30Controller.text = fixed.block30Min.toString();
    _fixed60Controller.text = fixed.block60Min.toString();
    _fixed90Controller.text = fixed.block90Min.toString();
    _fixed120Controller.text = fixed.block120Min.toString();
    _fixedAdditionalController.text = fixed.additionalBlockRate.toString();
    _openFirstHourController.text = open.firstHourRate.toString();
    _openAdditionalController.text = open.additional30MinRate.toString();
    _socksPriceController.text = settings.defaultSocksPriceSyp.toString();
    _waterPriceController.text = settings.defaultWaterPriceSyp.toString();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final updatedSettings = widget.settings.copyWith(
      adminPassword: _adminPasswordController.text.trim(),
      leewayMinutes: int.parse(_leewayController.text),
      staleThresholdMinutes: int.parse(_staleThresholdController.text),
      defaultSocksPriceSyp: int.parse(_socksPriceController.text),
      defaultWaterPriceSyp: int.parse(_waterPriceController.text),
      pricingMatrix: PricingMatrix(
        currency: 'SYP',
        fixedDurationRates: FixedDurationRates(
          block30Min: int.parse(_fixed30Controller.text),
          block60Min: int.parse(_fixed60Controller.text),
          block90Min: int.parse(_fixed90Controller.text),
          block120Min: int.parse(_fixed120Controller.text),
          additionalBlockRate: int.parse(_fixedAdditionalController.text),
        ),
        openTimeRates: OpenTimeRates(
          firstHourRate: int.parse(_openFirstHourController.text),
          additional30MinRate: int.parse(_openAdditionalController.text),
        ),
      ),
    );

    final validation = updatedSettings.validate();
    if (!validation.isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.msgInvalidPricingMatrix)),
      );
      return;
    }

    await widget.onSave(updatedSettings);
  }

  String? _adminPasswordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.l10n.msgRequiredField;
    }
    return null;
  }

  String? _leewayValidator(String? value) {
    final parsed = _parseRequiredInt(value);
    if (parsed == null) {
      return context.l10n.msgRequiredField;
    }
    if (parsed < 0 || parsed > 60) {
      return context.l10n.msgInvalidLeewayRange;
    }
    return null;
  }

  String? _staleThresholdValidator(String? value) {
    final parsed = _parseRequiredInt(value);
    if (parsed == null) {
      return context.l10n.msgRequiredField;
    }
    final leeway = int.tryParse(_leewayController.text) ?? 10;
    final minimumThreshold = math.max(60, leeway * 3);
    if (parsed < minimumThreshold) {
      return context.l10n.msgInvalidStaleThreshold(minimumThreshold);
    }
    return null;
  }

  String? _moneyValidator(String? value) {
    final parsed = _parseRequiredInt(value);
    if (parsed == null) {
      return context.l10n.msgRequiredField;
    }
    if (parsed < 0) {
      return context.l10n.msgInvalidNonNegativePrice;
    }
    return null;
  }

  int? _parseRequiredInt(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }
    return int.tryParse(value);
  }
}

class _AdminSessionBadge extends StatelessWidget {
  const _AdminSessionBadge({required this.authorization});

  final AdminAuthorization authorization;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: Stream<DateTime>.periodic(
        const Duration(seconds: 1),
        (_) => DateTime.now(),
      ),
      initialData: DateTime.now(),
      builder: (context, snapshot) {
        final now = (snapshot.data ?? DateTime.now()).toUtc();
        final remaining = authorization.expiresAt.difference(now);
        final colors = context.appColors;
        final statusColor = colors.statusActive;

        return Container(
          constraints: const BoxConstraints(minHeight: 36),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: colors.statusSurface(statusColor),
            border: Border.all(color: statusColor),
            borderRadius: AppRadius.smBorder,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.verified_user_outlined, size: 16, color: statusColor),
              const SizedBox(width: AppSpacing.xs),
              Text(
                context.l10n.labelAdminModeActive(
                  _formatSessionCountdown(remaining),
                ),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AuditEventsPanel extends ConsumerStatefulWidget {
  const _AuditEventsPanel();

  @override
  ConsumerState<_AuditEventsPanel> createState() => _AuditEventsPanelState();
}

class _AuditEventsPanelState extends ConsumerState<_AuditEventsPanel> {
  static const int _pageSize = 10;

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final auditPage = ref.watch(
      auditEventsPageProvider(
        AuditEventsPageRequest(pageIndex: _pageIndex, pageSize: _pageSize),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          icon: Icons.manage_search_outlined,
          title: l10n.titleAuditEvents,
        ),
        auditPage.when(
          data: _buildAuditTable,
          loading: () => const Padding(
            padding: EdgeInsets.all(AppSpacing.md),
            child: LinearProgressIndicator(),
          ),
          error: (error, stackTrace) => Text(l10n.msgAuditEventsLoadFailed),
        ),
      ],
    );
  }

  Widget _buildAuditTable(AuditEventPage page) {
    final l10n = context.l10n;

    if (page.records.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: AppRadius.mdBorder,
        ),
        child: Text(l10n.msgNoAuditEvents),
      );
    }

    return Column(
      children: [
        GravityDataTable(
          rowHeight: 42,
          headingHeight: 36,
          columns: [
            GravityTableColumn(label: l10n.labelAuditTimestamp, flex: 2),
            GravityTableColumn(label: l10n.labelAuditActionType, flex: 2),
            GravityTableColumn(label: l10n.labelAuditTargetRecord, flex: 3),
            GravityTableColumn(label: l10n.labelAuditReason, flex: 3),
            GravityTableColumn(label: l10n.labelAuditChangedDetails, flex: 4),
          ],
          rows: [
            for (final record in page.records)
              GravityTableRow(
                cells: [
                  GravityTableCell.text(
                    _formatDamascusTimestamp(record.triggeredAt),
                  ),
                  GravityTableCell.text(record.eventType.storageValue),
                  GravityTableCell.text(
                    record.targetSummary,
                    tooltip: record.targetSummary,
                  ),
                  GravityTableCell.text(record.reason, tooltip: record.reason),
                  GravityTableCell.text(
                    record.changedDetails,
                    tooltip: record.changedDetails,
                  ),
                ],
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              l10n.labelAuditPage(page.pageIndex + 1, page.totalPages),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(width: AppSpacing.sm),
            GravityButton.secondary(
              label: l10n.btnPreviousPage,
              onPressed: page.hasPreviousPage
                  ? () => setState(() {
                      _pageIndex -= 1;
                    })
                  : null,
            ),
            const SizedBox(width: AppSpacing.sm),
            GravityButton.secondary(
              label: l10n.btnNextPage,
              onPressed: page.hasNextPage
                  ? () => setState(() {
                      _pageIndex += 1;
                    })
                  : null,
            ),
          ],
        ),
      ],
    );
  }
}

class _SettingsFieldGrid extends StatelessWidget {
  const _SettingsFieldGrid({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTwoColumn = constraints.maxWidth >= 720;
        final itemWidth = isTwoColumn
            ? (constraints.maxWidth - AppSpacing.md) / 2
            : constraints.maxWidth;

        return Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.sm,
          children: [
            for (final child in children)
              SizedBox(width: itemWidth, child: child),
          ],
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.icon,
    required this.title,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        children: [
          Icon(icon, size: 18, color: colorScheme.onSurfaceVariant),
          const SizedBox(width: AppSpacing.xs),
          Expanded(child: Text(title, style: theme.textTheme.titleMedium)),
          if (trailing != null)
            Text(trailing!, style: theme.textTheme.labelLarge),
        ],
      ),
    );
  }
}

class _SettingsLoadError extends StatelessWidget {
  const _SettingsLoadError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 36, color: theme.colorScheme.error),
            const SizedBox(height: AppSpacing.md),
            Text(
              l10n.msgSettingsLoadFailed,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.md),
            GravityButton.secondary(
              label: l10n.btnRetry,
              leadingIcon: Icons.refresh,
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}

String _formatSessionCountdown(Duration remaining) {
  final safeRemaining = remaining.isNegative ? Duration.zero : remaining;
  final minutes = safeRemaining.inMinutes.toString().padLeft(2, '0');
  final seconds = (safeRemaining.inSeconds % 60).toString().padLeft(2, '0');
  return CashierFormatters.forceWesternDigits('$minutes:$seconds');
}

String _formatDamascusTimestamp(DateTime utcTimestamp) {
  final damascusTime = utcTimestamp.toUtc().add(const Duration(hours: 3));
  final year = damascusTime.year.toString().padLeft(4, '0');
  final month = damascusTime.month.toString().padLeft(2, '0');
  final day = damascusTime.day.toString().padLeft(2, '0');
  final hour = damascusTime.hour.toString().padLeft(2, '0');
  final minute = damascusTime.minute.toString().padLeft(2, '0');
  final second = damascusTime.second.toString().padLeft(2, '0');
  return CashierFormatters.forceWesternDigits(
    '$year-$month-$day $hour:$minute:$second',
  );
}

class _AlarmSoundSelector extends StatelessWidget {
  const _AlarmSoundSelector({
    required this.isMuted,
    required this.isSaving,
    required this.onChanged,
  });

  final bool isMuted;
  final bool isSaving;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          icon: Icons.volume_up_outlined,
          title: l10n.labelMuteOverdueAudios,
        ),
        const SizedBox(height: AppSpacing.sm),
        LayoutBuilder(
          builder: (context, constraints) {
            final useRow = constraints.maxWidth >= 460;

            final activeCard = _SoundOptionCard(
              key: const Key('settings.soundActiveCard'),
              isSelected: !isMuted,
              isEnabled: !isSaving,
              icon: Icons.volume_up_rounded,
              title: l10n.labelSoundActive,
              subtitle: l10n.labelSoundActiveDescription,
              activeColor: appColors.statusActive,
              onTap: () => onChanged(false),
            );

            final mutedCard = _SoundOptionCard(
              key: const Key('settings.soundMutedCard'),
              isSelected: isMuted,
              isEnabled: !isSaving,
              icon: Icons.volume_off_rounded,
              title: l10n.labelMutedState,
              subtitle: l10n.labelMutedStateDescription,
              activeColor: appColors.statusOverdue,
              onTap: () => onChanged(true),
            );

            if (useRow) {
              return Row(
                children: [
                  Expanded(child: activeCard),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(child: mutedCard),
                ],
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  activeCard,
                  const SizedBox(height: AppSpacing.md),
                  mutedCard,
                ],
              );
            }
          },
        ),
      ],
    );
  }
}

class _SoundOptionCard extends StatefulWidget {
  const _SoundOptionCard({
    super.key,
    required this.isSelected,
    required this.isEnabled,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.activeColor,
    required this.onTap,
  });

  final bool isSelected;
  final bool isEnabled;
  final IconData icon;
  final String title;
  final String subtitle;
  final Color activeColor;
  final VoidCallback onTap;

  @override
  State<_SoundOptionCard> createState() => _SoundOptionCardState();
}

class _SoundOptionCardState extends State<_SoundOptionCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = widget.isSelected;
    final isEnabled = widget.isEnabled;

    final Color backgroundColor = isSelected
        ? AppColorTokens.statusSurface(widget.activeColor, alpha: 0.08)
        : (theme.cardTheme.color ?? AppColorTokens.neutralSurface);

    final Color borderColor = isSelected
        ? widget.activeColor.withValues(alpha: 0.5)
        : (_isHovered && isEnabled
            ? widget.activeColor.withValues(alpha: 0.25)
            : AppColorTokens.quietBorder);

    final Color iconAndTitleColor = isSelected
        ? widget.activeColor
        : AppColorTokens.textPrimary;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: AppMotion.fast,
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
            width: isSelected ? 1.5 : 1,
          ),
          borderRadius: AppRadius.mdBorder,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: widget.activeColor.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isEnabled ? widget.onTap : null,
            borderRadius: AppRadius.mdBorder,
            hoverColor: widget.activeColor.withValues(alpha: 0.02),
            splashColor: widget.activeColor.withValues(alpha: 0.05),
            highlightColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: AppMotion.fast,
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? widget.activeColor.withValues(alpha: 0.12)
                          : AppColorTokens.neutralBackground,
                      borderRadius: AppRadius.smBorder,
                    ),
                    child: Icon(
                      widget.icon,
                      size: 24,
                      color: iconAndTitleColor,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.title,
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: iconAndTitleColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (isSelected)
                              Icon(
                                Icons.check_circle_rounded,
                                size: 18,
                                color: widget.activeColor,
                              ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.xxs),
                        Text(
                          widget.subtitle,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColorTokens.textSecondary,
                            height: 1.3,
                          ),
                        ),
                      ],
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
