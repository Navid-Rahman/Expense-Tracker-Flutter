import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(
    SafeArea(
      child: const MaterialApp(
        // TODO: Add main widget here...,
        debugShowCheckedModeBanner: false,
        home: Expenses(),
      ),
    ),
  );
}
