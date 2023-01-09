import 'package:flutter/material.dart';

class NewTranscations extends StatelessWidget {
  final amoutInputController = TextEditingController();
  final titleInputController = TextEditingController();
  //for adding new transcations to the list
  final Function addNewtranscations;
  NewTranscations({super.key, required this.addNewtranscations});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: amoutInputController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              // onChanged: (value) => amountDetail = value,
            ),
            TextField(
              controller: titleInputController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              // onChanged: (value) => title = value,
            ),
            TextButton(
              onPressed: () {
                //for adding it to the screen
                addNewtranscations(
                  titleInputController.text,
                  double.parse(
                    amoutInputController.text,
                  ),
                );
              },
              child: Text(
                'Add Transcations',
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
