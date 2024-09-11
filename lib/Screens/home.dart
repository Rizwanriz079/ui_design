import 'package:demo_pj/Screens/product_screen.dart';
import 'package:demo_pj/Custom/custom_appbar.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 58.0,
        flexibleSpace: CustomAppbar(),
      ),
      body: Center(
        child: ProductScreen(),
      ),
    );
  }
}
