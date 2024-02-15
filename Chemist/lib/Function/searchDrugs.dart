import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Services/api.dart';
import '../Widgets/Custom_Button.dart';
import '../Widgets/model.dart';

class SearchDrugs {
  Future<List<Model>> getSearchDrugs(String name) async {
    Map<String,String>body={
      "categoryName":name,
    };
    http.Response response = await Api().post("$BaseUrl/search",body);
    dynamic decode = jsonDecode(response.body);
    print(response.body);
    List<Model> listProduct = [];
    for (int i = 0; i < decode['data']!.length; i++) {
      listProduct.add(Model.fromjson(decode['data']![i]));
    }
    return listProduct;
  }
}
//elphant
//setamol