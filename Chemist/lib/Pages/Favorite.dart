import 'package:chemist/Function/Favorite.dart';
import 'package:chemist/Widgets/CustomCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Function/all_Category_Product.dart';
import '../Providers/AppProvider.dart';
import '../Widgets/model.dart';

class Favorite extends StatefulWidget{
  static const  String id="favorite";
  @override
  State<StatefulWidget> createState() {
    return _Favorite();
  }
}class _Favorite extends State<Favorite>{
  @override
  Widget build(BuildContext context) {
    List<Model>favorite =Provider.of<AppStoreProvider>(context,listen: false).getFavoriteList!;
    return Scaffold(
          appBar: AppBar(
            actions: [
              InkWell(onTap:(){
                setState(() {
                });
               },
                  child:const Padding(
                    padding:  EdgeInsets.all(10),
                    child:  Icon(Icons.update,color: Colors.white,size: 30,),
                  ))
            ],

          ),

              body:  FutureBuilder<List<Model>>(
                future: FavoriteDrug().getAllFavorite(),
                builder: (BuildContext context, AsyncSnapshot<List<Model>> snapshot) {
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
                    List<Model> nullList=[];
                    List<Model> productofCategry = snapshot.data??nullList;
                    return   GridView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: productofCategry!.length,
                      itemBuilder: (context, index) {
                        return CustomCard(model:productofCategry[index],);
                      },
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                    );
                  }
                },
              ),

        );

  }


}