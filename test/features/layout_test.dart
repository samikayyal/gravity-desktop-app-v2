import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_desktop_app_v2/app/layout/split_panel_layout.dart';

void main() {
  Widget buildTestableWidget() {
    return const MaterialApp(home: SplitPanelLayout());
  }

  group('SplitPanelLayout Desktop Sizing Tests', () {
    testWidgets(
      'Verify both Left and Right split panels are visible at 1920x1080',
      (WidgetTester tester) async {
        // 1. Arrange - set standard 1080p desktop display size
        await tester.binding.setSurfaceSize(const Size(1920, 1080));

        // 2. Act - render screen layout
        await tester.pumpWidget(buildTestableWidget());

        // 3. Assert - check both left Active Board and right Action Panel header exist
        expect(find.text('Active Board'), findsOneWidget);
        expect(find.text('Action Panel'), findsOneWidget);
        expect(find.text('No Active Selection'), findsOneWidget);

        // Verify that left sidebar navigation buttons are visible
        expect(find.text('Board'), findsOneWidget);
        expect(find.text('Players'), findsOneWidget);
      },
    );

    testWidgets(
      'Verify split layout scales down to 1024x768 minimum constraint without overflow exceptions',
      (WidgetTester tester) async {
        // 1. Arrange - set simulated minimum size
        await tester.binding.setSurfaceSize(const Size(1024, 768));

        // 2. Act - render layout
        await tester.pumpWidget(buildTestableWidget());
        await tester.pumpAndSettle();

        // 3. Assert - check both panels are still visible
        expect(find.text('Active Board'), findsOneWidget);
        expect(find.text('Action Panel'), findsOneWidget);

        // Ensure no debug overflow warning was rendered in this frame
        expect(tester.takeException(), isNull);
      },
    );
  });
}
