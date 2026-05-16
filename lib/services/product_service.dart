import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductService {
  static Future<List<Product>> loadProducts() async {
    try {
      final response = await http.get(
        Uri.parse('https://wantapi.com/products.php'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(response.body);

        final List<dynamic> jsonData = decodedData['data'];

        return jsonData.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception('API hatası');
      }
    } catch (e) {
      return [];
    }
  }
}
