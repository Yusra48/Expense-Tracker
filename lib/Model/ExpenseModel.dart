import 'package:flutter/material.dart';

class Expense {
  final double amount;
  final String description;
  final String categoryName;
  final DateTime date;
  final IconData icon;
  final Color color;

  Expense({
    required this.amount,
    required this.description,
    required this.categoryName,
    required this.date,
    required this.icon,
    required this.color,
  });
}

class Category {
  final String name;
  final IconData icon;
  final Color color;

  Category({
    required this.name,
    required this.icon,
    required this.color,
  });
}
