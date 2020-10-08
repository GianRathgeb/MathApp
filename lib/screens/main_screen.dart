import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MainScreen extends StatelessWidget {
  final String _appBarTitle;
  final Widget _formWidget;
  final List<Widget> _widgetList;
  final Function _clearDataFunction;
  final Function _calculateDataFunction;
  final String solution;

  MainScreen(this._appBarTitle, this._formWidget, this._widgetList,
      this._clearDataFunction, this._calculateDataFunction, this.solution);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    final PreferredSizeWidget appBar = Platform.isAndroid
        ? AppBar(
            title: Text(
              _appBarTitle,
              style: Theme.of(context).appBarTheme.textTheme.headline6,
            ),
          )
        : CupertinoNavigationBar(
            middle: Text(
              _appBarTitle,
              style: Theme.of(context).appBarTheme.textTheme.headline6,
            ),
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
                child: _formWidget,
              ),
            ),
            ..._widgetList,
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
                    onPressed: _clearDataFunction,
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
                    onPressed: _calculateDataFunction,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 0,
              ),
              child: Column(
                children: [
                  Text("Solution"),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 0,
                    ),
                    child: Text(solution),
                  ),
                ],
              ),
            ),
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
