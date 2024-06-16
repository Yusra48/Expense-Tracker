import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math';

import 'package:flutter_application_1/Screens/add_expenses/views/Income/Confirmationpage.dart';
import 'package:flutter_application_1/Screens/profile/Profile.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  String amount = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: const Center(
          child: Text(
            'Income',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1.5,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Wallet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildCardsSection(context),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Send Money',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.black),
                    onPressed: () {
                      _showAmountDialog(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildPersonContainer(
                      imageUrl:
                          'https://cdn.pixabay.com/photo/2017/07/14/10/59/girl-2503468_1280.jpg',
                      name: 'Alexa Paul',
                      amount: '\$100.67',
                      color: const Color(0xFF8CD890),
                    ),
                    const SizedBox(width: 5),
                    _buildPersonContainer(
                      imageUrl:
                          'https://cdn.pixabay.com/photo/2015/06/22/08/40/child-817373_640.jpg',
                      name: 'John Doe',
                      amount: '\$50.00',
                      color: const Color(0xFF78B5E7),
                    ),
                    const SizedBox(width: 5),
                    _buildPersonContainer(
                      imageUrl:
                          'https://cdn.pixabay.com/photo/2023/08/13/18/08/woman-8188170_640.png',
                      name: 'Emily Smith',
                      amount: '\$200.99',
                      color: const Color(0xFFF1BE70),
                    ),
                    const SizedBox(width: 5),
                    _buildPersonContainer(
                      imageUrl:
                          'https://cdn.pixabay.com/photo/2020/03/11/10/08/camera-4921646_640.jpg',
                      name: 'David Johnson',
                      amount: '\$75.50',
                      color: const Color(0xFFD67CE6),
                    ),
                    const SizedBox(width: 5),
                    _buildPersonContainer(
                      imageUrl:
                          'https://cdn.pixabay.com/photo/2018/09/26/10/40/vintage-girl-3704270_640.png',
                      name: 'Jessica Lee',
                      amount: '\$120.45',
                      color: const Color(0xFFEB8282),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              if (amount.isNotEmpty)
                Text(
                  'Entered Amount: $amount',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardsSection(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        enlargeCenterPage: false,
        enableInfiniteScroll: false,
        viewportFraction: 0.6,
      ),
      items: [
        _buildCard(
          context: context,
          balance: '\$15,000.00',
          cardNumber: '8426 6024 7426 3674',
        ),
        _buildCard(
          context: context,
          balance: '\$9,000.00',
          cardNumber: '8426 6024 7426 3674',
        ),
        _buildCard(
          context: context,
          balance: '\$10,456.00',
          cardNumber: '8426 6024 7426 3674',
        ),
      ],
    );
  }

  Widget _buildCard({
    required BuildContext context,
    required String balance,
    required String cardNumber,
  }) {
    return Container(
      width: 250,
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.tertiary,
          ],
          transform: const GradientRotation(pi / 4),
        ),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.credit_card,
                size: 50,
                color: Colors.red,
              ),
              Spacer(),
              Text(
                'GT / 22',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            cardNumber,
            style: const TextStyle(color: Colors.black),
          ),
          const Spacer(),
          const Text(
            'Balance',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            balance,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonContainer({
    required String imageUrl,
    required String name,
    required String amount,
    required Color color,
  }) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 30,
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  void _showAmountDialog(BuildContext context) {
    final TextEditingController amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Amount'),
          content: TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Enter amount'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  amount = amountController.text;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationPage(amount: amount),
                  ),
                );
              },
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}
