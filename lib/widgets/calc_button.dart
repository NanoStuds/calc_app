import 'package:flutter/material.dart';

typedef FuncOnPress = void Function(String text);

class CalcButton extends StatelessWidget {
  final String text;
  final Color colorButton;
  final Color colorText;

  final FuncOnPress? onPressed;

  CalcButton(this.text, this.colorButton, this.colorText, this.onPressed)
      : super(key: Key(text));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: text == '0'
          ? const EdgeInsets.fromLTRB(8, 5, 8, 5)
          : const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          onPressed!(text);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          foregroundColor: colorText,
          backgroundColor: colorButton,
          shape: text == '0' ? const StadiumBorder() : const CircleBorder(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
