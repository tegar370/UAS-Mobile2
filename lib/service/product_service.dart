import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tokoto/constants.dart';

import '../model/cart.dart' as cart;
import '../model/product.dart';
import '../util/token.dart';

class ProductService {
  Future<List<Product>> getProducts() async {
    try {
      print("object");
      final response = await http.get(
        Uri.parse('$baseUrl/product'),
      );

      print(response.body);
      final List<Product> products = productsFromJson(
        jsonEncode(json.decode(response.body)['data']),
      );
      return products;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addToCart(int id, int qty) async {
    try {
      final Map<String, dynamic> data = {
        "product_id": id,
        "qty": qty,
      };
      print("aa");
      final response = await http.post(
        Uri.parse('$baseUrl/cart'),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        },
        body: jsonEncode(data),
      );
      print(response.body);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<cart.Cart>> getCart() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/cart'),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      print(response.body);
      final List<cart.Cart> carts = cart.cartFromJson(
        jsonEncode(json.decode(response.body)['data']),
      );
      return carts;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> checkout(int totalPrice, String paymentMethod) async {
    try {
      final Map<String, dynamic> data = {
        "total_price": totalPrice,
        "pembayaran": paymentMethod
      };
      print("aa");
      final response = await http.post(
        Uri.parse('$baseUrl/cart/checkout'),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        },
        body: jsonEncode(data),
      );
      print(response.body);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
