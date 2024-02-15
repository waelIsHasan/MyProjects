import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget{
  String? name;
  String? status;
  String? statusPayment;
  dynamic quantity;
  CustomListTile({this.statusPayment,this.status,this.name,this.quantity});
  @override
  State<StatefulWidget> createState() {
        return _CustomListTile();
  }
}
class _CustomListTile extends State<CustomListTile>{
  @override
  Widget build(BuildContext context) {
    if(widget.quantity is int){
      widget.quantity=widget.quantity.toString();
    }
    return Card(
      elevation: 10,
      child: ListTile(
        style: ListTileStyle.drawer,
        title: Text(widget.status!,style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.cyanAccent),),
        leading: Text(widget.name!,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        subtitle:Text(widget.statusPayment!,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),),
        trailing:Text(widget.quantity!,style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      shape:const Border(top:BorderSide(color: Colors.blue,width: 1,style: BorderStyle.solid),right:BorderSide(color: Colors.indigo,width: 1,style: BorderStyle.solid),
          left:BorderSide(color: Colors.cyanAccent,width: 1,style: BorderStyle.solid),bottom:BorderSide(color: Colors.lightBlue,width: 1,style: BorderStyle.solid)),
      ),
    );
  }



}