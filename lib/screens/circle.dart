import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/forms/circle.dart';
import './main_screen.dart';

class CircleScreen extends StatefulWidget {
  @override
  _CircleScreenState createState() => _CircleScreenState();
}

class _CircleScreenState extends State<CircleScreen> {
  final _circleRadius = TextEditingController();
  final _circlePerimeter = TextEditingController();

  String solution = '';

  void _submitData() {
    if (_circleRadius.text.isEmpty && _circlePerimeter.text.isEmpty) {
      return;
    } else if (_circlePerimeter.text.isEmpty) {
      setState(() {
        String result = (double.parse(_circleRadius.text) * 2 * pi).toString();
        _circlePerimeter.text = result;
        solution = "${double.parse(_circleRadius.text)} * 2 * $pi";
      });
    } else if (_circleRadius.text.isEmpty) {
      setState(() {
        String result =  (double.parse(_circlePerimeter.text) / 2 / pi).toString();
        _circlePerimeter.text = result;
        solution = "${double.parse(_circlePerimeter.text)} / 2 / $pi";
      });
    }
  }

  void _clearData() {
    _circleRadius.clear();
    _circlePerimeter.clear();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    final List<Widget> _widgets = [
      Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height * 0.1,
        child: TextField(
          decoration: InputDecoration(labelText: 'Enter Radius of circle'),
          keyboardType: TextInputType.number,
          controller: _circleRadius,
          onSubmitted: (_) => _submitData(),
        ),
      ),
      Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height * 0.1,
        child: TextField(
          decoration: InputDecoration(labelText: 'Enter perimeter of circle'),
          keyboardType: TextInputType.number,
          controller: _circlePerimeter,
          onSubmitted: (_) => _submitData(),
        ),
      ),
    ];
    return MainScreen(
      'Circles',
      FormCircle(),
      _widgets,
      _clearData,
      _submitData,
      solution,
    );
  }
}
