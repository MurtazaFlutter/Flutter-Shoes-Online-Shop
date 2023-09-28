import 'dart:convert';
import 'package:online_shop/models/cart/add_to_cart.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop/models/cart/get_products.dart';
import 'package:online_shop/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartHelper {
  var client = http.Client();

  Future<bool> addToCart(AddToCart cart) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Token");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json' "Token: $token"
    };

    var url = Uri.http(Config.apiUrl, Config.addToCartUrl);
    var response = await client.post(url,
        body: jsonEncode(cart.toJson()), headers: requestHeaders);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Product>> getCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Token");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Token': 'Bearer $token'
    };
    var url = Uri.http(Config.apiUrl, Config.getCartUrl);

    var response = await http.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      print("getting cart ${response.body}");
      print("getting cart ${response.statusCode}");
      var jsonData = json.decode(response.body);

      List<Product> cart = [];
      var products = jsonData[0]['products'];

      cart = List<Product>.from(
          products.map((products) => Product.fromJson(products)));

      return cart;
    } else {
      throw Exception("Failed to show cart");
    }
  }
}
