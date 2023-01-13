import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double totalAmountPer;

  ChartBar(
    this.label,
    this.spendingAmount,
    this.totalAmountPer,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 20,
            child: FittedBox(
                child: Text('\₹ ${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              // FractionallySizedBox(
              //   heightFactor: totalAmountPer,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(
              //         12,
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
              ),
              FractionallySizedBox(
                heightFactor: totalAmountPer,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          label,
        )
      ],
    );
  }
}
