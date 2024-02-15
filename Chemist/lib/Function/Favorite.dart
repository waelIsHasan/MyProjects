import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Services/api.dart';
import '../Widgets/Custom_Button.dart';
import '../Widgets/model.dart';

class FavoriteDrug {
  Future<dynamic> addFavorite(String idDrug) async {
    http.Response response = await Api().post("$BaseUrl/addfavorites?drug_id=$idDrug",idDrug);
    print(response.body);
    return response;
  }

  Future<dynamic> deleteFavorit(String idDrug) async {
    http.Response response = await Api().delete("$BaseUrl/desroyfavorites?drug_id=$idDrug",idDrug);
    print(response.body);
    return response;
  }

  Future<List<Model>> getAllFavorite() async {
    http.Response response = await Api().getStuff("$BaseUrl/favorites");
    print(response.body);
    dynamic decode = jsonDecode(response.body);
    List<Model> listProduct = [];
    for (int i = 0; i < decode['data']!.length; i++) {
      listProduct.add(Model.fromjson(decode['data']![i]));
    }
    return listProduct;
  }
}
//elphant
//setamol