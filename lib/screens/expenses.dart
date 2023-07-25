// Importing required libraries
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/screens/new_expense.dart';

// A StatefulWidget that represents the main screen of the Expense Tracker app
class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

// The State class for the Expenses widget
class _ExpensesState extends State<Expenses> {
  // List of registered expenses (initially contains some dummy data)
  final List<Expense> _registeredExpenses = [
    Expense(
      amount: 19.99,
      category: Category.work,
      date: DateTime.now(),
      title: 'Flutter Course',
    ),
    Expense(
      amount: 15.69,
      category: Category.leisure,
      date: DateTime.now(),
      title: 'Cinema',
    ),
    Expense(
      amount: 9.99,
      category: Category.food,
      date: DateTime.now(),
      title: 'Burger',
    ),
  ];

  // Function to open the 'Add Expense' overlay
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpense(onAddExpense: _addExpense),
    );
  }

  // Function to add a new expense to the list
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  // Function to remove an expense from the list
  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // Variable to hold the main content of the screen
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    // Checking if there are any registered expenses
    if (_registeredExpenses.isNotEmpty) {
      // If expenses are available, show the ExpensesList widget with the list of expenses
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    // Building the main Scaffold of the screen
    return Scaffold(
      appBar: AppBar(
        // AppBar with the app title and 'Add' button
        //backgroundColor: Colors.amber, // Uncomment this line to set a background color for the app bar
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: () {
              _openAddExpenseOverlay(); // Opening the 'Add Expense' overlay
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              // Column layout for the main content
              children: [
                // Chart widget to display expense statistics
                Chart(expenses: _registeredExpenses),

                // Expanded widget to take the remaining space and display the expenses list
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              // Column layout for the main content
              children: [
                // Chart widget to display expense statistics
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),

                // Expanded widget to take the remaining space and display the expenses list
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
