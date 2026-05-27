import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_desktop_app_v2/app/providers.dart';
import 'package:gravity_desktop_app_v2/core/config/app_settings.dart';
import 'package:gravity_desktop_app_v2/core/security/admin_auth_notifier.dart';
import 'package:gravity_desktop_app_v2/data/repositories/settings_repository.dart';

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepository(ref.watch(databaseProvider));
});

final systemSettingsControllerProvider =
    AsyncNotifierProvider<SystemSettingsController, AppSettings>(
      SystemSettingsController.new,
    );

class SystemSettingsController extends AsyncNotifier<AppSettings> {
  @override
  Future<AppSettings> build() async {
    final repository = ref.watch(settingsRepositoryProvider);
    return repository.loadOrSeedSettings();
  }

  Future<bool> verifyAdminPassword(String password) async {
    return ref.read(settingsRepositoryProvider).verifyAdminPassword(password);
  }

  Future<void> savePublicSettings({
    bool? overdueAudioMuted,
    int? notificationVolumePercent,
    double? screenScale,
  }) async {
    final currentSettings = await future;
    final requestedSettings = currentSettings.copyWith(
      overdueAudioMuted: overdueAudioMuted,
      notificationVolumePercent: notificationVolumePercent,
      screenScale: screenScale,
    );

    final savedSettings = await ref
        .read(settingsRepositoryProvider)
        .savePublicSettings(requestedSettings);
    state = AsyncData(savedSettings);
  }

  Future<void> saveAdminSettings(AppSettings settings) async {
    final adminAuth = ref.read(adminAuthControllerProvider.notifier);
    final authorization = adminAuth.requireActiveAuthorization();
    final savedSettings = await ref
        .read(settingsRepositoryProvider)
        .saveAdminSettings(
          requestedSettings: settings,
          authorization: authorization,
        );
    adminAuth.refreshSession(authorization);
    state = AsyncData(savedSettings);
  }
}
