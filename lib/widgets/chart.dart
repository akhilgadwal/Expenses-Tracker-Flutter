import 'package:expenses_tracker/model/transcations.dart';
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
      print(DateFormat.E().format(weekDays));
      print(totalsum);
      return {
        'day': DateFormat.E().format(weekDays),
        'amount': totalsum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    //using it currentl for checkint is
    print(groupedTransactions);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(
        20,
      ),
      child: Row(children: []),
    );
  }
}
