import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Services/api.dart';


class AllCategories {
  Future<List<dynamic>> getAllCategories() async {
    http.Response response = await Api().getStuff("https://fakestoreapi.com/products/categories");
      List<dynamic> decode = jsonDecode(response.body);
      List<String> listCategories = [];
      for (int i = 0; i < decode.length; i++) {
        listCategories.add(decode[i]);
      }
      return listCategories;
    }
}
