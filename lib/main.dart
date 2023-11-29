import 'package:flutter/material.dart';

import 'package:expense_tracker_app/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Expense Tracker',
      color: const Color.fromARGB(255, 218, 167, 227),
      theme: ThemeData.light().copyWith(
        primaryColor: const Color.fromARGB(255, 218, 167, 227),
        scaffoldBackgroundColor: const Color.fromARGB(255, 238, 221, 240),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 218, 167, 227),
          foregroundColor: Color.fromARGB(255, 252, 232, 255),
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 252, 232, 255),
          ),
        ),
      ),
      home: const Expenses(),
    ),
  );
}
