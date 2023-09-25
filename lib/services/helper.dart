import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:online_shop/models/sneaker_model.dart';
import 'package:online_shop/services/config.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop/utils/exports.dart';

class Helper {
  var client = http.Client();
  Future<String> loadJsonData() async {
    return await rootBundle.loadString('assets/json/men_shoes.json');
  }

  Future<dynamic> getJsonData() async {
    String jsonString = await loadJsonData();
    return jsonDecode(jsonString);
  }

  Future<List<Sneakers>> getMaleSneakers() async {
    var url = Uri.http(Config.apiUrl, Config.sneakers);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      final maleList = sneakersFromJson(response.body);

      final male = maleList.where((male) => male.category == 'Men\'s Running');
      return male.toList();
    } else {
      throw Exception("Failed");
    }
  }

  Future<List<Sneakers>> getFemaleSneakers() async {
    var url = Uri.http(Config.apiUrl, Config.sneakers);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      final femaleList = sneakersFromJson(response.body);

      final female =
          femaleList.where((female) => female.category == 'Women\'s Running');
      return female.toList();
    } else {
      throw Exception("Failed");
    }
  }

  Future<List<Sneakers>> getKidsShoes() async {
    var url = Uri.http(Config.apiUrl, Config.sneakers);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      final kidsList = sneakersFromJson(response.body);

      final kids = kidsList.where((kids) => kids.category == 'Kids\' Running');
      return kids.toList();
    } else {
      throw Exception("Failed");
    }
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

  // search product
  Future<List<Sneakers>> search(String searchQuery) async {
    var url = Uri.http(Config.apiUrl, "${Config.search}$searchQuery");

    var response = await client.get(url);

    if (response.statusCode == 200) {
      final results = sneakersFromJson(response.body);

      return results;
    } else {
      throw Exception("Failed");
    }
  }
}
