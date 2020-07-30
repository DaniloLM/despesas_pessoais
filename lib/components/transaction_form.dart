import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate;

  _submitForm() {
    final value = double.tryParse(_valueController.text);
    final title = _titleController.text;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _titleController,
            onSubmitted: (value) => _submitForm(),
            decoration: InputDecoration(
              labelText: 'Despesa',
            ),
          ),
          TextField(
            controller: _valueController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (value) => _submitForm(),
            decoration: InputDecoration(
              labelText: 'Valor (R\$)',
            ),
          ),
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'Nenhuma data selecionada!!'
                        : 'Data selecionada: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}',
                  ),
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: _showDatePicker,
                  child: Text(
                    'Selecionar Data',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                onPressed: _submitForm,
                color: Theme.of(context).primaryColor,
                child: Text('Salvar'),
                textColor: Theme.of(context).textTheme.button.color,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
