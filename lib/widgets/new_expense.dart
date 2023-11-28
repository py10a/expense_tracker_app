import 'package:flutter/material.dart';

import 'package:expense_tracker_app/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({
    super.key,
    required this.onAddExpense,
  });

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _nameController = TextEditingController();
  final _costController = TextEditingController();
  DateTime? _chosenDate;
  Category _selectedCategory = Category.other;

  /// Present a date picker to the user.
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1);
    final chosenDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _chosenDate = chosenDate;
    });
  }

  /// Submit the expense to the parent widget.
  void _submitExpense() {
    final name = _nameController.text.trim();
    final cost = double.parse(_costController.text);
    final date = _chosenDate;

    if (name.isEmpty || cost <= 0 || date == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            icon: const Icon(
              Icons.warning,
              color: Colors.orange,
            ),
            title: const Text('Invalid input'),
            content: const Text('Please enter valid name, cost and date.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('OK'),
              )
            ],
          );
        },
      );
      return;
    }

    widget.onAddExpense(
      Expense(
        name: name,
        cost: cost,
        date: date,
        category: _selectedCategory,
      ),
    );
    Navigator.of(context).pop();
  }

  /// dispose() is called when the widget is removed from the widget tree.
  @override
  void dispose() {
    _nameController.dispose();
    _costController.dispose();
    _chosenDate = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            keyboardType: TextInputType.text,
            maxLength: 50,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _costController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Cost',
                    prefixText: '\$ ',
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _chosenDate == null
                          ? 'No date chosen'
                          : '${_chosenDate!.day}.${_chosenDate!.month}.${_chosenDate!.year}',
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_today),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value ?? Category.other;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submitExpense,
                child: const Text('Add Expense'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
