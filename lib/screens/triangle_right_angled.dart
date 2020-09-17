import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/forms/triangle_right_angled.dart';

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

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    final PreferredSizeWidget appBar = Platform.isAndroid
        ? AppBar(
            toolbarHeight: mediaQuery.size.height * 0.075,
            title: Text('Triangles (right-angled)'),
          )
        : CupertinoNavigationBar(
            middle: Text('Triangles (right-angled)'),
          );

    final pageBody = SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
          bottom: 10,
        ),
        child: ListView(
          children: [
            SizedBox(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height * 0.3,
              child: Center(
                child: FormTriangleRightAngled(),
              ),
            ),
            Container(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height * 0.1,
              child: TextField(
                decoration:
                    InputDecoration(labelText: 'Enter Side A of triangle'),
                keyboardType: TextInputType.number,
                controller: _triangleSideA,
                onSubmitted: (_) => _submitData(),
              ),
            ),
            Container(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height * 0.1,
              child: TextField(
                decoration:
                    InputDecoration(labelText: 'Enter Side B of triangle'),
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
            Container(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height * 0.075,
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: _submitData,
                    child: Text('Clear'),
                    padding: EdgeInsets.all(10),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                  ),
                  FlatButton(
                    child: Text('Calculate missing values'),
                    padding: EdgeInsets.all(10),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                    onPressed: _submitData,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

    return Platform.isAndroid
        ? Scaffold(
            appBar: appBar,
            body: pageBody,
          )
        : CupertinoPageScaffold(
            navigationBar: appBar,
            child: pageBody,
          );
  }
}
