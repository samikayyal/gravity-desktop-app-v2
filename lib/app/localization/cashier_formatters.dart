import 'dart:ui';

import 'package:gravity_desktop_app_v2/app/localization/app_supported_locales.dart';
import 'package:intl/intl.dart';

abstract final class CashierFormatters {
  static final NumberFormat _westernIntegerFormat = NumberFormat.decimalPattern(
    'en_US',
  );

  static String formatTimer(Duration duration) {
    final safeDuration = duration.isNegative ? Duration.zero : duration;
    final hours = safeDuration.inHours.toString().padLeft(2, '0');
    final minutes = (safeDuration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (safeDuration.inSeconds % 60).toString().padLeft(2, '0');
    return forceWesternDigits('$hours:$minutes:$seconds');
  }

  static String formatSyp(int amount, Locale locale) {
    final formattedAmount = forceWesternDigits(
      _westernIntegerFormat.format(amount),
    );
    if (AppSupportedLocales.isRtl(locale)) {
      return '$formattedAmount ل.س';
    }
    return '$formattedAmount SYP';
  }

  static String forceWesternDigits(String value) {
    const digitMap = <String, String>{
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
      '۰': '0',
      '۱': '1',
      '۲': '2',
      '۳': '3',
      '۴': '4',
      '۵': '5',
      '۶': '6',
      '۷': '7',
      '۸': '8',
      '۹': '9',
    };

    return value.split('').map((char) => digitMap[char] ?? char).join();
  }
}
