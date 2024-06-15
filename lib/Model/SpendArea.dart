import 'package:flutter/material.dart';

class SpendArea extends StatelessWidget {
  final String amount;
  final IconData icon;
  final Color color;

  SpendArea({required this.amount, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundColor: color,
          child: Icon(icon, color: Colors.white, size: 30.0),
        ),
        SizedBox(height: 8.0),
        Text(
          amount,
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
