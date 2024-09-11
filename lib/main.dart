// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/home.dart';
import 'Screens/product_screen.dart';
import 'models.dart'; // Correct import for CartProvider

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Colorful Homepage',
        home: Cart(),
        // theme: ThemeData(
        //   primarySwatch: Colors.deepPurple,
        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        // ),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => ProductsScreen(),
        //   '/cart': (context) => CartScreen(),
        //   '/orderHistory': (context) => OrderHistoryScreen(),
        // },
      ),
    );
  }
}
