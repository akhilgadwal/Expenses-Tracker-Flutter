import 'package:expenses_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> _transaction;
  TransactionList(this._transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: _transaction.isEmpty
            ? Column(
                children: [
                  Text(
                    'No Transactions Found !',
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'asstes/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: _transaction.length,
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.black,
                            )),
                            margin: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '\$${_transaction[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_transaction[index].title,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              Text(DateFormat.yMMMd().format(
                                _transaction[index].date,
                              )),
                            ],
                          ),
                        ],
                      ));
                },
              ));
  }
}
