import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Services/api.dart';
import '../Widgets/Custom_Button.dart';
import '../Widgets/model.dart';

class AllCategoryProduct {
  Future<List<Model>> getCategoryProduct(int number) async {
    http.Response response = await Api().getStuff("$BaseUrl/showCategories/$number");
      dynamic decode = jsonDecode(response.body);
      List<Model> listProduct = [];
      for (int i = 0; i < decode['data']!.length; i++) {
        listProduct.add(Model.fromjson(decode['data']![i]));
      }
      return listProduct;
    }
  }
