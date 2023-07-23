import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(
    SafeArea(
      child: MaterialApp(
        // TODO: Add main widget here...,
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: const Expenses(),
      ),
    ),
  );
}
