import 'dart:io';

import 'package:flutter/material.dart';

import '../models/calculator.dart';

class CalculatorList extends StatelessWidget {
  final List<Calculator> calculatorsList;

  CalculatorList(this.calculatorsList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: calculatorsList.length,
      itemBuilder: (ctx, index) {
        return Card(
          child: ListTile(
            leading: Text(calculatorsList[index].title.toString()),
          ),
        );
      },
    );
  }
}
