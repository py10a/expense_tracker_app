import 'package:flutter/material.dart';

import 'package:expense_tracker_app/widgets/chart/chart.dart';
import 'package:expense_tracker_app/widgets/modals/new_expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker_app/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expansesList = [
    Expense(
      name: 'Groceries',
      cost: 50.0,
      category: Category.food,
    ),
    Expense(
      name: 'Clothes',
      cost: 100.0,
      category: Category.clothes,
    ),
    Expense(
      name: 'Bills',
      cost: 200.0,
      category: Category.bills,
    ),
    Expense(
      name: 'Entertainment',
      cost: 150.0,
      category: Category.entertainment,
    ),
    Expense(
      name: 'Other',
      cost: 75.0,
      category: Category.other,
    ),
  ];

  /// Opens the modal bottom sheet to add a new expense
  void _openAddExpenseModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return NewExpense(onAddExpense: _addExpense);
      },
    );
  }

  /// Adds a new expense to the list of expenses
  void _addExpense(Expense expense) {
    setState(() {
      _expansesList.add(expense);
    });
  }

  /// Deletes an expense from the list of expenses
  void _deleteExpense(Expense expense) {
    final deletedExpanseIndex = _expansesList.indexOf(expense);
    setState(() {
      _expansesList.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${expense.name} deleted'),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              _expansesList.insert(deletedExpanseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(
        'No expenses added yet...',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(120, 158, 158, 158),
        ),
      ),
    );

    if (_expansesList.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _expansesList,
        onDeleteExpense: _deleteExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseModal,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _expansesList),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
