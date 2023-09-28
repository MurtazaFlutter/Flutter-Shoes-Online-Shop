import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_shop/services/config.dart';
import '../models/orders/orders_req.dart';

class PaymentHelper {
  static var client = http.Client();

  Future<String> payment(Order order) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, Config.paymentUrl);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(order.toJson()));

    if (response.statusCode == 200) {
      var payment = jsonDecode(response.body);
      return payment['url'];
    } else {
      return 'Failed';
    }
  }
}
