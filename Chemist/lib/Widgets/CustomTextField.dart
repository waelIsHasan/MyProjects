import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/AppProvider.dart';
import '../generated/l10n.dart';
// ignore: must_be_immutable
class CustomTextField extends StatelessWidget{
  CustomTextField({super.key,this.hintString,this.obsucre,this.icon});
  String? hintString;
  bool? obsucre;
  Icon? icon;
  TextEditingController hint = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return TextFormField(
        validator: (val){
      if(val!.isEmpty) return 'Field is empty !!!';
      if(hintString=='Number' && (hint.text.length) < 10) return 'The Length of Number must be 10 !!!';
      if(hintString=='Password' && (hint.text.length) < 3) return 'The Length of password at least 3 !!!';
      if(hintString==S().password){
        Provider.of<AppStoreProvider>(context,listen: false).setPassword=hint.text;

      }
      else if (hintString==S().number){
        Provider.of<AppStoreProvider>(context,listen: false).setPhone=hint.text;
      }
      else if (hintString==S().name){
        Provider.of<AppStoreProvider>(context,listen: false).setUserName=hint.text;
        }
      else if (hintString=='Start'){
        Provider.of<AppStoreProvider>(context,listen: false).setStart=hint.text;
      }
      else if(hintString=='End'){
        Provider.of<AppStoreProvider>(context,listen: false).setEnd=hint.text;
      }
      },
      controller:hint,
      obscureText: obsucre!,
        decoration: InputDecoration(
            hintText:hintString,
            hintStyle:const TextStyle(fontSize:20),
            prefixIcon:icon!,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[900]!,width:2)
            ),
            filled: true,
            fillColor: Colors.white,
      ),
      );
  }
}