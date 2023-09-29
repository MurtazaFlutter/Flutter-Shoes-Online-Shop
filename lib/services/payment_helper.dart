import 'package:http/http.dart' as https;
import '../utils/exports.dart';

class PaymentHelper {
  static var client = https.Client();

  Future<String> payment(Order order) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(Config.paymentBaseUrl, Config.paymentUrl);

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
