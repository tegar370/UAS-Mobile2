import 'dart:convert';

List<Cart> cartFromJson(String str) =>
    List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
  int id;
  int productId;
  int userId;
  int qty;
  int totalPrice;
  DateTime createdAt;
  DateTime updatedAt;
  Product product;

  Cart({
    required this.id,
    required this.productId,
    required this.userId,
    required this.qty,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        productId: json["product_id"],
        userId: json["user_id"],
        qty: json["qty"],
        totalPrice: json["total_price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "user_id": userId,
        "qty": qty,
        "total_price": totalPrice,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product": product.toJson(),
      };
}

class Product {
  int id;
  String name;
  String imageUrl;
  String description;
  int price;
  int stock;
  int qty;
  int totalRating;
  DateTime createdAt;
  DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.stock,
    required this.qty,
    required this.totalRating,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"]
            .toString()
            .replaceAll("127.0.0.1", "10.0.2.2")
            .replaceAll("localhost", "10.0.2.2"),
        description: json["description"],
        price: json["price"],
        stock: json["stock"],
        qty: json["qty"],
        totalRating: json["total_rating"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
        "description": description,
        "price": price,
        "stock": stock,
        "qty": qty,
        "total_rating": totalRating,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
