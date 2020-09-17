import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './models/calculator.dart';
import './widgets/calc_list.dart';
import './screens/square.dart';
import './screens/rectangle.dart';
import './screens/triangle_right_angled.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Math App",
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.redAccent,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: Colors.white,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                ),
              ),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Color(0xFF000000),
        accentColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: Colors.white,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                ),
              ),
        ),
      ),
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
      title: 'Square',
      screen: SquareScreen(),
      image: 'assets/images/squares.jpg',
    ),
    Calculator(
      title: 'Rectangle',
      screen: RectangleScreen(),
      image: 'assets/images/rectangles.jpg',
    ),
    Calculator(
      title: 'Triangles (right-angled)',
      screen: TriangleRightAngledScreen(),
      image: 'assets/images/triangles.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = Platform.isAndroid
        ? AppBar(
            title: Text('Math App'),
          )
        : CupertinoNavigationBar(
            middle: Text('Math App'),
          );

    final pageBody = SafeArea(
      child: CalculatorList(calculators),
    );

    return Platform.isAndroid
        ? Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: appBar,
            body: pageBody,
          )
        : CupertinoPageScaffold(
            resizeToAvoidBottomInset: false,
            navigationBar: appBar,
            child: pageBody,
          );
  }
}
