import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/Controller/Expense%20Controller.dart';
import 'package:intl/intl.dart';

class ViewAll extends StatelessWidget {
  final ExpenseController expenseController = Get.put(ExpenseController());

  ViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Expenses',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: expenseController.expenses.length,
          itemBuilder: (context, index) {
            final expense = expenseController.expenses[index];
            return ListTile(
              leading: Icon(expense.icon, color: expense.color),
              title: Text(expense.description),
              subtitle: Text(DateFormat('dd/MM/yyyy').format(expense.date)),
              trailing: Text('\$${expense.amount.toStringAsFixed(2)}'),
            );
          },
        );
      }),
    );
  }
}
