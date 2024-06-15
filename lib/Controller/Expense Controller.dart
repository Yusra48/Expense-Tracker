import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/ExpenseModel.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController {
  var expenses = <Expense>[].obs;
  var categories = <Category>[].obs;
  void addExpense(double amount, String description, String categoryName,
      DateTime date, IconData icon, Color color) {
    final newExpense = Expense(
      amount: amount,
      description: description,
      categoryName: categoryName,
      date: date,
      icon: icon,
      color: color,
    );
    expenses.add(newExpense);
    update();
  }

  void addCategory(String name, IconData icon, Color color) {
    if (name.isEmpty) {
      Get.snackbar(
        'Error',
        'Category name cannot be empty',
      );
      return;
    }

    final category = Category(name: name, icon: icon, color: color);
    categories.add(category);
    update();
  }
}
