// Importing required libraries
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

// A StatelessWidget that represents an individual expense item
class ExpenseItem extends StatelessWidget {
  const ExpenseItem(
    this.expense, {
    Key? key,
  }) : super(key: key);

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    // Checking if the current platform brightness is dark mode
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    // Building the expense item as a Card with padding and a Column layout
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Displaying the title of the expense
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            // Row layout to display the amount and category of the expense
            Row(
              children: [
                // Displaying the amount of the expense with fixed 2 decimal places
                Text('\$${expense.amount.toStringAsFixed(2)}'),

                // Spacer widget to push the rest of the content to the right
                const Spacer(),

                // Row layout to display the expense category icon and formatted date
                Row(
                  children: [
                    // Displaying the category icon with appropriate color based on the theme
                    Icon(
                      categoryIcons[expense.category],
                      color: isDarkMode
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.7),
                    ),
                    const SizedBox(width: 8),

                    // Displaying the formatted date of the expense
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
