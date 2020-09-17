import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/forms/triangle_right_angled.dart';
import './main_screen.dart';

class TriangleRightAngledScreen extends StatefulWidget {
  @override
  _TriangleRightAngledScreenState createState() =>
      _TriangleRightAngledScreenState();
}

class _TriangleRightAngledScreenState extends State<TriangleRightAngledScreen> {
  final _triangleSideA = TextEditingController();
  final _triangleSideB = TextEditingController();
  final _triangleSideC = TextEditingController();

  void _submitData() {
    if (_triangleSideA.text.isEmpty &&
        _triangleSideB.text.isEmpty &&
        _triangleSideC.text.isEmpty) {
      return;
    } else if (_triangleSideC.text.isEmpty) {
      setState(() {
        _triangleSideC.text = (sqrt(pow(double.parse(_triangleSideA.text), 2) +
                pow(double.parse(_triangleSideB.text), 2)))
            .toString();
      });
    } else if (_triangleSideA.text.isEmpty) {
      setState(() {
        _triangleSideA.text = (sqrt(pow(double.parse(_triangleSideC.text), 2) -
                pow(double.parse(_triangleSideB.text), 2)))
            .toString();
      });
    } else if (_triangleSideB.text.isEmpty) {
      setState(() {
        _triangleSideB.text = (sqrt(pow(double.parse(_triangleSideC.text), 2) -
                pow(double.parse(_triangleSideA.text), 2)))
            .toString();
      });
    }
  }

  void _clearData() {
    _triangleSideA.clear();
    _triangleSideB.clear();
    _triangleSideC.clear();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    final List<Widget> _widgets = [
      Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height * 0.1,
        child: TextField(
          decoration: InputDecoration(labelText: 'Enter Side A of triangle'),
          keyboardType: TextInputType.number,
          controller: _triangleSideA,
          onSubmitted: (_) => _submitData(),
        ),
      ),
      Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height * 0.1,
        child: TextField(
          decoration: InputDecoration(labelText: 'Enter Side B of triangle'),
          keyboardType: TextInputType.number,
          controller: _triangleSideB,
          onSubmitted: (_) => _submitData(),
        ),
      ),
      Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height * 0.1,
        child: TextField(
          decoration:
              InputDecoration(labelText: 'Enter Hypothenuse of triangle'),
          keyboardType: TextInputType.number,
          controller: _triangleSideC,
          onSubmitted: (_) => _submitData(),
        ),
      ),
    ];
    return MainScreen('Triangle (right-angled)', FormTriangleRightAngled(), _widgets,
        _clearData, _submitData);
  }
}
