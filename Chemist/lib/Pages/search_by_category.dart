import 'package:chemist/Pages/Favorite.dart';
import 'package:chemist/Pages/HomePage.dart';
import 'package:chemist/Pages/Login.dart';
import 'package:chemist/Pages/language.dart';
import 'package:chemist/Pages/search.dart';
import 'package:chemist/Services/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Function/all_Category_Product.dart';
import '../Providers/AppProvider.dart';
import '../Widgets/CustomCard.dart';
import '../Widgets/Custom_Button.dart';
import '../Widgets/Custom_drop_down.dart';
import '../Widgets/model.dart';
import '../generated/l10n.dart';

class SearchByCategory extends StatefulWidget {
  static String id='SearchByCategory';
   SearchByCategory ({super.key});
  @override
  State<StatefulWidget> createState() {
    return _SearchByCategory();
  }
}
class _SearchByCategory extends State<SearchByCategory> {
  Future<String> _fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return 'hello';
  }

  @override
  Widget build(BuildContext context) {
    int numberCategory=Provider.of<AppStoreProvider>(context,listen: false).getCategoryId!;
    String nameCategory = Provider.of<AppStoreProvider>(context).getCategory ?? 'pills';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(S.of(context).title),
        foregroundColor: Colors.orangeAccent,
        backgroundColor: Colors.cyan,
       actions:[
         InkWell(onTap:(){
           setState(() {
           });
           Navigator.pushNamed(context,Favorite.id);},
             child:const Padding(
               padding:  EdgeInsets.all(8.0),
               child:  Icon(Icons.favorite,color: Colors.red,),
         )),
         InkWell(onTap:(){
           setState(() {
           });},
             child:const Padding(
               padding:  EdgeInsets.all(8.0),
               child:  Icon(Icons.update,color: Colors.white,size: 30,),
             )),
         InkWell(onTap:(){
           isCategory=true;
           showSearch(context: context, delegate: SearchCategory());
         },
             child:const Padding(
               padding:  EdgeInsets.all(8.0),
               child:  Icon(Icons.search,color: Colors.white,size: 30,),
             ))
       ],
      ),
      drawer: Drawer(
          child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.indigoAccent,
                    Colors.blue,
                    Colors.lightBlue,
                    Colors.cyan,
                    Colors.cyanAccent,
                    Colors.cyanAccent
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  ListTile(leading: Container(
                    alignment: Alignment.topLeft,
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: const Center(
                      child: Image(
                        image: AssetImage("assets/images/chemist.png"),
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                    title:  Text(S.of(context).user1, style:const TextStyle(fontSize: 20)),
                  ),
                 const Padding(padding: EdgeInsets.only(top: 30)),
                  InkWell(onTap: () {
                    Navigator.pushNamed(context, HomePage.id);
                  },
                      child:  Card(elevation: 10,
                          child: ListTile(
                              leading:const Icon(Icons.account_box, size: 35,),
                              title: Text(
                                  S.of(context).account, style:const TextStyle(fontSize: 20))))),
                  InkWell(onTap: () {},
                      child: Card(elevation: 10,
                          child: ListTile(
                              leading:const Icon(Icons.settings, size: 35),
                              title: Text(
                                  S.of(context).setting, style:const TextStyle(fontSize: 20))))),
                  InkWell(onTap: () {},
                      child:  Card(elevation: 10,
                          child: ListTile(leading:const Icon(Icons.info, size: 35),
                            title: Text(
                                S.of(context).about, style:const TextStyle(fontSize: 20)),))),
                  InkWell(onTap: () {
                    Navigator.pushNamed(context, Language.id);
                  },
                      child:  Card(elevation: 10,
                          child: ListTile(
                              leading:const Icon(Icons.language, size: 35,),
                              title: Text(
                                  S.of(context).language, style:const TextStyle(fontSize: 20))))),

                  InkWell(onTap: () async {
                    await Api().post("$BaseUrl/logout","");
                    Navigator.pushReplacementNamed(context, Login.id);
                  },
                      child: Card(elevation: 10,
                          child: ListTile(leading:const Icon(Icons.logout, size: 35),
                              title: Text(
                                  S.of(context).logout, style:const TextStyle(fontSize: 20))))),
                ],
              )
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            const CustomDropDown(),
            const SizedBox(height: 20.0),
            Container(
              height: 50.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.orange, Colors.blue, Colors.cyan
                ],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.format_list_numbered,
                    color: Colors.white, size: 23,),
                  const Padding(
                      padding: EdgeInsets.only(right: 10.0)),
                  Text(nameCategory,
                      style: const TextStyle(
                          fontSize: 20.0, color: Colors.white)),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            FutureBuilder<List<Model>>(
              future: AllCategoryProduct().getCategoryProduct(numberCategory),
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
            const Padding(padding: EdgeInsets.only(top: 20)),

            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}