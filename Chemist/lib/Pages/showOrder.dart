
import 'package:chemist/Widgets/Custom_Notify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Function/NotifyApi.dart';
import '../Function/all_Category_Product.dart';
import '../Function/getOrder.dart';
import '../Widgets/CustomCard.dart';
import '../Widgets/Custom_listTile.dart';
import '../Widgets/model.dart';

class ShowOrder extends StatefulWidget{
  static const String id='showOrder';
  String ? number;
  ShowOrder({this.number});
  @override
  State<StatefulWidget> createState() {
    return _ShowOrder();
  }
}
class _ShowOrder extends State<ShowOrder>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<ModelOrder>(
        future: AllOrder().OneOrdre(widget.number!),
        builder: (BuildContext context, AsyncSnapshot<ModelOrder> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.white,));
          } else if (snapshot.hasError) {
            return Container(padding: EdgeInsets.only(top:100),child:const Center(child: Column(
              children: [
                Center(child:Text('Empty',style:TextStyle(fontSize: 30)))
              ],
            )));
          } else {
            ModelOrder? nullList;
            ModelOrder? productofCategry = snapshot.data??nullList;
            return Container(
              padding: EdgeInsets.only(top:30),
              child: CustomListTile(status:productofCategry!.status,statusPayment:productofCategry!.statusPayment,
                quantity: productofCategry!.quantity,name: productofCategry!.scientific,
              ),
            );
          }
        },
      ),
    );
  }
}