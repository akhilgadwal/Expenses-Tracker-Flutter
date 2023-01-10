import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transcations.dart';

class TranscationsList extends StatelessWidget {
  final List<Transcations> transaction;
  const TranscationsList({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        10,
      ),
      height: 300,
      color: Colors.amber,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              color: Colors.black,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '₹ ${transaction[index].amount}',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${transaction[index].title}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        DateFormat.yMMMMd()
                            .format(transaction[index].date as DateTime),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ));
        },
        itemCount: transaction.length,
      ),
    );
  }
}
