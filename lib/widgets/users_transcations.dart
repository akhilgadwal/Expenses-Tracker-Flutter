import 'package:expenses_tracker/models/transcations.dart';
import 'package:expenses_tracker/widgets/transcation_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'new_transcation.dart';

class UersTranscations extends StatefulWidget {
  UersTranscations({super.key});

  @override
  State<UersTranscations> createState() => _UersTranscationsState();
}

class _UersTranscationsState extends State<UersTranscations> {
  final List<Transcations> _usertranscations = [
    Transcations(
      id: 'T1',
      date: DateTime.now(),
      title: 'Shoes',
      amount: 1000,
    ),
    Transcations(
      id: 'T2',
      date: DateTime.now(),
      title: 'Headphones',
      amount: 899,
    )
  ];

  //crearting  a function for adding the transcations to the list
  void _addNewTranscation(String txTitle, double txamount) {
    //creating a newTranscations
    final newTranscations = Transcations(
      title: txTitle,
      id: DateTime.now().toString(),
      date: DateTime.now(),
      amount: txamount,
    );
    setState(() {
      _usertranscations.add(newTranscations);
    });
  }

  //setting the set
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTranscations(
          addNewtranscations: _addNewTranscation,
        ),
        TanscationList(
          transcations: _usertranscations,
        ),
      ],
    );
  }
}
