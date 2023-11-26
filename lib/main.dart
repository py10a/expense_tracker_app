import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Expense Tracker', // used by the OS task switcher
      home: Expenses(),
    ),
  );
}
