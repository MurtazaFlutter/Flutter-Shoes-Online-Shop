import 'package:online_shop/utils/exports.dart';

class ProductNotifier extends ChangeNotifier {
  int _activePage = 0;
  List<dynamic> _shoesSizes = [];

  int get activePage => _activePage;
  List<dynamic> get shoesSizes => _shoesSizes;

  set activePage(int newPage) {
    _activePage = newPage;
    notifyListeners();
  }

  set shoesSizes(List<dynamic> newSizes) {
    _shoesSizes = newSizes;
    notifyListeners();
  }

  // function is called with index, it will toggle the selection
  // of that item and leave the selection of all other items as they were,
  // This will allow for multiple items to be selected at once.

  void toggleCheck(int index) {
    for (int i = 0; i < _shoesSizes.length; i++) {
      if (i == index) {
        _shoesSizes[i]['isSelected'] = !_shoesSizes[i]['isSelected'];
      }
    }
    notifyListeners();
  }
}
