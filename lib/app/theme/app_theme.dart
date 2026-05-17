import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radii.dart';

ThemeData buildAppTheme() {
  final colorScheme =
      ColorScheme.fromSeed(
        seedColor: AppColors.brandPrimary,
        brightness: Brightness.light,
      ).copyWith(
        primary: AppColors.brandPrimary,
        onPrimary: AppColors.brandOnPrimary,
        primaryContainer: AppColors.brandPrimaryContainer,
        onPrimaryContainer: AppColors.brandOnPrimaryContainer,
        surface: AppColors.surfaceDefault,
        onSurface: AppColors.textPrimary,
        error: AppColors.destructive,
        onError: AppColors.onDestructive,
        outline: AppColors.borderDefault,
        outlineVariant: AppColors.borderSubtle,
      );

  final baseTheme = ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColors.backgroundBase,
    visualDensity: VisualDensity.compact,
  );

  return baseTheme.copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundSubtle,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
    ),
    dividerColor: AppColors.borderDefault,
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.surfaceDisabled;
          }
          if (states.contains(WidgetState.pressed)) {
            return AppColors.brandPrimaryPressed;
          }
          if (states.contains(WidgetState.hovered)) {
            return AppColors.brandPrimaryHover;
          }
          return AppColors.brandPrimary;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.textDisabled;
          }
          return AppColors.brandOnPrimary;
        }),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.md),
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceSunken,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.sm),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.borderDefault),
        borderRadius: BorderRadius.circular(AppRadii.sm),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.focusRing, width: 2),
        borderRadius: BorderRadius.circular(AppRadii.sm),
      ),
    ),
    textTheme: baseTheme.textTheme.apply(
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
    ),
  );
}
