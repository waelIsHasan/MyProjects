import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Services/api.dart';
import '../Widgets/model.dart';

class AllProduct {
  Future<List<Model>> getAllProduct() async {
    http.Response response =await Api().getStuff("https://fakestoreapi.com/products");
      Map<String,List> decode = jsonDecode(response.body);
      List<Model> listProduct = [];
      for (int i = 0; i < decode.length; i++) {
        listProduct.add(Model.fromjson(decode['data']![i]));
      }
      return listProduct;
    }
  }
