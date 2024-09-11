import 'package:demo_pj/Screens/product_card.dart';
import 'package:flutter/material.dart';

import '../Custom/side_bar_icon.dart';
import '../models.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}
class _ProductScreenState extends State<ProductScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<CartItem> _cartItems = [];
  List<CartItem> _products = [
    CartItem(name: 'Dessert', image: 'assets/a (2).jpg', price: 630.00),
    CartItem(name: 'Dessert', image: 'assets/a (3).jpg', price: 630.00),
    CartItem(name: 'Burger', image: 'assets/burger.jpg', price: 450.00),
    CartItem(name: 'Pizza', image: 'assets/pizza.jpg', price: 750.00),
    CartItem(name: 'Burger', image: 'assets/double.jpg', price: 750.00),
    CartItem(name: 'Burger', image: 'assets/burger.jpg', price: 450.00),
    CartItem(name: 'Dessert', image: 'assets/a (4).jpg', price: 750.00),
    CartItem(name: 'Dessert', image: 'assets/a (3).jpg', price: 630.00),
    CartItem(name: 'Burger', image: 'assets/burger.jpg', price: 450.00),
    CartItem(name: 'Pizza', image: 'assets/pizza.jpg', price: 750.00),
    CartItem(name: 'Dessert', image: 'assets/a (3).jpg', price: 630.00),
    CartItem(name: 'Pizza', image: 'assets/pizza.jpg', price: 750.00),
    CartItem(name: 'Burger', image: 'assets/burger.jpg', price: 450.00),
  ];

  void _toggleDrawer() {
    if (_scaffoldKey.currentState!.isEndDrawerOpen) {
      Navigator.of(context).pop(); // Close the drawer if it's already open
    } else {
      _scaffoldKey.currentState!.openEndDrawer(); // Open the end drawer
    }
  }

  void _addToCart(CartItem item) {
    setState(() {
      _cartItems.add(item); // Add the item to the cart
    });
    _toggleDrawer(); // Open the drawer when an item is added
  }

  void _updateQuantity(int index, int newQuantity) {
    setState(() {
      _cartItems[index].quantity = newQuantity; // Update the quantity
    });
  }

  void _removeFromCart(int index) {
    setState(() {
      _cartItems.removeAt(index); // Remove the item from the cart
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.50, // Set width to 75% of screen width
        child: Drawer(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ..._cartItems.asMap().entries.map((entry) {
                      int index = entry.key;
                      CartItem item = entry.value;
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        leading: Image.asset(
                          item.image,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(item.name),
                        subtitle: Row(
                          children: [
                            Text('₹${item.price.toStringAsFixed(2)}'),
                            SizedBox(width: 16),
                            Text('Qty:'),
                            SizedBox(width: 4),
                            DropdownButton<int>(
                              value: item.quantity,
                              items: List.generate(10, (i) => i + 1).map((value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                              onChanged: (int? newQuantity) {
                                if (newQuantity != null) {
                                  _updateQuantity(index, newQuantity);
                                }
                              },
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removeFromCart(index),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Total: ₹${_cartItems.fold(0.0, (sum, item) => sum + item.price * item.quantity).toStringAsFixed(2)}',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Handle order action
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.orange, // Button background color
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Order Now'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      body: Row(
        children: [
          Container(
            width: 60,
            color: Colors.blueGrey[120],
            child: Column(
              children: [
                sidebarIcon(Icons.person),
                sidebarIcon(Icons.home_outlined),
                sidebarIcon(Icons.search),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.48,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: _products.length, // Ensure correct item count
                itemBuilder: (context, index) {
                  return ProductCard(
                    onAddToCart: _addToCart,
                    item: _products[index], // Pass the CartItem object to ProductCard
                  );
                },
              ),
            ),
          ),
          Container(
            width: 60,
            color: Colors.blueGrey[60],
            child: Column(
              children: [
                GestureDetector(
                  onTap: _toggleDrawer, // Open/close drawer when tapped
                  child: sidebarIcon(Icons.shopping_cart_outlined),
                ),
                sidebarIcon(Icons.home_outlined),
                sidebarIcon(Icons.stacked_bar_chart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


