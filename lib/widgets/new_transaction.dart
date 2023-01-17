import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  NewTransactions(this.addnewTxx);
  final Function addnewTxx;

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  void submittedData() {
    final enteredtitle = titlecontroller.text;
    final enteredamount = double.parse(amountcontroller.text);

    if (enteredtitle.isEmpty || enteredamount <= 0) {
      return;
    }
    widget.addnewTxx(
      enteredtitle,
      enteredamount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.grey,
      child: Container(
        padding: EdgeInsets.all(10),
        //color: Colors.red,
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            onSubmitted: (_) => submittedData(),
            controller: titlecontroller,
            decoration: InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            onSubmitted: (_) => submittedData(),
            controller: amountcontroller,
            decoration: InputDecoration(
              label: Text(
                'Amount',
              ),
            ),
          ),
          TextButton(
            onPressed: submittedData,
            child: Text(
              'Add-Transaction',
            ),
          ),
        ]),
      ),
    );
  }
}
