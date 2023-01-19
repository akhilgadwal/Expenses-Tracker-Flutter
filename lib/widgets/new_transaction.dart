import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  NewTransactions(this.addnewTxx);
  final Function addnewTxx;

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();
  DateTime? selectedDate;

  void submittedData() {
    if (amountcontroller.text.isEmpty) {
      return;
    }
    final enteredtitle = titlecontroller.text;
    final enteredamount = double.parse(amountcontroller.text);

    if (enteredtitle.isEmpty || enteredamount <= 0 || selectedDate == null) {
      return;
    }
    widget.addnewTxx(enteredtitle, enteredamount, selectedDate);
    Navigator.of(context).pop();
  }

  void datePickerDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
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
          Container(
            // color: Colors.amber,
            height: 70,
            child: Row(
              children: [
                Text(
                  selectedDate == null
                      ? 'No Date Chosen'
                      : DateFormat.yMd().format(selectedDate!),
                ),
                TextButton(
                  onPressed: datePickerDate,
                  child: Text(
                    'Chose a Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
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
