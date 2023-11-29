import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Expense Tracker', // used by the OS task switcher
      color: Colors.cyan, // color of the app in the OS task switcher
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Quicksand',
      ),
      home: const Expenses(),
    ),
  );
}
