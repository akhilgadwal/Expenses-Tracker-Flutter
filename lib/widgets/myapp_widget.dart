import 'package:expenses_tracker/models/transaction.dart';
import 'package:expenses_tracker/widgets/chart.dart';
import 'package:expenses_tracker/widgets/new_transaction.dart';
import 'package:flutter/material.dart';

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

  void _addNewTransaction(
      String newxtitle, double newtxamount, DateTime chosenDate) {
    final nexTx = Transactions(
        id: DateTime.now().toString(),
        title: newxtitle,
        amount: newtxamount,
        date: chosenDate);
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

  void deletedTx(String id) {
    setState(() {
      _userTransaction.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  bool _showchart = false;

  Widget _appBarBuilding() {
    return AppBar(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLanscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appbar = AppBar(
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
    );
    final txList = Container(
        height:
            (MediaQuery.of(context).size.height - appbar.preferredSize.height) *
                0.7,
        child: TransactionList(_userTransaction, deletedTx));
    return Scaffold(
      appBar: appbar,
      // appBar: AppBar(
      //   title: Text(
      //     'Personal Expenses',
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () => _startNewTransaction(context),
      //         icon: Icon(
      //           Icons.add,
      //         ))
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (isLanscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('showChart'),
                  Switch(
                      value: _showchart,
                      onChanged: ((value) {
                        setState(() {
                          _showchart = value;
                        });
                      }))
                ],
              ),
            if (!isLanscape)
              Center(
                child: Container(
                  width: double.infinity,
                  child: Container(
                      height: (MediaQuery.of(context).size.height -
                                  appbar.preferredSize.height) *
                              0.30 -
                          MediaQuery.of(context).padding.top,
                      child: Card(child: Chart(recentTransaction))),
                ),
              ),
            if (!isLanscape) txList,
            if (isLanscape)
              _showchart
                  ? Center(
                      child: Container(
                        width: double.infinity,
                        child: Container(
                            height: (MediaQuery.of(context).size.height -
                                        appbar.preferredSize.height) *
                                    0.80 -
                                MediaQuery.of(context).padding.top,
                            child: Card(child: Chart(recentTransaction))),
                      ),
                    )
                  : txList
          ],
        ),
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
