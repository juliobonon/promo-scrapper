import 'package:promoscrapperUI/models/product.dart';
import 'package:promoscrapperUI/services/database.dart';

class ProductProvider {
  final databaseService = DatabaseService();
  String _image;
  String _name;
  String _price;
  String _linkgatry;
  String _linkloja;
  String _site;

  String get name => _name;
  String get price => _price;
  String get image => _image;
  String get linkgatry => _linkgatry;
  String get linkloja => _linkloja;
  String get site => _site;

  Stream<List<Product>> get products => databaseService.getProducts();
}
