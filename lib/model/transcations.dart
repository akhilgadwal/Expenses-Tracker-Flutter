import 'package:flutter/material.dart';

class Transcations {
  String title;
  double amount;
  DateTime date;
  String id;

  //creating a constructer
  Transcations({
    required this.title,
    required this.amount,
    required this.date,
    required this.id,
  });
}
