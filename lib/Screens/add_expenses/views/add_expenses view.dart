import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/Expense%20Controller.dart';
import 'package:flutter_application_1/Model/ExpenseModel.dart';
import 'package:flutter_application_1/Screens/home/views/Viewall.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final ExpenseController expenseController = Get.put(ExpenseController());

  final TextEditingController expenseTextController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  DateTime selectDate = DateTime.now();
  Category? selectedCategory;

  final List<Map<String, dynamic>> iconList = [
    {'icon': FontAwesomeIcons.film, 'name': 'Entertainment'},
    {'icon': FontAwesomeIcons.utensils, 'name': 'Food'},
    {'icon': FontAwesomeIcons.heartPulse, 'name': 'Health'},
    {'icon': FontAwesomeIcons.moneyBill, 'name': 'Electricity'},
    {'icon': FontAwesomeIcons.paypal, 'name': 'Paypal'},
    {'icon': FontAwesomeIcons.dog, 'name': 'Pet'},
    {'icon': FontAwesomeIcons.phone, 'name': 'Phone'},
    {'icon': CupertinoIcons.shopping_cart, 'name': 'Shopping'},
    {'icon': FontAwesomeIcons.plane, 'name': 'Travel'},
  ];

  @override
  void dispose() {
    expenseTextController.dispose();
    categoryController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Center(
          child: Text(
            'Add Expense',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Get.to(() => ViewAll());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            _buildTextField(
              controller: expenseTextController,
              hintText: 'Amount',
              prefixIcon: FontAwesomeIcons.dollarSign,
              inputType: TextInputType.number,
            ),
            _buildTextField(
              controller: categoryController,
              hintText: 'Category',
              prefixIcon: selectedCategory?.icon ?? FontAwesomeIcons.list,
              readOnly: true,
              onTap: _showCreateCategoryDialog,
            ),
            _buildTextField(
              controller: dateController,
              hintText: 'Date',
              prefixIcon: FontAwesomeIcons.clock,
              readOnly: true,
              onTap: _selectDate,
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton(
                onPressed: _saveExpense,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    bool readOnly = false,
    TextInputType inputType = TextInputType.text,
    Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        keyboardType: inputType,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (newDate != null) {
      setState(() {
        selectDate = newDate;
        dateController.text = DateFormat('dd/MM/yyyy').format(newDate);
      });
    }
  }

  void _showCreateCategoryDialog() {
    TextEditingController categoryNameController = TextEditingController();
    IconData? iconSelected;
    Color categoryColor = Colors.white;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Create a Category'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: categoryNameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (ctx2) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ColorPicker(
                                  onColorChanged: (value) {
                                    setState(() {
                                      categoryColor = value;
                                    });
                                  },
                                  pickerColor: categoryColor,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(ctx2);
                                  },
                                  child: const Text('Save'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: categoryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text('Pick Color'),
                      ),
                    ),
                  ),
                  DropdownButtonFormField<IconData>(
                    value: iconSelected,
                    onChanged: (newValue) {
                      setState(() {
                        iconSelected = newValue;
                      });
                    },
                    items: iconList.map((item) {
                      return DropdownMenuItem<IconData>(
                        value: item['icon'],
                        child: Row(
                          children: [
                            Icon(item['icon']),
                            const SizedBox(width: 8),
                            Text(item['name']),
                          ],
                        ),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (categoryNameController.text.isNotEmpty &&
                        iconSelected != null) {
                      Category newCategory = Category(
                        name: categoryNameController.text,
                        icon: iconSelected!,
                        color: categoryColor,
                      );
                      setState(() {
                        selectedCategory = newCategory;
                        categoryController.text = newCategory.name;
                      });
                      Get.back();
                    } else {
                      Get.snackbar(
                        'Error',
                        'Please fill all fields',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _saveExpense() {
    double? amount = double.tryParse(expenseTextController.text);

    if (amount == null || amount == 0) {
      Get.snackbar(
        'Error',
        'Please enter a valid amount.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (selectedCategory == null) {
      Get.snackbar(
        'Error',
        'Please select a category.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    expenseController.addExpense(
      amount,
      categoryController.text,
      selectedCategory!.name,
      selectDate,
      selectedCategory!.icon,
      selectedCategory!.color,
    );

    expenseTextController.clear();
    categoryController.clear();
    dateController.clear();
    setState(() {
      selectedCategory = null;
      selectDate = DateTime.now();
    });

    Get.snackbar(
      'Expense Saved',
      'Expense has been successfully added!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}
