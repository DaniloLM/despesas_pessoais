import 'package:despesas_pessoais/components/transaction_user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
          TransactionUser(),
          Container(
            child: Text('Versão 1.0'),
          ),
        ],
      ),
    );
  }
}
