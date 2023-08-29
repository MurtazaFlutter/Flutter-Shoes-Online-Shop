import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:online_shop/models/shoes_model.dart';

class ShoesProvider with ChangeNotifier {
  List<Sneakers> _shoes = [];

  List<Sneakers> get shoes => _shoes;

  Future<void> loadMaleShoes() async {
    String jsonString =
        await rootBundle.loadString('assets/json/men_shoes.json');
    List<dynamic> jsonList = jsonDecode(jsonString);
    List<Sneakers> shoeList = [];
    for (var shoeJson in jsonList) {
      shoeList.add(Sneakers.fromJson(shoeJson));
    }
    _shoes = shoeList;
    notifyListeners();
  }

  Future<void> loadFemaleShoes() async {
    String jsonString =
        await rootBundle.loadString('assets/json/women_shoes.json');
    List<dynamic> jsonList = jsonDecode(jsonString);
    List<Sneakers> shoeList = [];
    for (var shoeJson in jsonList) {
      shoeList.add(Sneakers.fromJson(shoeJson));
    }
    _shoes = shoeList;
    notifyListeners();
  }

  Future<void> loadKidsShoes() async {
    String jsonString =
        await rootBundle.loadString('assets/json/kids_shoes.json');
    List<dynamic> jsonList = jsonDecode(jsonString);
    List<Sneakers> shoeList = [];
    for (var shoeJson in jsonList) {
      shoeList.add(Sneakers.fromJson(shoeJson));
    }
    _shoes = shoeList;
    notifyListeners();
  }
}
