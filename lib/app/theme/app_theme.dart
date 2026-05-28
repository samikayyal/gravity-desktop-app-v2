import 'package:flutter/material.dart';
import 'package:gravity_desktop_app_v2/app/localization/app_supported_locales.dart';
import 'package:gravity_desktop_app_v2/app/theme/color_tokens.dart';
import 'package:gravity_desktop_app_v2/app/theme/spacing_tokens.dart';

abstract final class AppTheme {
  static const String outfitFontFamily = 'Outfit';
  static const String interFontFamily = 'Inter';
  static const String cairoFontFamily = 'Cairo';
  static const String tajawalFontFamily = 'Tajawal';
  static const double timerFontSize = 40;
  static const double headerLargeFontSize = 26;
  static const double headerMediumFontSize = 20;
  static const double bodyFontSize = 16;
  static const double tableNumberFontSize = 15;
  static const double helperFontSize = 14;
  static const double statusChipFontSize = 13;
  static const TextStyle tableNumberStyle = TextStyle(
    fontFamily: interFontFamily,
    fontSize: tableNumberFontSize,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: AppColorTokens.textPrimary,
  );

  static ThemeData get light => _lightTheme;

  static final ThemeData _lightTheme = _buildLightTheme();

  static ThemeData lightForLocale(Locale locale) {
    if (AppSupportedLocales.isRtl(locale)) {
      return _buildLightTheme(
        headingFontFamily: tajawalFontFamily,
        bodyFontFamily: cairoFontFamily,
        numberFontFamily: tajawalFontFamily,
      );
    }
    return light;
  }

  static TextStyle tableNumberStyleForLocale(Locale locale) {
    if (AppSupportedLocales.isRtl(locale)) {
      return tableNumberStyle.copyWith(fontFamily: tajawalFontFamily);
    }
    return tableNumberStyle;
  }

  static ThemeData _buildLightTheme({
    String headingFontFamily = outfitFontFamily,
    String bodyFontFamily = interFontFamily,
    String numberFontFamily = interFontFamily,
  }) {
    final tableNumberStyle = TextStyle(
      fontFamily: numberFontFamily,
      fontSize: tableNumberFontSize,
      fontWeight: FontWeight.w500,
      height: 1.2,
      color: AppColorTokens.textPrimary,
    );

    final textTheme = TextTheme(
      displayLarge: TextStyle(
        fontFamily: headingFontFamily,
        fontSize: timerFontSize,
        fontWeight: FontWeight.w700,
        height: 1,
        color: AppColorTokens.textPrimary,
      ),
      headlineLarge: TextStyle(
        fontFamily: headingFontFamily,
        fontSize: headerLargeFontSize,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: AppColorTokens.textPrimary,
      ),
      titleLarge: TextStyle(
        fontFamily: headingFontFamily,
        fontSize: headerMediumFontSize,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: AppColorTokens.textPrimary,
      ),
      titleMedium: TextStyle(
        fontFamily: bodyFontFamily,
        fontSize: bodyFontSize,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: AppColorTokens.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontFamily: bodyFontFamily,
        fontSize: bodyFontSize,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: AppColorTokens.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontFamily: bodyFontFamily,
        fontSize: bodyFontSize,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: AppColorTokens.textPrimary,
      ),
      bodySmall: TextStyle(
        fontFamily: bodyFontFamily,
        fontSize: helperFontSize,
        fontWeight: FontWeight.w400,
        height: 1.3,
        color: AppColorTokens.textSecondary,
      ),
      labelLarge: TextStyle(
        fontFamily: bodyFontFamily,
        fontSize: bodyFontSize,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: AppColorTokens.textPrimary,
      ),
      labelMedium: TextStyle(
        fontFamily: bodyFontFamily,
        fontSize: helperFontSize,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: AppColorTokens.textSecondary,
      ),
      labelSmall: TextStyle(
        fontFamily: bodyFontFamily,
        fontSize: statusChipFontSize,
        fontWeight: FontWeight.w700,
        height: 1.1,
        color: AppColorTokens.textSecondary,
      ),
    );

    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColorTokens.brandPrimary,
          brightness: Brightness.light,
        ).copyWith(
          primary: AppColorTokens.brandPrimary,
          onPrimary: AppColorTokens.textPrimary,
          primaryContainer: AppColorTokens.brandPrimaryContainer,
          onPrimaryContainer: AppColorTokens.textPrimary,
          secondary: AppColorTokens.statusCloudOk,
          onSecondary: AppColorTokens.neutralSurface,
          surface: AppColorTokens.neutralSurface,
          onSurface: AppColorTokens.textPrimary,
          onSurfaceVariant: AppColorTokens.textSecondary,
          error: AppColorTokens.statusOverdue,
          onError: AppColorTokens.neutralSurface,
          outline: AppColorTokens.quietBorder,
          shadow: AppColorTokens.textPrimary,
        );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      primaryColor: AppColorTokens.brandPrimary,
      scaffoldBackgroundColor: AppColorTokens.neutralBackground,
      canvasColor: AppColorTokens.neutralBackground,
      dividerColor: AppColorTokens.quietBorder,
      fontFamily: bodyFontFamily,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      visualDensity: VisualDensity.compact,
      extensions: const <ThemeExtension<dynamic>>[AppColorsExtension.light()],
      appBarTheme: AppBarTheme(
        backgroundColor: AppColorTokens.neutralSurface,
        foregroundColor: AppColorTokens.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: const Border(
          bottom: BorderSide(color: AppColorTokens.quietBorder, width: 1),
        ),
        titleTextStyle: TextStyle(
          fontFamily: headingFontFamily,
          fontSize: headerMediumFontSize,
          fontWeight: FontWeight.w600,
          color: AppColorTokens.textPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColorTokens.neutralSurface,
        surfaceTintColor: AppColorTokens.neutralSurface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.mdBorder,
          side: const BorderSide(color: AppColorTokens.quietBorder, width: 1),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColorTokens.quietBorder,
        thickness: 1,
        space: 1,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: _filledButtonStyle(bodyFontFamily),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: _filledButtonStyle(bodyFontFamily),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: _outlinedButtonStyle(bodyFontFamily),
      ),
      textButtonTheme: TextButtonThemeData(
        style: _textButtonStyle(bodyFontFamily),
      ),
      iconButtonTheme: IconButtonThemeData(style: _iconButtonStyle()),
      inputDecorationTheme: InputDecorationThemeData(
        isDense: true,
        filled: true,
        fillColor: AppColorTokens.neutralSurface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        border: _inputBorder(AppColorTokens.quietBorder),
        enabledBorder: _inputBorder(AppColorTokens.quietBorder),
        focusedBorder: _inputBorder(AppColorTokens.brandPrimary, width: 2),
        disabledBorder: _inputBorder(
          AppColorTokens.quietBorder.withValues(alpha: 0.4),
        ),
        errorBorder: _inputBorder(AppColorTokens.statusOverdue),
        focusedErrorBorder: _inputBorder(
          AppColorTokens.statusOverdue,
          width: 2,
        ),
        labelStyle: textTheme.labelMedium,
        floatingLabelStyle: textTheme.labelMedium?.copyWith(
          color: AppColorTokens.textPrimary,
        ),
        hintStyle: textTheme.bodySmall,
        helperStyle: textTheme.bodySmall,
        errorStyle: textTheme.bodySmall?.copyWith(
          color: AppColorTokens.statusOverdue,
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: AppColorTokens.neutralSurface,
        indicatorColor: AppColorTokens.brandPrimary,
        selectedIconTheme: const IconThemeData(
          color: AppColorTokens.textPrimary,
        ),
        unselectedIconTheme: const IconThemeData(
          color: AppColorTokens.textSecondary,
        ),
        selectedLabelTextStyle: TextStyle(
          fontFamily: bodyFontFamily,
          color: AppColorTokens.textPrimary,
          fontWeight: FontWeight.w700,
          fontSize: helperFontSize,
        ),
        unselectedLabelTextStyle: TextStyle(
          fontFamily: bodyFontFamily,
          color: AppColorTokens.textSecondary,
          fontWeight: FontWeight.w400,
          fontSize: helperFontSize,
        ),
      ),
      listTileTheme: ListTileThemeData(
        dense: true,
        minVerticalPadding: AppSpacing.xs,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.mdBorder),
        selectedColor: AppColorTokens.textPrimary,
        selectedTileColor: AppColorTokens.brandPrimaryContainer,
        iconColor: AppColorTokens.textSecondary,
        textColor: AppColorTokens.textPrimary,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColorTokens.neutralSurface,
        disabledColor: AppColorTokens.neutralSurface.withValues(alpha: 0.4),
        selectedColor: AppColorTokens.brandPrimaryContainer,
        secondarySelectedColor: AppColorTokens.brandPrimaryContainer,
        labelStyle: textTheme.labelSmall,
        secondaryLabelStyle: textTheme.labelSmall?.copyWith(
          color: AppColorTokens.textPrimary,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xs,
          vertical: AppSpacing.xxs,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.smBorder,
          side: const BorderSide(color: AppColorTokens.quietBorder),
        ),
      ),
      dataTableTheme: DataTableThemeData(
        dataTextStyle: tableNumberStyle,
        headingTextStyle: textTheme.labelMedium?.copyWith(
          color: AppColorTokens.textPrimary,
        ),
        dividerThickness: 1,
        headingRowColor: WidgetStateProperty.all(
          AppColorTokens.neutralBackground,
        ),
        dataRowMinHeight: 40,
        dataRowMaxHeight: 48,
        horizontalMargin: AppSpacing.md,
        columnSpacing: AppSpacing.lg,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColorTokens.neutralSurface,
        surfaceTintColor: AppColorTokens.neutralSurface,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.mdBorder),
        titleTextStyle: textTheme.titleLarge,
        contentTextStyle: textTheme.bodyMedium,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColorTokens.textPrimary,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: AppColorTokens.neutralSurface,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.mdBorder),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: AppColorTokens.neutralSurface,
        surfaceTintColor: AppColorTokens.neutralSurface,
        textStyle: textTheme.bodyMedium,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.mdBorder),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColorTokens.textPrimary,
          borderRadius: AppRadius.smBorder,
        ),
        textStyle: textTheme.bodySmall?.copyWith(
          color: AppColorTokens.neutralSurface,
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColorTokens.brandPrimary,
        circularTrackColor: AppColorTokens.quietBorder,
      ),
    );
  }

  static OutlineInputBorder _inputBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: AppRadius.mdBorder,
      borderSide: BorderSide(color: color, width: width),
    );
  }

  static ButtonStyle _filledButtonStyle(String fontFamily) {
    return ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size(0, 40)),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColorTokens.brandPrimary.withValues(alpha: 0.4);
        }
        if (states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.pressed)) {
          return AppColorTokens.shiftLightness(
            AppColorTokens.brandPrimary,
            -0.05,
          );
        }
        return AppColorTokens.brandPrimary;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColorTokens.textPrimary.withValues(alpha: 0.4);
        }
        return AppColorTokens.textPrimary;
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return AppColorTokens.brandPrimaryContainer.withValues(alpha: 0.35);
        }
        if (states.contains(WidgetState.pressed)) {
          return AppColorTokens.textPrimary.withValues(alpha: 0.08);
        }
        return null;
      }),
      side: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return const BorderSide(color: AppColorTokens.textPrimary, width: 2);
        }
        return const BorderSide(color: AppColorTokens.quietBorder);
      }),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: AppRadius.mdBorder),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontFamily: fontFamily,
          fontSize: bodyFontSize,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
      ),
      mouseCursor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return SystemMouseCursors.basic;
        }
        return SystemMouseCursors.click;
      }),
      animationDuration: AppMotion.fast,
    );
  }

  static ButtonStyle _outlinedButtonStyle(String fontFamily) {
    return ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size(0, 40)),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColorTokens.neutralSurface.withValues(alpha: 0.4);
        }
        if (states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.pressed)) {
          return AppColorTokens.shiftLightness(
            AppColorTokens.neutralSurface,
            -0.03,
          );
        }
        return AppColorTokens.neutralSurface;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColorTokens.textPrimary.withValues(alpha: 0.4);
        }
        return AppColorTokens.textPrimary;
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return AppColorTokens.brandPrimaryContainer.withValues(alpha: 0.35);
        }
        return null;
      }),
      side: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return BorderSide(
            color: AppColorTokens.quietBorder.withValues(alpha: 0.4),
          );
        }
        if (states.contains(WidgetState.focused)) {
          return const BorderSide(color: AppColorTokens.brandPrimary, width: 2);
        }
        return const BorderSide(color: AppColorTokens.quietBorder);
      }),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: AppRadius.mdBorder),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontFamily: fontFamily,
          fontSize: bodyFontSize,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
      ),
      mouseCursor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return SystemMouseCursors.basic;
        }
        return SystemMouseCursors.click;
      }),
      animationDuration: AppMotion.fast,
    );
  }

  static ButtonStyle _textButtonStyle(String fontFamily) {
    return ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size(0, 36)),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColorTokens.textPrimary.withValues(alpha: 0.4);
        }
        return AppColorTokens.textPrimary;
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.pressed)) {
          return AppColorTokens.brandPrimaryContainer.withValues(alpha: 0.35);
        }
        return null;
      }),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: AppRadius.mdBorder),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontFamily: fontFamily,
          fontSize: bodyFontSize,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
      ),
      mouseCursor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return SystemMouseCursors.basic;
        }
        return SystemMouseCursors.click;
      }),
      animationDuration: AppMotion.fast,
    );
  }

  static ButtonStyle _iconButtonStyle() {
    return ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size(36, 36)),
      fixedSize: const WidgetStatePropertyAll(Size(36, 36)),
      padding: const WidgetStatePropertyAll(EdgeInsets.all(AppSpacing.xs)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColorTokens.textSecondary.withValues(alpha: 0.4);
        }
        return AppColorTokens.textSecondary;
      }),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.pressed)) {
          return AppColorTokens.neutralBackground;
        }
        return AppColorTokens.neutralSurface;
      }),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: AppRadius.smBorder),
      ),
      mouseCursor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return SystemMouseCursors.basic;
        }
        return SystemMouseCursors.click;
      }),
      animationDuration: AppMotion.fast,
    );
  }
}
