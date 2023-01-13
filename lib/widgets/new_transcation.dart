import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTranscations extends StatefulWidget {
  NewTranscations({
    super.key,
    required this.addNewTx,
  });
  final Function addNewTx;

  @override
  State<NewTranscations> createState() => _NewTranscationsState();
}

class _NewTranscationsState extends State<NewTranscations> {
//creating the Transcations List
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  //creating a new fucntion
  void submitData() {
    if (titleController.text.isEmpty) {
      return;
    }
    final newTxtitlecontroller = titleController.text;
    final newTxamouncontroller = double.parse(amountController.text);
    //if statement
    if (newTxtitlecontroller.isEmpty ||
        newTxamouncontroller <= 0 ||
        _selectedDate == null) {
      return;
    }
    widget.addNewTx(
      newTxtitlecontroller,
      newTxamouncontroller,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  //this is for this class
  DateTime? _selectedDate;
  //creating a function for date picker
  void datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.all(
          10,
        ),
        child: Container(
          margin: EdgeInsets.all(
            10,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onSubmitted: (_) => submitData,
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              onSubmitted: (_) => submitData,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? 'No Date choosen'
                        : DateFormat.yMd().format(_selectedDate!),
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: datePicker,
                    child: Text(
                      'Choose a Date',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(
                12,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  color: Colors.purple),
              child: TextButton(
                onPressed: submitData,
                child: Text(
                  'Add-Transcations',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
