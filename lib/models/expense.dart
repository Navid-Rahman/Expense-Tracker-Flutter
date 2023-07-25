// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category {
  food,
  travel,
  leisure,
  work,
}

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

class Expense {
  Expense({
    required this.amount,
    required this.category,
    required this.date,
    required this.title,
  }) : id = uuid.v4();

  final double amount;
  final Category category;
  final DateTime date;
  final String id;
  final String title;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(
    List<Expense> allExpenses,
    this.category,
  ) : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      //sum = sum + expense.amount;
      sum += expense.amount;
    }
    return sum;
  }
}
