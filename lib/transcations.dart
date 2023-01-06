import 'package:flutter/cupertino.dart';

class Transcations {
  final String? id;
  final String? title;
  final double? amount;
  final DateTime? date;

  Transcations({
    @required this.id,
    required this.date,
    required this.title,
    required this.amount,
  });
}