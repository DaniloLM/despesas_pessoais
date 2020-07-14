import 'package:despesas_pessoais/components/chart_bar.dart';
import 'package:despesas_pessoais/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get totalTransactionsPerDay {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var transactionObj in recentTransactions) {
        bool sameDay = transactionObj.date.day == weekDay.day;
        bool sameMonth = transactionObj.date.month == weekDay.month;
        bool sameYear = transactionObj.date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += transactionObj.value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  double get _totalWeekTransations {
    return totalTransactionsPerDay.fold(
        0.0, (previousValue, element) => previousValue + element['value']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: totalTransactionsPerDay.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: e['day'],
                value: e['value'],
                percentage: (e['value'] as double) / _totalWeekTransations,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
