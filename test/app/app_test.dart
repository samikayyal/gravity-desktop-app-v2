import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_desktop_app/app/app.dart';

void main() {
  testWidgets('renders the foundation app shell', (tester) async {
    await tester.pumpWidget(const GravityDesktopApp());

    expect(find.text('Gravity Front Desk'), findsOneWidget);
    expect(find.text('Setup pending'), findsOneWidget);
  });
}
