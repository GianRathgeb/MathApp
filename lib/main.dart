import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './models/calculator.dart';
import './widgets/calc_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Math App",
      home: MathHomePage(),
    );
  }
}

class MathHomePage extends StatefulWidget {
  @override
  _MathHomePageState createState() => _MathHomePageState();
}

class _MathHomePageState extends State<MathHomePage> {
  var calculators = [
    Calculator(
      title: 'Trigonometry',
      screen: './screens/trig.dart',
      image: '.assets/images/trig.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Math App'),
          )
        : AppBar(
            title: Text('Math App'),
          );

    final pageBody = SafeArea(
      child: CalculatorList(calculators),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
          );
  }
}
