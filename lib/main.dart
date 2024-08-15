import 'package:calc_app/constants.dart';
import 'package:calc_app/widgets/keypad.dart';
import 'package:flutter/material.dart';
import 'logic.dart';

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
  String txtResult = "0";

  final Logic _logic = Logic();

  @override
  Widget build(BuildContext context) {
    onPressed(String text) {
      _logic.input(text);
      setState(() {
        txtResult = _logic.text;
      });
    }

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
                      key: const Key("txtResult"),
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
            KeyPad(onPressed),
          ],
        ),
      ),
    );
  }
}
