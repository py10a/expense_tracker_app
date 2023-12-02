import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food,
  bills,
  clothes,
  entertainment,
  other,
}

const Map<Category, IconData> categoryIcons = {
  Category.food: Icons.fastfood,
  Category.bills: Icons.money,
  Category.clothes: Icons.shopping_bag,
  Category.entertainment: Icons.movie,
  Category.other: Icons.category,
};

class Expense {
  /// `Expense` represents an individual expense item.
  ///
  /// Each `Expense` has a unique [id], a [name], a [cost], a [category], and a [date].
  /// The [id] unique identifier for each expense, generated using a UUID.
  /// The [name] name of the expense.
  /// The [cost]  cost of the expense.
  /// The [category] category of the expense, which defaults to [Category.other] if not specified.
  /// The [date]  date of the expense, defaults is `DateTime.now()`.
  Expense({
    required this.name,
    required this.cost,
    this.category = Category.other,
    DateTime? date,
  })  : id = uuid.v4(),
        date = date ?? DateTime.now();

  final String id;
  final String name;
  final double cost;
  final Category category;
  final DateTime date;

  /// Returns a formatted date string in the format of `DD.MM.YYYY`.
  String get formattedDate {
    return '${date.day}.${date.month}.${date.year}';
  }
}
