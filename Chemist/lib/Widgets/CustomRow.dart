import 'dart:io';

import 'package:flutter/cupertino.dart';

class CustomRow extends StatelessWidget{
  String? name;
  String?content;

  CustomRow({super.key,this.name,this.content});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(name!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
       Text(content!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
      )],);
  }


}