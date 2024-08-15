import 'package:calc_app/widgets/keypad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("テキスト", () {
    testWidgets("数字", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: KeyPad(null),
        ),
      );

      await tester.pump();
      for (int i = 0; i < 10; i++) {
        expect(find.text(i.toString()), findsOneWidget);
      }
    });

    testWidgets("文字", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: KeyPad(null),
        ),
      );

      await tester.pump();
      expect(find.text("c"), findsOneWidget);
      expect(find.text("="), findsOneWidget);
    });
  });

  group("キータップ", () {
    testWidgets("数字", (WidgetTester tester) async {
      String result = "";
      onPress(text) {
        result = result + text;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: KeyPad(onPress),
        ),
      );

      await tester.pump();
      await tester.tap(find.text("1"));
      await tester.tap(find.text("2"));
      await tester.tap(find.text("3"));
      await tester.tap(find.text("4"));
      await tester.tap(find.text("5"));
      await tester.tap(find.text("6"));
      await tester.tap(find.text("7"));
      await tester.tap(find.text("8"));
      await tester.tap(find.text("9"));
      await tester.tap(find.text("0"));

      expect(result, "1234567890");
    });

    testWidgets("文字", (WidgetTester tester) async {
      String result = "";
      onPress(text) {
        result = result + text;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: KeyPad(onPress),
        ),
      );

      await tester.pump();
      await tester.tap(find.text("c"));
      await tester.tap(find.text("."));

      expect(result, "c.");
    });
  });
}
