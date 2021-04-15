class FavoriteProduct {
  String id;
  String productId;
  String userId;

  FavoriteProduct({
    this.id,
    this.productId,
    this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'userId': userId,
    };
  }

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) {
    return FavoriteProduct(
      id: json['id'],
      productId: json['productId'],
      userId: json['userId'],
    );
  }
}
