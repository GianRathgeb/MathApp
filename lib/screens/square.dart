import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/calc_list.dart';

class SquareScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = Platform.isAndroid
        ? AppBar(
            title: Text('Squares'),
          )
        : CupertinoNavigationBar(
            middle: Text('Squares'),
          );

    final pageBody = SafeArea(
      child: Container(
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(
                left: 100,
                top: 20,
              ),
              decoration: BoxDecoration(
                border: Border.all(),
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
