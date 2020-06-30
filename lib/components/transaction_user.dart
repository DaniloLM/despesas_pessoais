import 'dart:math';

import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:despesas_pessoais/components/transaction_list.dart';
import 'package:despesas_pessoais/model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transaction = [
    Transaction(
      id: 't1',
      title: 'Fralda P 20 unidades',
      value: 19.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Nubulizador G-tech',
      value: 210.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Fralda P 20 unidades',
      value: 19.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Nubulizador G-tech',
      value: 210.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Fralda P 20 unidades',
      value: 19.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Nubulizador G-tech',
      value: 210.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't7',
      title: 'Nubulizador G-tech',
      value: 210.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't8',
      title: 'Fralda P 20 unidades',
      value: 19.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't9',
      title: 'Nubulizador G-tech',
      value: 210.00,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(_addTransaction),
        TransactionList(_transaction),
      ],
    );
  }
}
