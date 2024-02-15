import 'dart:convert';


import 'package:http/http.dart' as http;
import '../Services/api.dart';
class MakeOrder{
  Future<dynamic> addOrder(dynamic body)async{
    http.Response response = await Api().orderApi("https://fakestoreapi.com/products",body);
    return jsonDecode(response.body);}


}