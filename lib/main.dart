import 'package:expenses_tracker/widgets/new_transcation.dart';
import 'package:expenses_tracker/widgets/transcation_list.dart';
import 'package:expenses_tracker/widgets/users_transcations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses-Tracker',
      debugShowCheckedModeBanner: false,
      home: MyappHomePage(),
    );
  }
}

class MyappHomePage extends StatelessWidget {
  MyappHomePage({super.key});

  // String? amountDetail;
  // String? title;
  final amoutInputController = TextEditingController();
  final titleInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expenses-Tracker',
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          width: double.infinity,
          child: Card(
            color: Colors.deepPurple,
            child: Text(
              'CHART',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        UersTranscations(),
        // Card(
        //   child: Container(
        //     margin: EdgeInsets.all(10),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.end,
        //       children: [
        //         TextField(
        //           controller: amoutInputController,
        //           decoration: InputDecoration(
        //             labelText: 'Amount',
        //           ),
        //           // onChanged: (value) => amountDetail = value,
        //         ),
        //         TextField(
        //           controller: titleInputController,
        //           decoration: InputDecoration(
        //             labelText: 'Title',
        //           ),
        //           // onChanged: (value) => title = value,
        //         ),
        //         TextButton(
        //           onPressed: () {
        //             print(amoutInputController.text);
        //             print(titleInputController.text);
        //           },
        //           child: Text(
        //             'Add Transcations',
        //             style: TextStyle(color: Colors.purple),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ]),
    );
  }
}
