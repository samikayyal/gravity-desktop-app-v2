import 'package:flutter/material.dart';

abstract final class AppColorTokens {
  /// HSL(58, 97%, 50%) - primary brand action color.
  static const Color brandPrimary = Color(0xFFFBF306);

  /// HSL(58, 96%, 70%) - subtle selected/active backing.
  static const Color brandPrimaryContainer = Color(0xFFFCF86C);

  /// HSL(210, 40%, 98%) - deep app container background.
  static const Color neutralBackground = Color(0xFFF8FAFC);

  /// HSL(0, 0%, 100%) - panels, cards, tables, and inputs.
  static const Color neutralSurface = Color(0xFFFFFFFF);

  /// HSL(214, 32%, 91%) - quiet separators and input borders.
  static const Color quietBorder = Color(0xFFE2E8F0);

  /// HSL(222, 47%, 11%) - high-contrast text and icons.
  static const Color textPrimary = Color(0xFF0F172A);

  /// HSL(215, 16%, 47%) - secondary labels and helper text.
  static const Color textSecondary = Color(0xFF475569);

  /// HSL(159, 84%, 39%) - active timers and healthy stock.
  static const Color statusActive = Color(0xFF10B981);

  /// HSL(38, 92%, 50%) - near-end timers and low inventory.
  static const Color statusNearEnd = Color(0xFFF59E0B);

  /// HSL(0, 84%, 60%) - overdue timers and unpaid checkout debt.
  static const Color statusOverdue = Color(0xFFEF4444);

  /// HSL(258, 90%, 66%) - stale sessions.
  static const Color statusStale = Color(0xFF8B5CF6);

  /// HSL(32, 95%, 44%) - old debt warnings.
  static const Color statusDebt = Color(0xFFD97706);

  /// HSL(0, 74%, 41%) - negative stock.
  static const Color statusStockNegative = Color(0xFFB91C1C);

  /// HSL(175, 84%, 32%) - successful cloud backup state.
  static const Color statusCloudOk = Color(0xFF0D9488);

  /// HSL(344, 83%, 50%) - failed cloud backup state.
  static const Color statusCloudError = Color(0xFFE11D48);

  static Color shiftLightness(Color color, double delta) {
    final hslColor = HSLColor.fromColor(color);
    final lightness = (hslColor.lightness + delta).clamp(0.0, 1.0);
    return hslColor.withLightness(lightness).toColor();
  }

  static Color statusSurface(Color color, {double alpha = 0.1}) {
    return Color.alphaBlend(color.withValues(alpha: alpha), neutralSurface);
  }
}

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.statusActive,
    required this.statusNearEnd,
    required this.statusOverdue,
    required this.statusStale,
    required this.statusDebt,
    required this.statusStockNegative,
    required this.statusCloudOk,
    required this.statusCloudError,
  });

  const AppColorsExtension.light()
    : statusActive = AppColorTokens.statusActive,
      statusNearEnd = AppColorTokens.statusNearEnd,
      statusOverdue = AppColorTokens.statusOverdue,
      statusStale = AppColorTokens.statusStale,
      statusDebt = AppColorTokens.statusDebt,
      statusStockNegative = AppColorTokens.statusStockNegative,
      statusCloudOk = AppColorTokens.statusCloudOk,
      statusCloudError = AppColorTokens.statusCloudError;

  final Color statusActive;
  final Color statusNearEnd;
  final Color statusOverdue;
  final Color statusStale;
  final Color statusDebt;
  final Color statusStockNegative;
  final Color statusCloudOk;
  final Color statusCloudError;

  Color statusSurface(Color color, {double alpha = 0.1}) {
    return Color.alphaBlend(
      color.withValues(alpha: alpha),
      AppColorTokens.neutralSurface,
    );
  }

  @override
  AppColorsExtension copyWith({
    Color? statusActive,
    Color? statusNearEnd,
    Color? statusOverdue,
    Color? statusStale,
    Color? statusDebt,
    Color? statusStockNegative,
    Color? statusCloudOk,
    Color? statusCloudError,
  }) {
    return AppColorsExtension(
      statusActive: statusActive ?? this.statusActive,
      statusNearEnd: statusNearEnd ?? this.statusNearEnd,
      statusOverdue: statusOverdue ?? this.statusOverdue,
      statusStale: statusStale ?? this.statusStale,
      statusDebt: statusDebt ?? this.statusDebt,
      statusStockNegative: statusStockNegative ?? this.statusStockNegative,
      statusCloudOk: statusCloudOk ?? this.statusCloudOk,
      statusCloudError: statusCloudError ?? this.statusCloudError,
    );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      statusActive: Color.lerp(statusActive, other.statusActive, t)!,
      statusNearEnd: Color.lerp(statusNearEnd, other.statusNearEnd, t)!,
      statusOverdue: Color.lerp(statusOverdue, other.statusOverdue, t)!,
      statusStale: Color.lerp(statusStale, other.statusStale, t)!,
      statusDebt: Color.lerp(statusDebt, other.statusDebt, t)!,
      statusStockNegative: Color.lerp(
        statusStockNegative,
        other.statusStockNegative,
        t,
      )!,
      statusCloudOk: Color.lerp(statusCloudOk, other.statusCloudOk, t)!,
      statusCloudError: Color.lerp(
        statusCloudError,
        other.statusCloudError,
        t,
      )!,
    );
  }
}

extension AppThemeColors on BuildContext {
  AppColorsExtension get appColors {
    final extension = Theme.of(this).extension<AppColorsExtension>();
    assert(extension != null, 'AppColorsExtension is not registered.');
    return extension!;
  }
}
