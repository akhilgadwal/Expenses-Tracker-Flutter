import 'package:flutter/material.dart';

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
    final newTxtitlecontroller = titleController.text;
    final newTxamouncontroller = double.parse(amountController.text);
    //if statement
    if (newTxtitlecontroller.isEmpty || newTxamouncontroller <= 0) {
      return;
    }
    widget.addNewTx(
      // titleController.text,
      // double.parse(
      //   amountController.text,
      newTxtitlecontroller,
      newTxamouncontroller,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
          TextButton(
            onPressed: submitData,
            child: Text(
              'Add-Transcations',
              style: TextStyle(
                color: Colors.purple,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
