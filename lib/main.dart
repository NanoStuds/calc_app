import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '計算機アプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: '計算機アプリ',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  // 色の定義
  static const Color colorMain = Colors.black;
  static const Color colorNum = Colors.white10;
  static const Color colorFunc = Colors.white54;
  static const Color colorCalc = Colors.orange;
  static const Color colorText = Colors.white;

  String txtResult = "0";

  // int _counter = 0;

  Widget calcButton(String text, Color colorButton, Color colorText) {
    return Container(
      padding: text == '0'
          ? const EdgeInsets.fromLTRB(8, 5, 8, 5)
          : const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorMain,
      body: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      txtResult,
                      style: const TextStyle(
                        color: colorText,
                        fontSize: 60,
                      ),
                      textAlign: TextAlign.right,
                      maxLines: 1,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: calcButton("c", colorFunc, colorMain)),
                Expanded(child: calcButton("+/-", colorFunc, colorMain)),
                Expanded(child: calcButton("%", colorFunc, colorMain)),
                Expanded(child: calcButton("÷", colorCalc, colorText)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: calcButton("7", colorNum, colorText)),
                Expanded(child: calcButton("8", colorNum, colorText)),
                Expanded(child: calcButton("9", colorNum, colorText)),
                Expanded(child: calcButton("x", colorCalc, colorText)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: calcButton("4", colorNum, colorText)),
                Expanded(child: calcButton("5", colorNum, colorText)),
                Expanded(child: calcButton("6", colorNum, colorText)),
                Expanded(child: calcButton("-", colorCalc, colorText)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: calcButton("1", colorNum, colorText)),
                Expanded(child: calcButton("2", colorNum, colorText)),
                Expanded(child: calcButton("3", colorNum, colorText)),
                Expanded(child: calcButton("+", colorCalc, colorText)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(flex: 2, child: calcButton("0", colorNum, colorText)),
                Expanded(child: calcButton(".", colorNum, colorText)),
                Expanded(child: calcButton("=", colorCalc, colorText)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
