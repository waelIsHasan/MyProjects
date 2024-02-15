// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:chemist/Pages/ShowReport.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../Pages/HomePage.dart';
import '../Pages/Login.dart';
import '../Providers/AppProvider.dart';
import '../Services/api.dart';
import '../generated/l10n.dart';
String token='Bearer ';
String BaseUrl="http://192.168.79.12:8000/api/user";
class CustomButton extends StatefulWidget {
  final String nameOfButton;
  GlobalKey<FormState>? formState;
  CustomButton({Key? key, required this.nameOfButton, this.formState})
      : super(key: key);
  @override
  _CustomButtonState createState() => _CustomButtonState();
}
class _CustomButtonState extends State<CustomButton> {
  void _showDialog(BuildContext context, String title ,dynamic content,String button, String route) {
    Widget okButton = TextButton(
      child: Text(button),
      onPressed: () {
        Navigator.popAndPushNamed(context, route);
      },
    );
    Widget cancel = TextButton(
      child:const Text('Cancel'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Color color = Colors.red;
    if(title=='SUCCESS'){
      color=Colors.blue;
    }
    AlertDialog alert = AlertDialog(
      title: Text(title,style:TextStyle(color:color)),
      content: Text(content),
      actions: [
        okButton,
        cancel
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  void _handleLogin(BuildContext context) async {
    if (widget.formState!.currentState!.validate()) {
      String phone = Provider.of<AppStoreProvider>(context, listen: false).getPhone ?? "";
      String pass = Provider.of<AppStoreProvider>(context, listen: false).getpassWord ?? "";
      Map<String, dynamic> data = {
        "phone": phone,
        "password": pass,
      };
      print("$phone && $pass");
      http.Response response = await Api().post("$BaseUrl/login", data);
      try {
        if (response.statusCode == 200) {
          Map<String, dynamic> map = jsonDecode(response.body);

          if (map['token'] != null) {
            token ="Bearer ";
            setState(() {
              token+=map['token'];
            });
            _showDialog(context, 'SUCCESS','Welcome', 'Home', HomePage.id);
          } else{
            _showDialog(context, 'ERROR', map['error'],'login', Login.id);
          }
        } else{
          _showDialog(context, 'ERROR','try again', 'try again', Login.id);
        }
      }catch (e) {
          _showDialog(context, 'ERROR','try again', 'try again', Login.id);
      }
    }
  }

  void _handleRegister(BuildContext context) async {

    if (widget.formState!.currentState!.validate()) {
      String user =Provider.of<AppStoreProvider>(context, listen: false).getUserName ??"";
      String phone = Provider.of<AppStoreProvider>(context, listen: false).getPhone ?? "";
      String pass = Provider.of<AppStoreProvider>(context, listen: false).getpassWord ?? "";
      Map<String, dynamic> data = {
        "name": user,
        "phone": phone,
        "password": pass,
      };
      print("$user && $phone && $pass");
      http.Response response =
          await Api().post("$BaseUrl/register", data);
      try {
        if (response.statusCode == 200) {
          Map<String,dynamic> map = jsonDecode(response.body);
          if (map['token'] != null) {
            token+=map['token'];
            _showDialog(context, 'SUCCESS','Welcome', 'Login', Login.id);
          }else {
            _showDialog(context, 'ERROR',map['error'],'Register', Login.id);
          }
        } else {
          _showDialog(context, 'ERROR','try again', 'try again', Login.id);
        }
      } catch (e) {
       _showDialog(context, 'ERROR','try again', 'try', Login.id);
       print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        if (widget.nameOfButton ==S().login) {
          _handleLogin(context);
        } else if(widget.nameOfButton==S().register){
          _handleRegister(context);
        }
        else  if(widget.nameOfButton=="Report"){
          if (widget.formState!.currentState!.validate()) {
            String start=Provider.of<AppStoreProvider>(context, listen: false).getStart ??"";
            String end=Provider.of<AppStoreProvider>(context, listen: false).getEnd ??"";
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  ShowReport(start:start ,end: end,)),
            );
          }
        }

      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 40,
            decoration:const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            child: Center(
              child:Text(
                widget.nameOfButton,
                style:const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
