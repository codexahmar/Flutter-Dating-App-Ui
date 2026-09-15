// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dating_app/controllers/nav_bar_controller.dart';
import 'package:dating_app/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('DatingApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => BottomNavBarController(),
        child: const DatingApp(),
      ),
    );

    expect(find.byType(DatingApp), findsOneWidget);
    // Verify "Dating" header text is removed from the top bar
    expect(find.text("Dating"), findsNothing);
    // Verify "Skip" button is present
    expect(find.text("Skip"), findsOneWidget);
  });
}
