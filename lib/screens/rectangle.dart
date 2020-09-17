import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/forms/rectangle.dart';

class RectangleScreen extends StatefulWidget {
  @override
  _RectangleScreenState createState() => _RectangleScreenState();
}

class _RectangleScreenState extends State<RectangleScreen> {
  final _rectangleSideA = TextEditingController();
  final _rectangleSideB = TextEditingController();
  final _rectangleDiagonal = TextEditingController();

  void _submitData() {
    if (_rectangleSideA.text.isEmpty &&
        _rectangleSideB.text.isEmpty &&
        _rectangleDiagonal.text.isEmpty) {
      return;
    } else if (_rectangleDiagonal.text.isEmpty) {
      setState(() {
        _rectangleDiagonal.text = (sqrt(
                pow(double.parse(_rectangleSideA.text), 2) +
                    pow(double.parse(_rectangleSideB.text), 2)))
            .toString();
      });
    } else if (_rectangleSideA.text.isEmpty) {
      setState(() {
        _rectangleSideA.text = (sqrt(
                pow(double.parse(_rectangleDiagonal.text), 2) -
                    pow(double.parse(_rectangleSideB.text), 2)))
            .toString();
      });
    } else if (_rectangleSideB.text.isEmpty) {
      setState(() {
        _rectangleSideB.text = (sqrt(
                pow(double.parse(_rectangleDiagonal.text), 2) -
                    pow(double.parse(_rectangleSideA.text), 2)))
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
            title: Text('Rectangles'),
          )
        : CupertinoNavigationBar(
            middle: Text('Rectangles'),
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
                child: FormRectangle(),
              ),
            ),
            Container(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height * 0.1,
              child: TextField(
                decoration:
                    InputDecoration(labelText: 'Enter Side A of Rectangle'),
                keyboardType: TextInputType.number,
                controller: _rectangleSideA,
                onSubmitted: (_) => _submitData(),
              ),
            ),
            Container(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height * 0.1,
              child: TextField(
                decoration:
                    InputDecoration(labelText: 'Enter Side B of Rectangle'),
                keyboardType: TextInputType.number,
                controller: _rectangleSideB,
                onSubmitted: (_) => _submitData(),
              ),
            ),
            Container(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height * 0.1,
              child: TextField(
                decoration:
                    InputDecoration(labelText: 'Enter Diagonal of Rectangle'),
                keyboardType: TextInputType.number,
                controller: _rectangleDiagonal,
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
