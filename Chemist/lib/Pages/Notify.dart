import 'package:chemist/Widgets/Custom_Notify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Function/NotifyApi.dart';
import '../Widgets/model.dart';

class Notify extends StatefulWidget{
  static const  String id='NOtify';
  @override
  State<StatefulWidget> createState() {
      return _Notify();
  }
}
class _Notify extends State<Notify>{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body:FutureBuilder<List<ModelNotify>>(
          future: NotifyApi().getNotify(),
          builder: (BuildContext context, AsyncSnapshot<List<ModelNotify>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Container(padding:EdgeInsets.only(top:100),child:const Center(child: Column(
                children: [
                  Text('It is empty ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                  Icon(Icons.warning_amber_rounded,size: 50,color: Colors.orange,)
                ],
              )));
            } else {
              List<ModelNotify> nullList=[];
              List<ModelNotify> productofCategry = snapshot.data??nullList;
              return   ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: productofCategry!.length,
                itemBuilder: (context, index) {
                  return CustomNotify(num: productofCategry[index].number,status:productofCategry[index].status);
                },
              );
            }
          },
        ),
      );
  }


}