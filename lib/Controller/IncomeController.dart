import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeController extends GetxController {
  var transactions = <Map<String, String>>[].obs;
  var selectedType = 'Credit'.obs;
  var amountController = TextEditingController();

  void addTransaction() {
    if (amountController.text.isEmpty) return;

    transactions.add({
      'type': selectedType.value,
      'amount': amountController.text,
    });
    amountController.clear();
  }
}
