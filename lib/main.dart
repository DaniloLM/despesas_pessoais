import 'package:despesas_pessoais/pages/homePage.dart';
import 'package:flutter/material.dart';


void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
