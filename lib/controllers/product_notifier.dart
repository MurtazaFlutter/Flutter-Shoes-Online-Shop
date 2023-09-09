import 'package:online_shop/utils/exports.dart';

class ProductNotifier extends ChangeNotifier {
  int _activePage = 0;

  int get activePage => _activePage;

  set activePage(int newPage) {
    _activePage = newPage;
    notifyListeners();
  }
}
