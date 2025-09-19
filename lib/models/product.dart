import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String name;
  String imageUrl;
  double price;
  int quantity; // for cart

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.quantity = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': imageUrl,
      'price': price,
    };
  }

  factory Product.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;

    return Product(
      id: data['id'] ?? '',                // default empty string if null
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? 'https://burgerking.com.mt/wp-content/uploads/2020/03/Steakhouse-500-x-540.png',
      price: (data['price'] ?? 0).toDouble(),
      quantity: 0,
    );
  }
}
