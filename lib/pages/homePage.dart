import 'package:flutter/material.dart';
import 'dart:math';
import 'package:despesas_pessoais/model/transaction.dart';
import 'package:despesas_pessoais/components/chart.dart';
import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:despesas_pessoais/components/transaction_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transaction = [];

  // Transaction(
  //   id: 't0',
  //   title: 'Pagamento 0',
  //   value: 19.99,
  //   date: DateTime.now().subtract(Duration(days: 8)),
  // ),
  // Transaction(
  //   id: 't1',
  //   title: 'Fralda P 20 unidades',
  //   value: 19.99,
  //   date: DateTime.now().subtract(Duration(days: 3)),
  // ),
  // Transaction(
  //   id: 't2',
  //   title: 'Nubulizador G-tech',
  //   value: 210123.00,
  //   date: DateTime.now().subtract(Duration(days: 4)),
  // ),
  // Transaction(
  //   id: 't3',
  //   title: 'Pagamento 3',
  //   value: 210.00,
  //   date: DateTime.now().subtract(Duration(days: 3)),
  // ),

  List<Transaction> get _transactionsWeek {
    return _transaction.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  _addTransaction(String title, double value, DateTime dateTime) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: dateTime,
    );

    setState(() {
      _transaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transaction.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Despesas Pessoais'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add_box),
          onPressed: () => _openTransactionFormModal(context),
        ),
      ],
    );

    final _availableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: _availableHeight * 0.3,
              child: Chart(_transactionsWeek),
            ),
            Container(
              height: _availableHeight * 0.7,
              child: TransactionList(_transaction, _removeTransaction),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      bottomSheet: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Versão 1.0'),
            ],
          ),
        ),
      ),
    );
  }
}
