import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:promoscrapperUI/models/product.dart';

class DatabaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Product>> getProducts() {
    return _db.collection('promos').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Product.createMap(doc.data())).toList());
  }
}
