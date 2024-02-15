import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Widgets/Custom_Button.dart';
class Api extends StatelessWidget{
  static String id="Api";
  bool finish=true;

  Future<http.Response> getStuff(String url) async{
    http.Response response =await http.get(Uri.parse(url),
        headers:{
      'Authorization':token??'',
      'Accept':"application/json"});
    if(response.statusCode == 200){
      return response;
    }else {
      throw Exception('error in Status Code ${response.statusCode}');
    }
  }

  Future<http.Response> delete(String url,dynamic data) async{
    http.Response response =await http.delete(Uri.parse(url),body: data,
        headers:{
          'Authorization':token??'',
          'Accept':"application/json"});
    if(response.statusCode == 200){
      return response;
    }else {
      throw Exception('error in Status Code ${response.statusCode}');
    }
  }

  Future<http.Response> orderApi(String url,dynamic data) async{
    http.Response response =await http.post(Uri.parse(url),body: data,
        headers:{
          'Authorization':token??'',
          'Accept':"application/json"});
    if(response.statusCode == 200){
      return response;
    }else {
      throw Exception('error in Status Code ${response.statusCode}');
    }
  }
  Future<http.Response> post(String url, dynamic body) async{
    print(body);
    http.Response response =await  http.post(Uri.parse(url),body:body,
        headers:{
      'Authorization':token??'',
      'Accept':"application/json"});

    if(response.statusCode==200) {
      return response;
    }
    else {
      throw Exception('error with ${response.statusCode}');
    }
  }

  Future<http.Response> put(String url) async{
    http.Response response =await  http.put(Uri.parse(url),
        headers:{
          'Authorization':token??'',
          'Accept':"application/json"});

    if(response.statusCode==200) {
      return response;
    }
    else {
      throw Exception('error with ${response.statusCode}');
    }
  }


  @override
  Widget build(BuildContext context) {
   return Center(child:CircularProgressIndicator());
  }

}
