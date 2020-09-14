import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/calc_list.dart';

class SquareScreen extends StatelessWidget {
  static double squareSize = 100;

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
              width: squareSize,
              height: squareSize,
              margin: EdgeInsets.only(
                left:
                    (MediaQuery.of(context).size.width / 2) - (squareSize / 2),
                top: 20,
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 2.5),
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
