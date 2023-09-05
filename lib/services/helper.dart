import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/shoes_model.dart';

class Helper {
  Future<String> loadJsonData() async {
    return await rootBundle.loadString('assets/json/men_shoes.json');
  }

  Future<dynamic> getJsonData() async {
    String jsonString = await loadJsonData();
    return jsonDecode(jsonString);
  }

  Future<List<Sneakers>> getMaleSneakers() async {
    final data = await rootBundle.loadString("assets/json/men_shoes.json");

    final maleList = sneakersFromJson(data);

    return maleList;
  }

  Future<List<Sneakers>> getFemaleSneakers() async {
    final data = await rootBundle.loadString("assets/json/women_shoes.json");

    final femaleList = sneakersFromJson(data);

    return femaleList;
  }

  Future<List<Sneakers>> getKidsShoes() async {
    final data = await rootBundle.loadString("assets/json/kids_shoes.json");

    final kidsList = sneakersFromJson(data);

    return kidsList;
  }

  // Single Male
  Future<Sneakers> getMaleById(String id) async {
    final data = await rootBundle.loadString("assets/json/men_shoes.json");

    final maleList = sneakersFromJson(data);

    final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }

  // Single Female
  Future<Sneakers> getFemaleById(String id) async {
    final data = await rootBundle.loadString("assets/json/women_shoes.json");

    final femaleList = sneakersFromJson(data);

    final sneaker = femaleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }

  // Single kid
  Future<Sneakers> getKidsById(String id) async {
    final data = await rootBundle.loadString("assets/json/kids_shoes.json");

    final kidsList = sneakersFromJson(data);

    final sneaker = kidsList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }
}
