import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Despesa',
            ),
          ),
          TextField(
            controller: valueController,
            decoration: InputDecoration(
              labelText: 'Valor (R\$)',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                textColor: Colors.purple,
                onPressed: () {
                  print(titleController.text);
                  print(valueController.text);
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
