import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/SpendArea.dart';
import 'package:flutter_application_1/Screens/Expenses/Mychart.dart';
import 'package:flutter_application_1/Screens/add_expenses/views/Income/Incomepage.dart';
import 'package:get/get.dart';
import 'dart:math';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  bool isIncomeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Transactions',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 20),
            child: Container(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isIncomeSelected = false;
                        });
                        Get.to(() => const ExpenseScreen());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: !isIncomeSelected
                              ? LinearGradient(
                                  colors: [
                                    Theme.of(context).colorScheme.secondary,
                                    Theme.of(context).colorScheme.tertiary,
                                    Theme.of(context).colorScheme.primary,
                                  ],
                                  transform: const GradientRotation(pi / 4),
                                )
                              : null,
                          color: !isIncomeSelected ? null : Colors.grey[300],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Text('Expenses',
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: !isIncomeSelected
                                    ? Colors.white
                                    : Colors.black)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isIncomeSelected = true;
                        });
                        Get.to(() => const IncomePage());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: isIncomeSelected
                              ? LinearGradient(
                                  colors: [
                                    Theme.of(context).colorScheme.secondary,
                                    Theme.of(context).colorScheme.tertiary,
                                    Theme.of(context).colorScheme.primary,
                                  ],
                                  transform: const GradientRotation(pi / 4),
                                )
                              : null,
                          color: isIncomeSelected ? null : Colors.grey[300],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Text('Income',
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: isIncomeSelected
                                    ? Colors.white
                                    : Colors.black)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 450,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(12, 20, 12, 12),
              child: MyChart(),
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Spend',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '₹ 54,087',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[400],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Padding(
                      padding: EdgeInsets.only(left: 380),
                      child: Text(
                        'June 2024',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Top Spend Areas',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpendArea(
                    amount: '₹ 19,800',
                    icon: Icons.fastfood,
                    color: Colors.orange,
                  ),
                  SpendArea(
                    amount: '₹ 14,037',
                    icon: Icons.shopping_cart,
                    color: Colors.green,
                  ),
                  SpendArea(
                    amount: '₹ 12,200',
                    icon: Icons.car_rental,
                    color: Colors.blue,
                  ),
                  SpendArea(
                    amount: '₹ 5,000',
                    icon: Icons.warning,
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
