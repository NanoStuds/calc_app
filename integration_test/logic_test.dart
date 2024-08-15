import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:calc_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("initialized", () {
    testWidgets("number", (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text(0.toString()), findsNWidgets(2));

      for (int i = 1; i < 10; i++) {
        expect(find.text(i.toString()), findsOneWidget);
      }
    });

    testWidgets("character", (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('c'), findsOneWidget);
      expect(find.text('.'), findsOneWidget);
    });
  });

  group("tap", () {
    testWidgets("tap1", (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text("1"));
      await tester.pump();
      expect(find.text("1"), findsNWidgets(2));
      await tester.tap(find.text("1").at(0));
    });

    testWidgets("calc", (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      Finder resultFinder = find.byKey(const Key("txtResult"));
      expect(resultFinder, findsOneWidget);
      expect(tester.widget<Text>(resultFinder).data, "0");

      await tester.tap(find.text("1"));
      await tester.tap(find.text("2"));
      await tester.tap(find.text("3"));
      await tester.tap(find.text("+"));
      await tester.tap(find.text("1"));
      await tester.tap(find.text("2"));
      await tester.pump();

      expect(tester.widget<Text>(resultFinder).data, "12");
      await tester.tap(find.text("-"));
      await tester.tap(find.text("3"));
      await tester.tap(find.text("5"));
      await tester.tap(find.text("="));
      await tester.pump();
      expect(tester.widget<Text>(resultFinder).data, "100");
    });
  });
}
