import 'package:expenses_tracker/model/transcations.dart';
import 'package:expenses_tracker/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.recentTransactions,
  });

  final List<Transcations> recentTransactions;

  //getter
  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      //making the functions
      final weekDays = DateTime.now().subtract(Duration(days: (index)));
      //init the base var
      var totalsum = 0.00;
      //for loop for adding and summup the transcations
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDays.day &&
            recentTransactions[i].date.month == weekDays.month &&
            recentTransactions[i].date.year == weekDays.year) {
          totalsum += recentTransactions[i].amount;
        }
      }
      // print(DateFormat.E().format(weekDays));
      // print(totalsum);
      return {
        'day': DateFormat.E().format(weekDays).substring(0, 1),
        'amount': totalsum,
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'] as String,
                  data['amount'] as double,
                  //this ternary expersion is passed just not to get an error
                  maxSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / maxSpending),
            );
          }).toList()),
    );
  }
}
