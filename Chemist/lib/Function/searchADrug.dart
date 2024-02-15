import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Services/api.dart';
import '../Widgets/Custom_Button.dart';
import '../Widgets/model.dart';

class SearchADrug {
  Future<Model> getSearchADrug(String name) async {
    Map<String,String>body={
      "scientificName":name,
    };
    http.Response response = await Api().post("$BaseUrl/search",body);
    Map<String,dynamic> decode = jsonDecode(response.body);
    Model model;
    model =Model.fromjson(decode['data']);
    return model;
  }
}
//elphant
//setamol