import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        //NewTransaction(_addNewTransaction),
        //TransactionList(_userTransactions),
      ],
    );
  }
}
