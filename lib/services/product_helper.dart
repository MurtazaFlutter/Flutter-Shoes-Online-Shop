import 'package:http/http.dart' as http;
import 'package:online_shop/models/sneaker_model.dart';
import '../utils/exports.dart';

class ProductHelper {
  var client = http.Client();

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
