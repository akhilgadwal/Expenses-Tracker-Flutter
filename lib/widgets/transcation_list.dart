import 'package:expenses_tracker/models/transcations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TanscationList extends StatelessWidget {
  TanscationList({super.key, required this.transcations});

  final List<Transcations> transcations;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transcations.map((tx) {
        return Card(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  ),
                ),
                child: Text(
                  // tx.amount.toString(),
                  '\$${tx.amount}',
                  style: TextStyle(color: Colors.purple),
                ),
                padding: EdgeInsets.all(
                  10,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${tx.title}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMMd().format(
                      tx.date as DateTime,
                    ),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
