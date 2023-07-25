// Importing required libraries
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';

// A StatelessWidget that represents the list of expenses
class ExpensesList extends StatelessWidget {
  const ExpensesList({
    Key? key,
    required this.expenses,
    required this.onRemoveExpense,
  }) : super(key: key);

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    // Using a ListView.builder to efficiently build a list of expenses
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (BuildContext context, int index) => Dismissible(
        // Each expense item is wrapped in a Dismissible widget for swipe-to-dismiss functionality
        key: ValueKey(expenses[index]),
        background: Container(
          // Background color for the dismissible widget when swiping to delete
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          // Callback when an item is dismissed (swiped to delete)
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]), // Displaying the ExpenseItem widget for each expense
      ),
    );
  }
}
