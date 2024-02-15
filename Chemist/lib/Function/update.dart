import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Services/api.dart';


class Update {
  Future<dynamic> update(dynamic title,dynamic decs,dynamic price,dynamic image,dynamic category,{String? token})async{
  http.Response response = await Api().post("https://fakestoreapi.com/products",
      {"title":title,"description":decs,"price":"$price","image":"$image","category":"$category"});
  return jsonDecode(response.body);}

}