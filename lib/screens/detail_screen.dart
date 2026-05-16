import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/cart_data.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Image.asset(product.image, fit: BoxFit.contain),
            ),
            const SizedBox(height: 20),

            Text(
              product.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              '${product.price} TL',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
 
            const SizedBox(height: 20),

            Text(product.description, style: const TextStyle(fontSize: 18)),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  CartData.cartItems.add(product);
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product.name} sepete eklendi'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text(
                  'Sepete Ekle',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
