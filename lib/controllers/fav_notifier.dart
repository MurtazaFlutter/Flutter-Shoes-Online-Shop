import 'package:online_shop/utils/exports.dart';

class FavoriteNotifier extends ChangeNotifier {
  final _favBox = Hive.box('fav_box');
  List<dynamic> _ids = [];
  List<dynamic> _favorites = [];

  List<dynamic> get ids => _ids;

  set ids(List<dynamic> newIds) {
    _ids = newIds;
    notifyListeners();
  }

  List<dynamic> get favorites => _favorites;

  set fav(List<dynamic> newFav) {
    _favorites = newFav;
    notifyListeners();
  }

  // Future<void> _createFav(Map<String, dynamic> addFav) async {
  //   await _favBox.add(addFav);
  //   getFavorites();
  // }

  getFavorites() {
    final favData = _favBox.keys.map((key) {
      // final item = _favBox.get(key);

      return {
        "key": key,
        "id": "id",
      };
    }).toList();

    _favorites = favData.toList();
    _ids = _favorites.map((item) => item['id']).toList();
  }

  Future<void> createFav(Map<String, dynamic> addFav) async {
    await _favBox.add(addFav);
  }
}
