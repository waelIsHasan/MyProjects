import 'package:chemist/Widgets/Custom_listTile.dart';
import 'package:flutter/material.dart';

import '../Function/getOrder.dart';
import '../Widgets/CustomCard.dart';
import '../Widgets/model.dart';
class Order extends StatefulWidget{
  static  const String id="order";
  @override
  State<StatefulWidget> createState() {
    return _Order();
  }
}
class _Order extends State<Order>{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        body:  FutureBuilder<List<ModelOrder>>(
          future: AllOrder().getOrders(),
          builder: (BuildContext context, AsyncSnapshot<List<ModelOrder>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Container(padding: EdgeInsets.only(top:100),child:const Center(child: Column(
                children: [
                  Text('It is empty ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                  Icon(Icons.warning_amber_rounded,size: 50,color: Colors.orange,)
                ],
              )));
            } else {
              List<ModelOrder> nullList=[];
              List<ModelOrder> order = snapshot.data??nullList;
              return   ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: order!.length,
                itemBuilder: (context, index) {
                  return (index==0)?Column(
                    children: [
                      Text('My orders :${order.length}',style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),
                      CustomListTile(status:order[index].status,statusPayment:order[index].statusPayment,
                        quantity: order[index].quantity,name: order[index].scientific,
                      ),
                    ],
                  ): CustomListTile(status:order[index].status,statusPayment:order[index].statusPayment,
                    quantity: order[index].quantity,name: order[index].scientific,
                  );
                },
              );
            }
          },
        ),
      );
  }



}