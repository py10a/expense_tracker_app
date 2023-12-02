import 'package:flutter/material.dart';

import 'package:expense_tracker_app/widgets/expenses_list/expense_item.dart';
import 'package:expense_tracker_app/models/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.onDeleteExpense,
  });

  final void Function(Expense expense) onDeleteExpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (cntx, idx) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withAlpha(200),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (_) => onDeleteExpense(expenses[idx]),
        key: ValueKey(expenses[idx].id),
        child: ExpenseItem(expense: expenses[idx]),
      ),
    );
  }
}
