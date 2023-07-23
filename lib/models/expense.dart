// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
}

const categoryIcons = {
  Category.food: Icons.dinner_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie_filter,
  Category.work: Icons.work_sharp,
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
}
