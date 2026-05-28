import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_desktop_app_v2/app/providers.dart';
import 'package:gravity_desktop_app_v2/core/backup/database_restore_helper.dart';
import 'package:gravity_desktop_app_v2/core/config/env_config.dart';
import 'package:gravity_desktop_app_v2/core/config/system_settings_provider.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/data/repositories/setup_repository.dart';
import 'package:gravity_desktop_app_v2/features/setup/domain/setup_catalog_item.dart';

enum SetupWizardStep { password, restore, cloud, catalog }

enum SetupCloudStatus { notTested, checking, configDetected, failed, skipped }

enum SetupRestoreStatus { idle, restoring, restored, failed }

@immutable
class SetupCatalogDraft {
  const SetupCatalogDraft({
    required this.enabled,
    required this.name,
    required this.sku,
    required this.unitPriceText,
    required this.stockText,
  });

  factory SetupCatalogDraft.grippySocks() {
    return const SetupCatalogDraft(
      enabled: true,
      name: 'Grippy Socks',
      sku: 'SOCKS-GRIP',
      unitPriceText: '12000',
      stockText: '100',
    );
  }

  factory SetupCatalogDraft.bottledWater() {
    return const SetupCatalogDraft(
      enabled: true,
      name: 'Bottled Water',
      sku: 'WATER-500',
      unitPriceText: '2000',
      stockText: '50',
    );
  }

  final bool enabled;
  final String name;
  final String sku;
  final String unitPriceText;
  final String stockText;

  SetupCatalogDraft copyWith({
    bool? enabled,
    String? name,
    String? sku,
    String? unitPriceText,
    String? stockText,
  }) {
    return SetupCatalogDraft(
      enabled: enabled ?? this.enabled,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      unitPriceText: unitPriceText ?? this.unitPriceText,
      stockText: stockText ?? this.stockText,
    );
  }

  bool get isValid {
    if (!enabled) {
      return true;
    }
    final unitPrice = int.tryParse(unitPriceText.trim());
    final stock = int.tryParse(stockText.trim());
    return name.trim().isNotEmpty &&
        sku.trim().isNotEmpty &&
        unitPrice != null &&
        unitPrice >= 0 &&
        stock != null &&
        stock >= 0;
  }

  InitialCatalogProduct toInitialProduct() {
    return InitialCatalogProduct(
      name: name.trim(),
      sku: sku.trim(),
      unitPriceSyp: int.parse(unitPriceText.trim()),
      initialStock: int.parse(stockText.trim()),
    );
  }
}

@immutable
class SetupState {
  const SetupState({
    required this.step,
    required this.adminPassword,
    required this.confirmPassword,
    required this.cloudStatus,
    required this.restoreStatus,
    required this.catalogDrafts,
    this.cloudMessage,
    this.restoreMessage,
    this.isFinishing = false,
    this.completed = false,
  });

  factory SetupState.initial() {
    return SetupState(
      step: SetupWizardStep.password,
      adminPassword: '',
      confirmPassword: '',
      cloudStatus: SetupCloudStatus.notTested,
      restoreStatus: SetupRestoreStatus.idle,
      catalogDrafts: [
        SetupCatalogDraft.grippySocks(),
        SetupCatalogDraft.bottledWater(),
      ],
    );
  }

  final SetupWizardStep step;
  final String adminPassword;
  final String confirmPassword;
  final SetupCloudStatus cloudStatus;
  final SetupRestoreStatus restoreStatus;
  final List<SetupCatalogDraft> catalogDrafts;
  final String? cloudMessage;
  final String? restoreMessage;
  final bool isFinishing;
  final bool completed;

  String? get passwordValidationCode {
    return validateAdminPassword(adminPassword, confirmPassword);
  }

  bool get canContinueFromPassword => passwordValidationCode == null;

  bool get hasDuplicateEnabledSku => _hasDuplicateEnabledSku(catalogDrafts);

  bool get canFinishCatalog {
    return catalogDrafts.every((draft) => draft.isValid) &&
        !hasDuplicateEnabledSku;
  }

  int get stepIndex => SetupWizardStep.values.indexOf(step);

  SetupState copyWith({
    SetupWizardStep? step,
    String? adminPassword,
    String? confirmPassword,
    SetupCloudStatus? cloudStatus,
    SetupRestoreStatus? restoreStatus,
    List<SetupCatalogDraft>? catalogDrafts,
    String? cloudMessage,
    String? restoreMessage,
    bool clearCloudMessage = false,
    bool clearRestoreMessage = false,
    bool? isFinishing,
    bool? completed,
  }) {
    return SetupState(
      step: step ?? this.step,
      adminPassword: adminPassword ?? this.adminPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      cloudStatus: cloudStatus ?? this.cloudStatus,
      restoreStatus: restoreStatus ?? this.restoreStatus,
      catalogDrafts: catalogDrafts ?? this.catalogDrafts,
      cloudMessage: clearCloudMessage
          ? null
          : cloudMessage ?? this.cloudMessage,
      restoreMessage: clearRestoreMessage
          ? null
          : restoreMessage ?? this.restoreMessage,
      isFinishing: isFinishing ?? this.isFinishing,
      completed: completed ?? this.completed,
    );
  }
}

String? validateAdminPassword(String password, String confirmation) {
  if (password.trim().length < 6) {
    return 'admin_password_min_6';
  }
  if (password != confirmation) {
    return 'admin_password_mismatch';
  }
  return null;
}

typedef GcpSetupProbe = Future<bool> Function();

final setupRepositoryProvider = Provider<SetupRepository>((ref) {
  return SetupRepository(ref.watch(databaseProvider));
});

final gcpSetupProbeProvider = Provider<GcpSetupProbe>((ref) {
  return () async {
    final bucketName = EnvConfig.gcpBucketName.trim();
    final credentialsJson = EnvConfig.gcpCredentialsJson.trim();
    if (bucketName.isEmpty || credentialsJson.isEmpty) {
      return false;
    }

    final decoded = jsonDecode(credentialsJson);
    if (decoded is! Map<String, dynamic>) {
      return false;
    }
    return decoded['client_email'] is String &&
        decoded['private_key'] is String &&
        decoded['project_id'] is String;
  };
});

final setupNotifierProvider = StateNotifierProvider<SetupNotifier, SetupState>((
  ref,
) {
  return SetupNotifier(ref);
});

class SetupNotifier extends StateNotifier<SetupState> {
  SetupNotifier(this._ref) : super(SetupState.initial());

  final Ref _ref;

  void updatePassword(String value) {
    state = state.copyWith(adminPassword: value);
  }

  void updateConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value);
  }

  void goBack() {
    if (state.stepIndex == 0 || state.isFinishing) {
      return;
    }
    state = state.copyWith(
      step: SetupWizardStep.values[state.stepIndex - 1],
      clearCloudMessage: true,
      clearRestoreMessage: true,
    );
  }

  void goNext() {
    if (state.isFinishing) {
      return;
    }
    if (state.step == SetupWizardStep.password &&
        !state.canContinueFromPassword) {
      return;
    }
    if (state.step == SetupWizardStep.catalog) {
      return;
    }
    state = state.copyWith(
      step: SetupWizardStep.values[state.stepIndex + 1],
      clearCloudMessage: true,
      clearRestoreMessage: true,
    );
  }

  Future<void> checkCloudConfiguration() async {
    state = state.copyWith(
      cloudStatus: SetupCloudStatus.checking,
      clearCloudMessage: true,
    );

    try {
      final success = await _ref.read(gcpSetupProbeProvider).call();
      state = state.copyWith(
        cloudStatus: success
            ? SetupCloudStatus.configDetected
            : SetupCloudStatus.failed,
        cloudMessage: success ? 'cloud_config_detected' : 'cloud_config_failed',
      );
    } catch (_) {
      state = state.copyWith(
        cloudStatus: SetupCloudStatus.failed,
        cloudMessage: 'cloud_config_failed',
      );
    }
  }

  void skipCloudSetup() {
    state = state.copyWith(
      step: SetupWizardStep.catalog,
      cloudStatus: SetupCloudStatus.skipped,
      cloudMessage: 'cloud_setup_skipped',
    );
  }

  void updateCatalogDraft(int index, SetupCatalogDraft draft) {
    final drafts = [...state.catalogDrafts];
    drafts[index] = draft;
    state = state.copyWith(catalogDrafts: List.unmodifiable(drafts));
  }

  Future<void> restoreFromFile(File file) async {
    state = state.copyWith(
      restoreStatus: SetupRestoreStatus.restoring,
      clearRestoreMessage: true,
    );

    try {
      final activeFile = await getDatabaseFile();
      final activeDatabase = _ref.read(databaseProvider);
      final helper = DatabaseRestoreHelper(
        activeDatabaseFile: activeFile,
        closeActiveConnections: activeDatabase.close,
      );
      await helper.verifyAndRestore(file);
      state = state.copyWith(
        restoreStatus: SetupRestoreStatus.restored,
        restoreMessage: 'restore_success',
        completed: true,
      );
      _invalidateStartupState();
    } on CorruptedDatabaseException catch (error) {
      state = state.copyWith(
        restoreStatus: SetupRestoreStatus.failed,
        restoreMessage: error.message,
      );
      _invalidateStartupState();
    } on DatabaseRestoreException catch (error) {
      state = state.copyWith(
        restoreStatus: SetupRestoreStatus.failed,
        restoreMessage: error.message,
      );
      _invalidateStartupState();
    } catch (_) {
      state = state.copyWith(
        restoreStatus: SetupRestoreStatus.failed,
        restoreMessage: 'restore_failed',
      );
      _invalidateStartupState();
    }
  }

  Future<void> finishSetup() async {
    if (!state.canContinueFromPassword || !state.canFinishCatalog) {
      return;
    }

    state = state.copyWith(isFinishing: true, clearRestoreMessage: true);
    try {
      final products = state.catalogDrafts
          .where((draft) => draft.enabled)
          .map((draft) => draft.toInitialProduct())
          .toList(growable: false);
      await _ref
          .read(setupRepositoryProvider)
          .completeNewInstallation(
            adminPassword: state.adminPassword,
            gcpEnabled: false,
            products: products,
          );
      state = state.copyWith(isFinishing: false, completed: true);
      _invalidateStartupState();
    } catch (_) {
      state = state.copyWith(
        isFinishing: false,
        restoreMessage: 'setup_finish_failed',
      );
    }
  }

  void _invalidateStartupState() {
    _ref.invalidate(databaseProvider);
    _ref.invalidate(startupStateProvider);
    _ref.invalidate(systemSettingsControllerProvider);
  }
}

bool _hasDuplicateEnabledSku(List<SetupCatalogDraft> drafts) {
  final seenSkus = <String>{};
  for (final draft in drafts.where((draft) => draft.enabled)) {
    final normalizedSku = draft.sku.trim().toLowerCase();
    if (normalizedSku.isEmpty) {
      continue;
    }
    if (!seenSkus.add(normalizedSku)) {
      return true;
    }
  }
  return false;
}
