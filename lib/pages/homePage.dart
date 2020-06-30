import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:despesas_pessoais/components/transaction_list.dart';
import 'package:despesas_pessoais/model/transaction.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Grafico'),
              elevation: 5,
            ),
          ),
          TransactionList(_transaction),
          TransactionForm(),
          Container(
            child: Text('Versão 1.0'),
          ),
        ],
      ),
    );
  }
}
