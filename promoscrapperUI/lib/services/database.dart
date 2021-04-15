import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:promoscrapperUI/models/favoriteProduct.dart';
import 'package:promoscrapperUI/models/product.dart';

class DatabaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Product>> getProducts() {
    return _db.collection('promos').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());
  }

  Stream<List<Product>> getFavoriteProducts() {
    return _db.collection('favorites').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());
  }

  Future<void> setEntry(FavoriteProduct favoriteProduct) {
    var options = SetOptions(merge: true);

    return _db
        .collection('favoriteProducts')
        .doc(favoriteProduct.id)
        .set(favoriteProduct.toMap(), options);
  }
}
