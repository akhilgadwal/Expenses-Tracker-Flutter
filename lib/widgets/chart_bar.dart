import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPerTotal;
  ChartBar(this.label, this.spendingAmount, this.spendingPerTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 2.0,
                ),
                color: Color.fromARGB(255, 193, 185, 163),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
            ),
            FractionallySizedBox(
              heightFactor: spendingPerTotal,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
            )
          ]),
        ),
        Text(label),
      ],
    );
  }
}
