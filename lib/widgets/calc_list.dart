import 'package:flutter/material.dart';

import '../models/calculator.dart';

class CalculatorList extends StatelessWidget {

  final List<Calculator> calculatorsList;

  CalculatorList(this.calculatorsList);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return ListView.builder(
      itemCount: calculatorsList.length,
      itemBuilder: (ctx, index) {
        return Container(
          height: mediaQuery.size.height * 0.25,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => calculatorsList[index].screen),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2.5, 5),
                      color: Theme.of(context).textTheme.headline6.color,
                      blurRadius: 5,
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      calculatorsList[index].image.toString(),
                    ),
                  ),
                ),
                child: ListTile(
                  title: Center(
                    child: Text(
                      calculatorsList[index].title.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).appBarTheme.textTheme.headline6,
                    ),
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
