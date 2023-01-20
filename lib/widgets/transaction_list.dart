import 'package:expenses_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> _transaction;
  final Function deletetx;
  TransactionList(this._transaction, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return _transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraint) {
            return Column(
              children: [
                Text(
                  'No Transactions Found !',
                ),
                Container(
                  height: constraint.maxHeight * 0.6,
                  child: Image.asset(
                    'asstes/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: _transaction.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text(
                          '\$${_transaction[index].amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: Text('${_transaction[index].title}'),
                  subtitle: Text(
                    DateFormat.yMMMEd().format(_transaction[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? ElevatedButton(
                          onPressed: () => deletetx(_transaction[index].id),
                          child: Text('Delete'))
                      : IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => deletetx(_transaction[index].id),
                        ),
                ),
              );
            });
  }
}
