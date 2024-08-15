import 'package:flutter/material.dart';

import '../constants.dart';
import 'calc_button.dart';

class KeyPad extends StatelessWidget {
  final FuncOnPress? onPressed;
  const KeyPad(this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: CalcButton("c", colorFunc, colorMain, onPressed)),
            Expanded(child: CalcButton("+/-", colorFunc, colorMain, onPressed)),
            Expanded(child: CalcButton("%", colorFunc, colorMain, onPressed)),
            Expanded(child: CalcButton("÷", colorCalc, colorText, onPressed)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: CalcButton("7", colorNum, colorText, onPressed)),
            Expanded(child: CalcButton("8", colorNum, colorText, onPressed)),
            Expanded(child: CalcButton("9", colorNum, colorText, onPressed)),
            Expanded(child: CalcButton("x", colorCalc, colorText, onPressed)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: CalcButton("4", colorNum, colorText, onPressed)),
            Expanded(child: CalcButton("5", colorNum, colorText, onPressed)),
            Expanded(child: CalcButton("6", colorNum, colorText, onPressed)),
            Expanded(child: CalcButton("-", colorCalc, colorText, onPressed)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: CalcButton("1", colorNum, colorText, onPressed)),
            Expanded(child: CalcButton("2", colorNum, colorText, onPressed)),
            Expanded(child: CalcButton("3", colorNum, colorText, onPressed)),
            Expanded(child: CalcButton("+", colorCalc, colorText, onPressed)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: CalcButton("0", colorNum, colorText, onPressed)),
            Expanded(child: CalcButton(".", colorNum, colorText, onPressed)),
            Expanded(child: CalcButton("=", colorCalc, colorText, onPressed)),
          ],
        ),
      ],
    );
  }
}
