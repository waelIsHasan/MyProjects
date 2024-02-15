import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Services/api.dart';
import '../Widgets/Custom_Button.dart';
import '../Widgets/model.dart';

class AllOrder {
  Future<List<ModelOrder>> getOrders() async {
    http.Response response = await Api().getStuff("$BaseUrl/statusOrder");
    dynamic decode = jsonDecode(response.body);
    List<ModelOrder> listProduct = [];
    for (int i = 0; i < decode['data']!.length; i++) {
      listProduct.add(ModelOrder.fromjson(decode['data']![i]));
    }
    return listProduct;
  }
  Future<ModelOrder> OneOrdre(String n) async {
    http.Response response = await Api().getStuff("$BaseUrl/showOrder/$n");
     print(response.body);
    dynamic decode = jsonDecode(response.body);
    ModelOrder listProduct =ModelOrder.fromjson(decode['data']!);
    return listProduct;
  }

  Future<List<ModelOrder>> getReports(String start,String end) async {
    http.Response response = await Api().post("$BaseUrl/userReports",
      {
      "start_date":start,
      "end_date":end
       }
    );
    print(response.body);
    dynamic decode = jsonDecode(response.body);
    List<ModelOrder> listProduct = [];
    for (int i = 0; i < decode['data']!.length; i++) {
      listProduct.add(ModelOrder.fromjson(decode['data']![i]));
    }
    return listProduct;
  }

}