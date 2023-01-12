import 'package:expenses_tracker/widgets/chart.dart';
import 'package:flutter/material.dart';

import '../model/transcations.dart';
import 'new_transcation.dart';
import 'transcationsList.dart';

//creating a new clascs
class MyappWidget extends StatefulWidget {
  MyappWidget({super.key});

  @override
  State<MyappWidget> createState() => _MyappWidgetState();
}

class _MyappWidgetState extends State<MyappWidget> {
  final List<Transcations> _usertransactions = [
    // Transcations(
    //   title: 'Shoes',
    //   id: 'T1',
    //   date: DateTime.now(),
    //   amount: 320,
    // ),
    // Transcations(
    //   title: 'Shoes-2',
    //   id: 'T2',
    //   date: DateTime.now(),
    //   amount: 3202,
    // )
  ];
  //functio for adding new transactions

  List<Transcations> get _recentTransaction {
    return _usertransactions.where((transcations) {
      return transcations.date
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTranscation(String newTitle, double newAmount) {
    //creating newTransactions
    final newTx = Transcations(
      title: newTitle,
      amount: newAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    //setting the state
    setState(() {
      _usertransactions.add(newTx);
    });
  }

  //for creating the bottomsheet for and using it to add new transcations
  void _startNewTransactions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTranscations(
              addNewTx: _addNewTranscation,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          'Expenses-Tracker',
          // style: TextStyle(
          //   fontFamily: 'Opensans',
          //   fontSize: 20,
          // ),
        ),
        actions: [
          IconButton(
            onPressed: (() => _startNewTransactions(context)),
            icon: Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(recentTransactions: _recentTransaction),
            // Container(
            //   width: double.infinity,
            //   child: Card(
            //     color: Colors.black,
            //     child: Text(
            //       'Chart',
            //       style: TextStyle(
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
            TranscationsList(transaction: _usertransactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startNewTransactions(context),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
