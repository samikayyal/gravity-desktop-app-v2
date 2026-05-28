import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_desktop_app_v2/app/theme/app_theme.dart';
import 'package:gravity_desktop_app_v2/app/theme/color_tokens.dart';
import 'package:gravity_desktop_app_v2/app/theme/spacing_tokens.dart';

double _contrastRatio(Color color1, Color color2) {
  final luminance1 = color1.computeLuminance();
  final luminance2 = color2.computeLuminance();
  final lighter = luminance1 > luminance2 ? luminance1 : luminance2;
  final darker = luminance1 > luminance2 ? luminance2 : luminance1;
  return (lighter + 0.05) / (darker + 0.05);
}

void main() {
  group('AppTheme light tokens', () {
    test('configures Outfit and Inter typography families', () {
      final theme = AppTheme.light;

      expect(
        theme.textTheme.displayLarge?.fontFamily,
        AppTheme.outfitFontFamily,
      );
      expect(
        theme.textTheme.headlineLarge?.fontFamily,
        AppTheme.outfitFontFamily,
      );
      expect(theme.textTheme.bodyMedium?.fontFamily, AppTheme.interFontFamily);
      expect(theme.textTheme.labelMedium?.fontFamily, AppTheme.interFontFamily);
    });

    test('uses enlarged cashier-readable text sizes', () {
      final theme = AppTheme.light;

      expect(theme.textTheme.displayLarge?.fontSize, AppTheme.timerFontSize);
      expect(
        theme.textTheme.headlineLarge?.fontSize,
        AppTheme.headerLargeFontSize,
      );
      expect(
        theme.textTheme.titleLarge?.fontSize,
        AppTheme.headerMediumFontSize,
      );
      expect(theme.textTheme.bodyMedium?.fontSize, AppTheme.bodyFontSize);
      expect(theme.textTheme.bodySmall?.fontSize, AppTheme.helperFontSize);
      expect(theme.textTheme.labelMedium?.fontSize, AppTheme.helperFontSize);
      expect(theme.textTheme.labelSmall?.fontSize, AppTheme.statusChipFontSize);
    });

    test('keeps brand yellow paired with dark navy text for contrast', () {
      final ratio = _contrastRatio(
        AppColorTokens.brandPrimary,
        AppColorTokens.textPrimary,
      );

      expect(
        ratio,
        greaterThanOrEqualTo(4.5),
        reason: 'Text inside yellow containers must remain WCAG AA readable.',
      );
      expect(AppTheme.light.colorScheme.primary, AppColorTokens.brandPrimary);
      expect(AppTheme.light.colorScheme.onPrimary, AppColorTokens.textPrimary);
      expect(
        AppTheme.light.colorScheme.onSurfaceVariant,
        AppColorTokens.textSecondary,
      );
      expect(AppTheme.light.brightness, Brightness.light);
    });

    test('registers operational status colors in the theme extension', () {
      final extension = AppTheme.light.extension<AppColorsExtension>();

      expect(extension, isNotNull);
      expect(extension!.statusActive, AppColorTokens.statusActive);
      expect(extension.statusNearEnd, AppColorTokens.statusNearEnd);
      expect(extension.statusOverdue, AppColorTokens.statusOverdue);
      expect(extension.statusStale, AppColorTokens.statusStale);
      expect(extension.statusDebt, AppColorTokens.statusDebt);
      expect(extension.statusStockNegative, AppColorTokens.statusStockNegative);
      expect(extension.statusCloudOk, AppColorTokens.statusCloudOk);
      expect(extension.statusCloudError, AppColorTokens.statusCloudError);
    });

    test('uses compact component radius and focused input borders', () {
      final theme = AppTheme.light;
      final cardShape = theme.cardTheme.shape! as RoundedRectangleBorder;
      final focusedInput =
          theme.inputDecorationTheme.focusedBorder! as OutlineInputBorder;
      final buttonShape =
          theme.elevatedButtonTheme.style!.shape!.resolve({})
              as RoundedRectangleBorder;

      expect(cardShape.borderRadius, AppRadius.mdBorder);
      expect(focusedInput.borderRadius, AppRadius.mdBorder);
      expect(focusedInput.borderSide.width, 2);
      expect(focusedInput.borderSide.color, AppColorTokens.brandPrimary);
      expect(buttonShape.borderRadius, AppRadius.mdBorder);
    });

    test('maps table number typography to dense data tables', () {
      final theme = AppTheme.light;

      expect(theme.dataTableTheme.dataTextStyle, AppTheme.tableNumberStyle);
      expect(
        theme.dataTableTheme.dataTextStyle?.fontFamily,
        AppTheme.interFontFamily,
      );
      expect(
        theme.dataTableTheme.dataTextStyle?.fontSize,
        AppTheme.tableNumberFontSize,
      );
      expect(theme.dataTableTheme.dataTextStyle?.fontWeight, FontWeight.w500);
      expect(theme.dataTableTheme.dataTextStyle?.height, 1.2);
    });

    testWidgets('exposes AppColorsExtension through Theme.of(context)', (
      tester,
    ) async {
      AppColorsExtension? capturedExtension;

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: Builder(
            builder: (context) {
              capturedExtension = Theme.of(
                context,
              ).extension<AppColorsExtension>();
              return const SizedBox.shrink();
            },
          ),
        ),
      );

      expect(capturedExtension, isNotNull);
      expect(
        capturedExtension!.statusCloudError,
        AppColorTokens.statusCloudError,
      );
    });
  });
}
