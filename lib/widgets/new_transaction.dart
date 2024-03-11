import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'adaptive_flat_button.dart';

class NewTransaction extends StatefulWidget {
  late final Function addTx;

  NewTransaction(this.addTx, {Key? key}) : super(key: key) {
    // print('Constructor NewTransaction Widget');
  }

  @override
  State<NewTransaction> createState() {
    // print('createState NewTransaction Widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  _NewTransactionState() {
    // print('Constructor NewTransaction State');
  }

  @override
  void initState() {
    // print('initState()');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    // print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // print('dispose()');
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty || _titleController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
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
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: mQ.viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitData(),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}'),
                    ),
                    AdaptiveFlatButton(
                      'Choose Date',
                      _presentDatePicker,
                    ),
                  ],
                ),
              ),
              TextButton(
                child: const Text('Add Transaction'),
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
