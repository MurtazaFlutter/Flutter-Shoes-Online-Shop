import 'dart:developer';
import 'package:http/http.dart' as http;
import '../utils/exports.dart';

class CartHelper {
  var client = http.Client();

  Future<bool> addToCart(AddToCart cart) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Token");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Token': 'Bearer $token'
    };

    var url = Uri.http(Config.apiUrl, Config.addToCartUrl);
    var response = await client.post(url,
        body: jsonEncode(cart.toJson()), headers: requestHeaders);

    log("add to cart body ${response.body}");
    log("add to cart body ${response.statusCode}");

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
    log(" cart data ${response.body}");
    log("status ${response.statusCode}");

    if (response.statusCode == 200) {
      log(" cart data ${response.body}");
      log("status ${response.statusCode}");
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

  Future<bool> deleteItem(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Token");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Token': 'Bearer $token',
    };

    var url = Uri.http(Config.apiUrl, "${Config.addToCartUrl}/$id");

    var response = await client.delete(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
