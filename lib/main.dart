import 'package:flutter/material.dart';

import 'package:expense_tracker_app/widgets/expenses.dart';

/// Color scheme
final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 85, 1, 100),
);

/// Dark color scheme
final kColorDarkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 11, 1, 100),
);

void main() {
  runApp(
    MaterialApp(
      title: 'Expense Tracker',
      themeMode: ThemeMode.dark,
      home: const Expenses(),

      /// Dark theme
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kColorDarkScheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorDarkScheme.primary,
            foregroundColor: kColorDarkScheme.primaryContainer,
          ),
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorDarkScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
        ),
      ),

      /// Light theme
      theme: ThemeData.light().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primary,
            foregroundColor: kColorScheme.primaryContainer,
          ),
        ),
        iconTheme: const IconThemeData().copyWith(
          color: kColorScheme.onSecondaryContainer,
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: kColorScheme.onSecondaryContainer,
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: kColorScheme.onSecondaryContainer,
          ),
        ),
      ),
    ),
  );
}
