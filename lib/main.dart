import 'package:flutter/material.dart';
import 'transcations.dart';

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

  final List<Transcations> transcation = [
    Transcations(
      id: 'T1',
      date: DateTime.now(),
      title: 'Shoes',
      amount: 69.99,
    ),
    Transcations(
      id: 'T2',
      date: DateTime.now(),
      title: 'car-wash',
      amount: 10,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expenses-Tracker',
        ),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
        Column(
          children: transcation.map((tx) {
            return Card(
              child: Text(
                tx.title.toString(),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
