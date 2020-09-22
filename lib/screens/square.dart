import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/forms/square.dart';
import './main_screen.dart';

class SquareScreen extends StatefulWidget {
  @override
  _SquareScreenState createState() => _SquareScreenState();
}

class _SquareScreenState extends State<SquareScreen> {
  final _squareSide = TextEditingController();
  final _squareDiagonal = TextEditingController();

  void _submitData() {
    if (_squareSide.text.isEmpty && _squareDiagonal.text.isEmpty) {
      return;
    } else if (_squareDiagonal.text.isEmpty) {
      setState(() {
        _squareDiagonal.text =
            (double.parse(_squareSide.text) * sqrt(2)).toString();
      });
    } else if (_squareSide.text.isEmpty) {
      setState(() {
        _squareDiagonal.text =
            (double.parse(_squareDiagonal.text) / sqrt(2)).toString();
      });
    }
  }

  void _clearData() {
    _squareSide.clear();
    _squareDiagonal.clear();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    final List<Widget> _widgets = [
      Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height * 0.1,
        child: TextField(
          decoration: InputDecoration(labelText: 'Enter Side of Square'),
          keyboardType: TextInputType.number,
          controller: _squareSide,
          onSubmitted: (_) => _submitData(),
        ),
      ),
      Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height * 0.1,
        child: TextField(
          decoration: InputDecoration(labelText: 'Enter Diagonal of Square'),
          keyboardType: TextInputType.number,
          controller: _squareDiagonal,
          onSubmitted: (_) => _submitData(),
        ),
      ),
    ];
    return MainScreen(
      'Squares',
      FormSquare(),
      _widgets,
      _clearData,
      _submitData,
    );
  }
}
