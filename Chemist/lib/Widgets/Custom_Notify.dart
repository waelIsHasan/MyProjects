import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Function/NotifyApi.dart';
import '../Pages/orders.dart';
import '../Pages/showOrder.dart';

class CustomNotify extends StatefulWidget{
  dynamic? num;
  String? status;
  CustomNotify({this.status,this.num});
  @override
  State<StatefulWidget> createState() {
    return _CustomNotify();
  }
}
class _CustomNotify extends State<CustomNotify>{
  @override
  Widget build(BuildContext context) {
    if(widget.num is int){
      widget.num=widget.num.toString();
    }
    return InkWell(

            onTap: ()async{

             await NotifyApi().readNotify(widget.num);
             // ignore: use_build_context_synchronously
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) =>  ShowOrder(number: widget.num,)),
             );
             setState(() {});


            },
              child: Card(
              elevation: 10,
              child: ListTile(
                style: ListTileStyle.drawer,
                title: Text(widget.status!,style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.cyanAccent),),
                leading: Text(widget.num!,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                shape:const Border(top:BorderSide(color: Colors.blue,width: 1,style: BorderStyle.solid),right:BorderSide(color: Colors.indigo,width: 1,style: BorderStyle.solid),
                    left:BorderSide(color: Colors.cyanAccent,width: 1,style: BorderStyle.solid),bottom:BorderSide(color: Colors.lightBlue,width: 1,style: BorderStyle.solid)),
              ),
            ),
          );
  }



}