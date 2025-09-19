import 'package:flutter/material.dart';
import '../data/product_service.dart';
import '../models/product.dart';
import '../models/category.dart';

class FoodMenuViewModel extends ChangeNotifier {
  final ProductService _productService = ProductService();

  // Categories
  List<Category> _categories = [
    Category(name: 'أفضل العروض', isSelected: true),
    Category(name: 'مستورد'),
    Category(name: 'أجبان قابلة للدهن'),
    Category(name: 'أجبان'),
  ];

  List<Category> get categories => _categories;

  void selectCategory(int index) {
    _categories = _categories.asMap().entries.map((entry) {
      return Category(
        name: entry.value.name,
        isSelected: entry.key == index,
      );
    }).toList();
    notifyListeners();
  }

  // Firebase products stream
  Stream<List<Product>> get products => _productService.getProducts();

  // Cart
  final List<Product> _cartItems = [];
  List<Product> get cartItems => _cartItems;


  double get totalCartPrice =>
      _cartItems.fold(0.0, (sum, item) => sum + item.price * item.quantity);

  int get totalCartItems =>
      _cartItems.fold(0, (sum, item) => sum + item.quantity);

  // Merge Firebase product with cart quantity
  Product getProductWithCartQuantity(Product product) {
    final cartItem = _cartItems.firstWhere(
            (item) => item.id == product.id,
        orElse: () => Product(
          id: product.id,
          name: product.name,
          imageUrl: product.imageUrl,
          price: product.price,
          quantity: 0,
        ));
    return Product(
      id: product.id,
      name: product.name,
      imageUrl: product.imageUrl,
      price: product.price,
      quantity: cartItem.quantity,
    );
  }

  // Cart operations
  void addToCart(Product product) {
    final index = _cartItems.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      _cartItems[index].quantity += 1;
    } else {
      _cartItems.add(Product(
        id: product.id,
        name: product.name,
        imageUrl: product.imageUrl,
        price: product.price,
        quantity: 1,
      ));
    }
    notifyListeners();
  }

  void updateQuantity(String productId, int quantity, double price) {
    final index = _cartItems.indexWhere((item) => item.id == productId);
    if (index != -1) {
      if (quantity <= 0) {
        _cartItems.removeAt(index);
      } else {
        _cartItems[index].quantity = quantity;
      }
    } else if (quantity > 0) {
      // Add new item if quantity > 0
      _cartItems.add(Product(
        id: productId,
        name: '',
        imageUrl: '',
        price: price * quantity,
        quantity: quantity,
      ));
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
