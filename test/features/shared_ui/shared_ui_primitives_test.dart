import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_desktop_app_v2/app/theme/app_theme.dart';
import 'package:gravity_desktop_app_v2/app/theme/color_tokens.dart';
import 'package:gravity_desktop_app_v2/app/theme/spacing_tokens.dart';
import 'package:gravity_desktop_app_v2/app/widgets/gravity_button.dart';
import 'package:gravity_desktop_app_v2/app/widgets/gravity_data_table.dart';
import 'package:gravity_desktop_app_v2/app/widgets/gravity_split_scaffold.dart';
import 'package:gravity_desktop_app_v2/app/widgets/gravity_status_chip.dart';
import 'package:gravity_desktop_app_v2/app/widgets/gravity_text_field.dart';
import 'package:gravity_desktop_app_v2/l10n/app_localizations.dart';

double _contrastRatio(Color color1, Color color2) {
  final luminance1 = color1.computeLuminance();
  final luminance2 = color2.computeLuminance();
  final lighter = luminance1 > luminance2 ? luminance1 : luminance2;
  final darker = luminance1 > luminance2 ? luminance2 : luminance1;
  return (lighter + 0.05) / (darker + 0.05);
}

Widget _testApp(Widget child) {
  return MaterialApp(
    theme: AppTheme.light,
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  group('GravityButton', () {
    testWidgets('primary action uses brand yellow with dark text', (
      tester,
    ) async {
      await tester.pumpWidget(
        _testApp(GravityButton.primary(label: 'Check In', onPressed: () {})),
      );

      final button = tester.widget<FilledButton>(find.byType(FilledButton));
      final style = button.style!;

      expect(
        style.backgroundColor?.resolve(<WidgetState>{}),
        AppColorTokens.brandPrimary,
      );
      expect(
        style.foregroundColor?.resolve(<WidgetState>{}),
        AppColorTokens.textPrimary,
      );
      expect(tester.getSize(find.byType(FilledButton)).height, 48);
      expect(
        _contrastRatio(AppColorTokens.brandPrimary, AppColorTokens.textPrimary),
        greaterThanOrEqualTo(4.5),
      );
    });

    testWidgets('keeps long labels single-line inside constrained buttons', (
      tester,
    ) async {
      const longLabel = 'Start Checkout With A Very Long Cashier Action Label';

      await tester.pumpWidget(
        _testApp(
          SizedBox(
            width: 128,
            child: GravityButton.primary(
              label: longLabel,
              leadingIcon: Icons.play_arrow,
              onPressed: () {},
            ),
          ),
        ),
      );

      final labelText = tester.widget<Text>(find.text(longLabel));

      expect(labelText.maxLines, 1);
      expect(labelText.overflow, TextOverflow.ellipsis);
      expect(tester.takeException(), isNull);
    });
  });

  group('GravityStatusChip', () {
    testWidgets('maps standard operational statuses to shared colors', (
      tester,
    ) async {
      await tester.pumpWidget(
        _testApp(
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GravityStatusChip.active(label: 'Active'),
              SizedBox(width: AppSpacing.xs),
              GravityStatusChip.overdue(label: 'Overdue'),
              SizedBox(width: AppSpacing.xs),
              GravityStatusChip.closed(label: 'Closed'),
            ],
          ),
        ),
      );

      BoxDecoration decorationFor(GravityStatusTone tone) {
        final decoratedBox = tester.widget<DecoratedBox>(
          find.byKey(ValueKey<String>('gravityStatusChip.${tone.name}')),
        );
        return decoratedBox.decoration as BoxDecoration;
      }

      expect(
        decorationFor(GravityStatusTone.active).color,
        AppColorTokens.statusActive,
      );
      expect(
        decorationFor(GravityStatusTone.overdue).color,
        AppColorTokens.statusOverdue,
      );
      expect(
        decorationFor(GravityStatusTone.closed).color,
        AppColorTokens.textSecondary,
      );
    });
  });

  group('GravityDataTable', () {
    testWidgets('renders numeric columns with tabular figures', (tester) async {
      await tester.pumpWidget(
        _testApp(
          const GravityDataTable(
            columns: [
              GravityTableColumn(label: 'Player', flex: 2),
              GravityTableColumn(
                label: 'Total',
                alignment: GravityTableColumnAlignment.number,
              ),
            ],
            rows: [
              GravityTableRow(
                cells: [
                  GravityTableCell.text('Samer Kayyal'),
                  GravityTableCell.text(
                    '15,000 SYP',
                    key: ValueKey<String>('moneyCell'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

      final moneyText = tester.widget<Text>(
        find.byKey(const ValueKey<String>('moneyCell')),
      );

      expect(moneyText.textAlign, TextAlign.end);
      expect(
        moneyText.style?.fontFeatures,
        contains(const FontFeature.tabularFigures()),
      );
    });

    testWidgets('keeps long table values single-line at 1080p width', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(1080, 420));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      const longName =
          'Samer Kayyal With A Very Long Player Name That Should Truncate '
          'Before It Can Overflow The Dense Cashier Table';

      await tester.pumpWidget(
        _testApp(
          const SizedBox(
            width: 1080,
            child: GravityDataTable(
              columns: [
                GravityTableColumn(label: 'Player Name', flex: 3),
                GravityTableColumn(label: 'Phone', flex: 2),
                GravityTableColumn(
                  label: 'Totals',
                  alignment: GravityTableColumnAlignment.number,
                ),
                GravityTableColumn(
                  label: 'Actions',
                  alignment: GravityTableColumnAlignment.action,
                ),
              ],
              rows: [
                GravityTableRow(
                  cells: [
                    GravityTableCell.text(
                      longName,
                      key: ValueKey<String>('longNameCell'),
                    ),
                    GravityTableCell.text('+963 944 111 222'),
                    GravityTableCell.text('15,000 SYP'),
                    GravityTableCell.widget(
                      GravityButton.secondary(label: 'Check', onPressed: null),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

      final longNameText = tester.widget<Text>(
        find.byKey(const ValueKey<String>('longNameCell')),
      );
      expect(longNameText.overflow, TextOverflow.ellipsis);
      expect(longNameText.maxLines, 1);
      expect(tester.takeException(), isNull);
    });
  });

  group('GravityTextField', () {
    testWidgets('blind money variant toggles obscured input visibility', (
      tester,
    ) async {
      await tester.pumpWidget(
        _testApp(
          GravityTextField.blindMoney(
            label: 'Counted Cash',
            revealTooltip: 'Reveal',
            hideTooltip: 'Hide',
            controller: TextEditingController(text: '50000'),
          ),
        ),
      );

      expect(
        tester.widget<TextField>(find.byType(TextField)).obscureText,
        true,
      );

      await tester.tap(find.byIcon(Icons.visibility_outlined));
      await tester.pump();

      expect(
        tester.widget<TextField>(find.byType(TextField)).obscureText,
        false,
      );
    });

    testWidgets('aligns left under English and right under Arabic', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          locale: Locale('en'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Scaffold(body: GravityTextField(label: 'Test Label')),
        ),
      );

      final englishField = tester.widget<TextField>(find.byType(TextField));
      expect(englishField.textAlign, TextAlign.left);

      await tester.pumpWidget(
        const MaterialApp(
          locale: Locale('ar'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Scaffold(body: GravityTextField(label: 'Test Label')),
        ),
      );

      final arabicField = tester.widget<TextField>(find.byType(TextField));
      expect(arabicField.textAlign, TextAlign.right);
    });
  });

  group('GravitySplitScaffold', () {
    testWidgets('uses a stable 60/40 split for the main panels', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(1000, 500));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: const GravitySplitScaffold(
            leftPanel: SizedBox.expand(child: Text('Left')),
            rightPanel: SizedBox.expand(child: Text('Right')),
          ),
        ),
      );

      final leftWidth = tester
          .getSize(find.byKey(GravitySplitScaffold.leftPanelKey))
          .width;
      final rightWidth = tester
          .getSize(find.byKey(GravitySplitScaffold.rightPanelKey))
          .width;

      expect(leftWidth / rightWidth, closeTo(1.5, 0.02));
    });
  });
}
