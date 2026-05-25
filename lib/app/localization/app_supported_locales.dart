import 'dart:ui';

abstract final class AppSupportedLocales {
  static const Locale english = Locale('en');
  static const Locale arabic = Locale('ar');
  static const Locale defaultLocale = english;
  static const List<Locale> supported = [english, arabic];

  static Locale normalize(Locale locale) {
    return fromLanguageCode(locale.languageCode);
  }

  static Locale fromLanguageCode(String? languageCode) {
    return switch (languageCode) {
      'ar' => arabic,
      'en' => english,
      _ => defaultLocale,
    };
  }

  static bool isSupported(Locale locale) {
    return supported.any(
      (supportedLocale) => supportedLocale.languageCode == locale.languageCode,
    );
  }

  static bool isRtl(Locale locale) {
    return normalize(locale).languageCode == arabic.languageCode;
  }
}
