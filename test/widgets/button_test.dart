import 'package:calc_app/widgets/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Button", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CalcButton("0", Colors.black, Colors.white, null),
      ),
    );

    await tester.pump();
    expect(find.text("0"), findsOneWidget);
    expect(find.text("1"), findsNothing);
  });
  group("押されたときの処理", () {
    testWidgets("1", (WidgetTester tester) async {
      String result = "";
      onPress(String text) {
        result = text;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: CalcButton("1", Colors.black, Colors.white, onPress),
        ),
      );

      await tester.pump();

      expect(result, "");
      Finder finder = find.text("1");
      await tester.tap(finder);
      expect(result, "1");
    });

    testWidgets("2", (WidgetTester tester) async {
      String result = "";
      onPress(String text) {
        result = text;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: CalcButton("2", Colors.black, Colors.white, onPress),
        ),
      );

      await tester.pump();

      expect(result, "");
      await tester.tap(find.text("2"));
      expect(result, "2");
    });
  });

  group("色", () {
    testWidgets("1", (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CalcButton("1", Colors.black, Colors.white, null),
        ),
      );

      await tester.pump();

      Finder finder = find.byType(Material);
      Material material = tester.widget(finder);
      expect(material.color, Colors.black);
      expect(material.textStyle?.color, Colors.white);
    });

    testWidgets("2", (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CalcButton("2", Colors.white, Colors.black, null),
        ),
      );

      await tester.pump();

      Finder finder = find.byType(Material);
      Material material = tester.widget(finder);
      expect(material.color, Colors.white);
      expect(material.textStyle?.color, Colors.black);
    });
  });
}
