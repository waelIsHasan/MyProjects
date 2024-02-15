import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/model.dart';

class AppStoreProvider extends ChangeNotifier {
  //Veriables
  bool  _login=false;
  bool _regiser=false;
  String? _category;
  int _category_id=1;
  String? start='2023-12-29';
  String? end='2024-1-3';
  String? token ;
  List<Model> favorite=[];
  Locale _locale = const Locale('en');
  Map<String, int> ProductsCategory = {
    'oral medications':1,
    'pharmaceuticals':2,
    'elphant':3,
    'the vaccines':4,
    'external use medicines':5,
  };
  String? _password;
  String? _phone;
  String? _userName;

  //SETs
  set setStart(String _start){
    start=_start;
    notifyListeners();
  }
  set setEnd(String _End){
    end=_End;
    notifyListeners();
  }
  set setInFavoriteList(Model object){
   favorite.add(object);
  // notifyListeners();

  }
  set setCategoryId(int categoryId){
    _category_id=categoryId;
    notifyListeners();

  }
  set setToken(String _token){
    token = _token;
    notifyListeners();
  }
  set set_Login(bool loginRegiser) {
    _login = loginRegiser;
    notifyListeners();
  }
  set set_Register(bool loginRegiser){
    _regiser=loginRegiser;
    notifyListeners();

  }
  set setlanguage(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
  set setCategory(String? nameCategory) {
    _category = nameCategory;
    notifyListeners();
  }
  set setUserName(String? userName) {
    _userName= userName;
    notifyListeners();
  }
  set setPhone(String? phone) {
    _phone= phone;
    notifyListeners();
  }
  set setPassword(String? passWord) {
    _password= passWord;
    notifyListeners();
  }

  //Gets
  String? get getStart=>start;
  String? get getEnd=>end;
  List<Model> get getFavoriteList=>favorite;
  int? get getCategoryId=>_category_id;
  String? get getToken=>token;
  bool get get_Login=>_login ;
  bool get get_regiser=>_regiser ;
  String? get getCategory => _category;
  Locale get getlanguage => _locale;
  Map<String, int> get getProductsCategory => ProductsCategory;
  String? get getUserName=>_userName;
  String? get getpassWord=>_password;
  String? get getPhone=>_phone;
}
