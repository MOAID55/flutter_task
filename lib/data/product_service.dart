import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/product.dart';

class ProductService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<Product>> getProducts() {
    return firestore.collection('product').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList());
  }

}