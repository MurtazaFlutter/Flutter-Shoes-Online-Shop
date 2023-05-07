import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:online_shop/models/shoes_mode.dart';

class ShoesProvider with ChangeNotifier {
  List<Sneakers> _shoes = [];

  List<Sneakers> get shoes => _shoes;

  Future<void> loadShoes() async {
    String jsonString = await rootBundle.loadString('assets/json/men_shoes.json');
    List<dynamic> jsonList = jsonDecode(jsonString);
    List<Sneakers> shoeList = [];
    for (var shoeJson in jsonList) {
      shoeList.add(Sneakers.fromJson(shoeJson));
    }
    _shoes = shoeList;
    notifyListeners();
  }
}
