import 'package:flutter/material.dart';

import '../shared/app_style.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Cart Screen',
          style: appStyle(40, Colors.black, FontWeight.bold, 0),
        ),
      ),
    );
  }
}
