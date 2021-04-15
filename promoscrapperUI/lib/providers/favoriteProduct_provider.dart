import 'package:promoscrapperUI/models/favoriteProduct.dart';
import 'package:promoscrapperUI/models/product.dart';
import 'package:promoscrapperUI/services/database.dart';
import 'package:uuid/uuid.dart';

class FavoriteProductProvider {
  final databaseService = DatabaseService();
  String _id;
  String _productId;
  String _userId;
  var uuid = Uuid();

  String get name => _id;
  String get price => _productId;
  String get image => _userId;

  Stream<List<Product>> get favoriteProducts =>
      databaseService.getFavoriteProducts();

  saveEntry() {
    if (_productId == null) {
      //Add
      var newEntry = FavoriteProduct(
          productId: _productId, id: uuid.v1(), userId: _userId);
      databaseService.setEntry(newEntry);
    } else {
      //Edit
    }
  }
}
