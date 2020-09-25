import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './models/calculator.dart';
import './widgets/calc_list.dart';
import './screens/square.dart';
import './screens/rectangle.dart';
import './screens/triangle_right_angled.dart';
import './screens/circle.dart';

import 'settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Math App",
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: lightThemeSettings['primaryColor'],
        accentColor: lightThemeSettings['accentColor'],
        scaffoldBackgroundColor: lightThemeSettings['backgroundColor'],
        fontFamily: themeSettings['secondaryFont'],
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: themeSettings['mainFont'],
                fontSize: themeSettings['fontSize'],
                color: lightThemeSettings['fontColor'],
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: lightThemeSettings['fontColor'],
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: themeSettings['mainFont'],
                  fontSize: themeSettings['headlineFontSize'],
                  color: lightThemeSettings['fontColor'],
                ),
              ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: darkThemeSettings['primaryColor'],
        accentColor: darkThemeSettings['accentColor'],
        scaffoldBackgroundColor: darkThemeSettings['backgroundColor'],
        fontFamily: themeSettings['secondaryFont'],
        textTheme: ThemeData.dark().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: themeSettings['mainFont'],
                fontSize: themeSettings['fontSize'],
                fontWeight: FontWeight.bold,
                color: darkThemeSettings['fontColor'],
              ),
              button: TextStyle(
                color: darkThemeSettings['fontColor'],
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.dark().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: themeSettings['mainFont'],
                    fontSize: themeSettings['headlineFontSize'],
                    color: darkThemeSettings['fontColor']),
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
  var _calculators = [
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
      title: 'Triangle (right-angled)',
      screen: TriangleRightAngledScreen(),
      image: 'assets/images/triangles.png',
    ),Calculator(
      title: 'Circle',
      screen: CircleScreen(),
      image: 'assets/images/circles.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = Platform.isAndroid
        ? AppBar(
            title: Text(
              'Math App',
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        : CupertinoNavigationBar(
            middle: Text(
              'Math App',
              style: Theme.of(context).textTheme.headline6,
            ),
          );

    final pageBody = SafeArea(
      child: CalculatorList(_calculators),
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
