import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPerTotal;
  ChartBar(this.label, this.spendingAmount, this.spendingPerTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrainst) {
      return Column(
        children: [
          Container(
              height: constrainst.maxHeight * 0.15,
              child: FittedBox(
                  child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
          SizedBox(
            height: constrainst.maxHeight * 0.04,
          ),
          Container(
            height: constrainst.maxHeight * 0.60,
            width: 10,
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.5,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
              )
            ]),
          ),
          SizedBox(
            height: constrainst.maxHeight * 0.04,
          ),
          Container(
            height: constrainst.maxHeight * 0.15,
            child: FittedBox(
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
