import 'package:expenses_tracker/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  const Chart(this._recentTransactions);
  final List<Transactions> _recentTransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        //we need to sum up all transactions
        //for loop
        var totalsum = 0.0;
        for (var i = 0; i < _recentTransactions.length; i++) {
          if (_recentTransactions[i].date.day == weekDay.day &&
              _recentTransactions[i].date.month == weekDay.month &&
              _recentTransactions[i].date.year == weekDay.year) {
            totalsum += _recentTransactions[i].amount;
          }
        }
        // print(totalsum);
        // print(
        //   DateFormat.E().format(weekDay),
        // );
        //new getter

        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalsum
        };
      },
    );
  }

  double get totalspending {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'].toString(),
                data['amount'] as double,
                totalspending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalspending,
              ),
            );
          }).toList()),
    );
  }
}
