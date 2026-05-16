class Product {
  final int id;
  final String name;
  final double price;
  final String currency;
  final String image;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.currency,
    required this.image,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['title'] ?? json['name'] ?? '',
      price:
          double.tryParse(
            json['price'].toString().replaceAll('\$', '').replaceAll(',', ''),
          ) ??
          0,
      currency: json['currency'] ?? 'USD',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
