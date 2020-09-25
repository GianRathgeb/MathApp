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
                vertical: 5,
                horizontal: 7.5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2, 2),
                      color: Theme.of(context).textTheme.headline6.color.withOpacity(0.6),
                      blurRadius: 3,
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      calculatorsList[index].image.toString(),
                    ),
                    // Detect which theme is activated
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                      BlendMode.srcOver,
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
