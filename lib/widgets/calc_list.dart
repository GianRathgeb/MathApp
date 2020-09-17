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
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => calculatorsList[index].screen),
            );
          },
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    calculatorsList[index].image.toString(),
                  ),
                ),
              ),
              child: ListTile(
                leading: Text(
                  calculatorsList[index].title.toString(),
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline6.color,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
