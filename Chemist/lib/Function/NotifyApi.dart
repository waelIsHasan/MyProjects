import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

import '../Services/api.dart';
import '../Widgets/Custom_Button.dart';
import '../Widgets/model.dart';

class NotifyApi {
  Future<List<ModelNotify>> getNotify() async {
    http.Response response = await Api().getStuff("$BaseUrl/getNotifications");
    dynamic decode = jsonDecode(response.body);
    List<ModelNotify> listProduct = [];
    for (int i = 0; i < decode['Notifications']!.length; i++) {
      listProduct.add(ModelNotify.fromjson(decode['Notifications']![i]));
    }
    return listProduct;
  }

  Future<dynamic> readNotify(String id) async {
    http.Response response = await Api().put("$BaseUrl/readNotificationUser/$id");
    print(response.body);
    return '';
  }


}