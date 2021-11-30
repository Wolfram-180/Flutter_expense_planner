import 'package:flutter/material.dart';

import 'transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'new shoes',
      amount: 3500.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'products',
      amount: 2894.56,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART'),
              elevation: 5,
            ),
          ),
          Card(
            color: Colors.red,
            child: Text('TX'),
          ),
        ],
      ),
    );
  }
}
