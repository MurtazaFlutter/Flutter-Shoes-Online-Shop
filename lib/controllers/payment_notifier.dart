import 'package:online_shop/utils/exports.dart';

class PaymentNotifier extends ChangeNotifier {
  String? _paymentUrl;

  String get paymentUrl => _paymentUrl ?? "";

  set setPaymentUrl(String newState) {
    _paymentUrl = newState;
    notifyListeners();
  }
}
