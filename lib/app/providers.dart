import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_desktop_app_v2/app/localization/app_supported_locales.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/data/repositories/app_locale_repository.dart';
import 'package:gravity_desktop_app_v2/data/repositories/startup_repository.dart';
import 'package:gravity_desktop_app_v2/domain/entities/startup_state.dart';

/// Provider for the AppDatabase singleton instance.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

/// Provider for the StartupRepository instance.
final startupRepositoryProvider = Provider<StartupRepository>((ref) {
  return StartupRepository(ref.watch(databaseProvider));
});

/// Provider for app locale persistence in system_settings.
final appLocaleRepositoryProvider = Provider<AppLocaleRepository>((ref) {
  return AppLocaleRepository(ref.watch(databaseProvider));
});

/// FutureProvider that evaluates the startup state of the application.
/// Exceptions are allowed to bubble up to be caught by Riverpod and handled as database errors.
final startupStateProvider = FutureProvider<StartupState>((ref) async {
  final repository = ref.watch(startupRepositoryProvider);
  return await repository.checkStartupState();
});

final appLocaleControllerProvider =
    AsyncNotifierProvider<AppLocaleController, Locale>(AppLocaleController.new);

class AppLocaleController extends AsyncNotifier<Locale> {
  @override
  Future<Locale> build() async {
    final repository = ref.watch(appLocaleRepositoryProvider);
    final localeCode = await repository.loadLocaleCode();
    return AppSupportedLocales.fromLanguageCode(localeCode);
  }

  Future<void> setLocale(Locale locale) async {
    final normalizedLocale = AppSupportedLocales.normalize(locale);
    final previousLocale =
        state.valueOrNull ?? AppSupportedLocales.defaultLocale;

    if (previousLocale.languageCode == normalizedLocale.languageCode) {
      return;
    }

    state = AsyncData(normalizedLocale);

    try {
      await ref
          .read(appLocaleRepositoryProvider)
          .saveLocaleCode(normalizedLocale.languageCode);
    } catch (error, stackTrace) {
      state = AsyncData(previousLocale);
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
