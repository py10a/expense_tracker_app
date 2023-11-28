import 'package:flutter/material.dart';

import 'package:expense_tracker_app/widgets/new_expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker_app/constants/colors.dart';
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
      showDragHandle: true,
      context: context,
      builder: (context) {
        return const NewExpense();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
            onPressed: _openAddExpenseModal,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ExpenseList(expenses: _expansesList),
          ),
        ],
      ),
    );
  }
}
