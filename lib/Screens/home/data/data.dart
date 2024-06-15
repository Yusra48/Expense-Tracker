import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactionData = [
  {
    'icon': const FaIcon(
      FontAwesomeIcons.burger,
      size: 24,
      color: Colors.white,
    ),
    'color': Colors.orange[400],
    'name': 'Food',
    'Totalamount': '\$30.89',
    'Date': 'Today',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.bagShopping,
      size: 24,
      color: Colors.white,
    ),
    'color': Colors.purple[400],
    'name': 'Shopping',
    'Totalamount': '\$500.89',
    'Date': 'Yesterday',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.heartCircleCheck,
      size: 24,
      color: Colors.white,
    ),
    'color': Colors.green[500],
    'name': 'Health',
    'Totalamount': '\$27.39',
    'Date': 'Yesterday',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.plane,
      size: 24,
      color: Colors.white,
    ),
    'color': Colors.blue[400],
    'name': 'Travel',
    'Totalamount': '\$100.90',
    'Date': '24/May/2024',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.elevator,
      size: 24,
      color: Colors.white,
    ),
    'color': Colors.pink[400],
    'name': 'Electricity',
    'Totalamount': '\$25.85',
    'Date': '3/June/2024',
  },
];
