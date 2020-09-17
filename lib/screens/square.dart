import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/forms/square.dart';

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

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    final PreferredSizeWidget appBar = Platform.isAndroid
        ? AppBar(
            toolbarHeight: mediaQuery.size.height * 0.075,
            title: Text('Squares'),
          )
        : CupertinoNavigationBar(
            middle: Text('Squares'),
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
                child: FormSquare(),
              ),
            ),
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
                decoration:
                    InputDecoration(labelText: 'Enter Diagonal of Square'),
                keyboardType: TextInputType.number,
                controller: _squareDiagonal,
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
