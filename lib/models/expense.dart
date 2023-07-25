// Importing required libraries
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

// Generating unique IDs using the Uuid library
const uuid = Uuid();

// Date formatter for displaying formatted dates
final formatter = DateFormat.yMd();

// Enum representing different expense categories
enum Category {
  food,
  travel,
  leisure,
  work,
}

// Map associating each category with its corresponding icon (using built-in icons)
const categoryIcons = {
  // Category.food: Image(
  //   width: 60,
  //   image: AssetImage(
  //     'assets/icons/hot-pot.png',
  //   ),
  // ),
  Category.food: Icons.dinner_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie_filter,
  Category.work: Icons.work,
};

// Class representing an individual expense item
class Expense {
  Expense({
    required this.amount,
    required this.category,
    required this.date,
    required this.title,
  }) : id = uuid.v4();

  final double amount; // Amount of the expense
  final Category category; // Category of the expense
  final DateTime date; // Date of the expense
  final String id; // Unique ID for the expense
  final String title; // Title of the expense

  // Method to get the formatted date as a string
  String get formattedDate {
    return formatter.format(date);
  }
}

// Class representing a collection of expenses with a specific category
class ExpenseBucket {
  ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  // Constructor for creating an expense bucket for a specific category
  ExpenseBucket.forCategory(
    List<Expense> allExpenses,
    this.category,
  ) : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category; // Category of the expenses in this bucket
  final List<Expense> expenses; // List of expenses in this bucket

  // Method to calculate the total expenses for this category
  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
