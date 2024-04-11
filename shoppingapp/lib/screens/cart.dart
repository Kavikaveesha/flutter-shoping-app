import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../data/model/banner_model.dart';

class BannerModel {
  String? name;
  String? image;
  String? price;
  int? quantity;
  String? image1;
  String? image2;
  String? image3;

  BannerModel({
    this.name,
    this.image,
    this.price,
    this.quantity,
    this.image1,
    this.image2,
    this.image3,
  });
}

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<BannerModel> cartItems = [
    BannerModel(
      name: 'Product 1',
      price: '29.99',
      quantity: 1,
    ),
    BannerModel(
      name: 'Product 2',
      price: '49.99',
      quantity: 2,
    ),
    BannerModel(
      name: 'Product 3',
      price: '19.99',
      quantity: 1,
    ),
    BannerModel(
      name: 'Product 4',
      price: '39.99',
      quantity: 3,
    ),
    BannerModel(
      name: 'Product 5',
      price: '59.99',
      quantity: 1,
    ),
  ];

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += double.parse(item.price!) * item.quantity!;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: mains,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                 
                  title: Text(item.name!),
                  subtitle: Text('\$${item.price} x ${item.quantity}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      setState(() {
                        cartItems.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${calculateTotalPrice().toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle checkout
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: mains,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Checkout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
