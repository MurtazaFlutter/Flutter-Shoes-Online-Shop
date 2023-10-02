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

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<GetCart>> getCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Token");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Token': 'Bearer $token'
    };
    var url = Uri.http(Config.apiUrl, Config.getCartUrl);

    var response = await http.get(url, headers: requestHeaders);
    log(" cart data ${response.body}");

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      log(" cart data ${response.body}");

      List<GetCart> cart = [];
      var products = jsonData['products'];
      log(" cart data ${response.body}");

      cart = List<GetCart>.from(
          products.map((product) => GetCart.fromJson(product)));
      log(" cart data $cart");

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
