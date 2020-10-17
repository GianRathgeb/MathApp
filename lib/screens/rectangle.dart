import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/forms/rectangle.dart';
import './main_screen.dart';

class RectangleScreen extends StatefulWidget {
  @override
  _RectangleScreenState createState() => _RectangleScreenState();
}

class _RectangleScreenState extends State<RectangleScreen> {
  final _rectangleSideA = TextEditingController();
  final _rectangleSideB = TextEditingController();
  final _rectangleDiagonal = TextEditingController();

  String solution = '';

  void _submitData() {
    if (_rectangleSideA.text.isEmpty &&
        _rectangleSideB.text.isEmpty &&
        _rectangleDiagonal.text.isEmpty) {
      return;
    } else if (_rectangleDiagonal.text.isEmpty) {
      setState(() {
        String result = (sqrt(pow(double.parse(_rectangleSideA.text), 2) +
                pow(double.parse(_rectangleSideB.text), 2)))
            .toString();
        _rectangleDiagonal.text = result;
        solution =
            "SQRT((${double.parse(_rectangleSideA.text)} ^ 2) + (${double.parse(_rectangleSideB.text)} ^ 2)) = $result";
      });
    } else if (_rectangleSideA.text.isEmpty) {
      setState(() {
        String result = (sqrt(pow(double.parse(_rectangleDiagonal.text), 2) -
                pow(double.parse(_rectangleSideB.text), 2)))
            .toString();
        _rectangleSideA.text = result;
        solution =
            "SQRT((${double.parse(_rectangleDiagonal.text)}) ^ 2 - (${double.parse(_rectangleSideB.text)}) ^ 2) = $result";
      });
    } else if (_rectangleSideB.text.isEmpty) {
      setState(() {
        String result = (sqrt(pow(double.parse(_rectangleDiagonal.text), 2) -
                pow(double.parse(_rectangleSideA.text), 2)))
            .toString();
        _rectangleSideB.text = result;
        solution =
            "SQRT((${double.parse(_rectangleDiagonal.text)}) ^ 2 - (${double.parse(_rectangleSideA.text)}) ^ 2) = $result";
      });
    }
  }

  void _clearData() {
    _rectangleSideA.clear();
    _rectangleSideB.clear();
    _rectangleDiagonal.clear();
    solution = '';
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    final List<Widget> _widgets = [
      Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height * 0.1,
        child: TextField(
          decoration: InputDecoration(labelText: 'Enter Side A of Rectangle'),
          keyboardType: TextInputType.number,
          controller: _rectangleSideA,
          onSubmitted: (_) => _submitData(),
        ),
      ),
      Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height * 0.1,
        child: TextField(
          decoration: InputDecoration(labelText: 'Enter Side B of Rectangle'),
          keyboardType: TextInputType.number,
          controller: _rectangleSideB,
          onSubmitted: (_) => _submitData(),
        ),
      ),
      Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height * 0.1,
        child: TextField(
          decoration: InputDecoration(labelText: 'Enter Diagonal of Rectangle'),
          keyboardType: TextInputType.number,
          controller: _rectangleDiagonal,
          onSubmitted: (_) => _submitData(),
        ),
      ),
    ];

    return MainScreen(
      'Rectangle',
      FormRectangle(),
      _widgets,
      _clearData,
      _submitData,
      solution,
    );
  }
}
