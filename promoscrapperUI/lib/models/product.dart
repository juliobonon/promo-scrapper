class Product {
  String image;
  String name;
  String price;
  String linkgatry;
  String linkloja;
  String site;

  Product(
      {this.price,
      this.image,
      this.name,
      this.linkgatry,
      this.linkloja,
      this.site});

  Map<String, dynamic> createMap() {
    return {
      'image': image,
      'productName': name,
      'price': price,
      'linkgatry': linkgatry,
      'linkloja': linkloja,
      'site': site
    };
  }

  factory Product.createMap(Map<String, dynamic> json) {
    return Product(
        name: json['name'],
        price: json['price'],
        image: json['image'],
        linkgatry: json['linkgatry'],
        linkloja: json['linkloja'],
        site: json['site']);
  }
}
