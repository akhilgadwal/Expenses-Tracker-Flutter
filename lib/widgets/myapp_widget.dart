import 'package:expenses_tracker/models/transaction.dart';
import 'package:expenses_tracker/widgets/chart.dart';
import 'package:expenses_tracker/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'transaction_list.dart';

class MyappWidget extends StatefulWidget {
  MyappWidget({super.key});

  @override
  State<MyappWidget> createState() => _MyappWidgetState();
}

class _MyappWidgetState extends State<MyappWidget> {
  final List<Transactions> _userTransaction = [
    // Transactions(
    //   id: 't1',
    //   title: 'shoes',
    //   amount: 120,
    //   date: DateTime.now(),
    // ),
    // Transactions(
    //   id: 't2',
    //   title: 'bags',
    //   amount: 1200,
    //   date: DateTime.now(),
    // ),
  ];
  //creating the function

  void _addNewTransaction(String newxtitle, double newtxamount) {
    final nexTx = Transactions(
        id: DateTime.now().toString(),
        title: newxtitle,
        amount: newtxamount,
        date: DateTime.now());
    setState(() {
      _userTransaction.add(nexTx);
    });
  }

  void _startNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransactions(
              _addNewTransaction,
            ),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  //crerating a getter
  List<Transactions> get recentTransaction {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
        ),
        actions: [
          IconButton(
              onPressed: () => _startNewTransaction(context),
              icon: Icon(
                Icons.add,
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: double.infinity,
              child: Card(child: Chart(recentTransaction)),
            ),
          ),
          TransactionList(
            _userTransaction,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        onPressed: () => _startNewTransaction(context),
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
