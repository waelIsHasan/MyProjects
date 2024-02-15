import 'package:chemist/Widgets/Custom_Button.dart';
import 'package:chemist/Widgets/Custom_listTile.dart';
import 'package:flutter/material.dart';

import '../Function/getOrder.dart';
import '../Widgets/CustomCard.dart';
import '../Widgets/CustomTextField.dart';
import '../Widgets/model.dart';
class Report extends StatefulWidget{
  static  const String id="order";
  @override
  State<StatefulWidget> createState() {
    return _Report();
  }
}
class _Report extends State<Report>{
  DateTime t= DateTime.parse("2012-02-27");
  @override
  GlobalKey<FormState> formState = GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key:formState,
        child: Container(
          padding: EdgeInsets.only(top:40,left:20,right:20),
          child: ListView(
            children: [
              Image.asset('assets/images/logo.png',width: 100,height: 200,),
              Padding(padding: EdgeInsets.only(top:20)),
              CustomTextField(hintString:"Start",obsucre: false,icon:const Icon(Icons.date_range),),
              Padding(padding: EdgeInsets.only(top:20)),
              CustomTextField(hintString:"End",obsucre: false,icon:const Icon(Icons.date_range),),
              Padding(padding: EdgeInsets.only(top:20)),
              CustomButton(nameOfButton: 'Report',formState:formState ,),
            ],
          ),
        ),
      )


    );
}
}