import 'package:online_shop/models/shoes_mode.dart';
import 'package:flutter/services.dart' as the_bundle;

class Helper {
  Future<MenShoesModel> getMaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');

    final maleList = MenShoesModel.fromJson(data as Map);
    return maleList;
  }
}
