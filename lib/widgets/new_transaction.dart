import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  late final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              //      onChanged: (value) {
              //        titleInput = value;
              //     },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (value) => amountInput = value,
            ),
            FlatButton(
                onPressed: () {
                  addTx(
                    titleController.text,
                    double.parse(amountController.text),
                  );
                },
                child: Text('Add Transaction'),
                textColor: Colors.purple),
          ],
        ),
      ),
    );
  }

  NewTransaction(this.addTx);
}
