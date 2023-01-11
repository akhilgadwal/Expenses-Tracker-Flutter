import 'package:expenses_tracker/widgets/new_transcation.dart';
import 'package:expenses_tracker/widgets/transcationsList.dart';
import 'package:flutter/material.dart';

import 'model/transcations.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: TextStyle(
                fontFamily: 'Opensans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Opensans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        //primaryColor: Colors.black,
        //brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: MyappWidget(),
    );
  }
}

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
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.black,
                child: Text(
                  'Chart',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
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
