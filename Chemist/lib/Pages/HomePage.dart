import 'package:chemist/Pages/Notify.dart';
import 'package:chemist/Pages/Report.dart';
import 'package:chemist/Pages/search.dart';
import 'package:chemist/Pages/search_by_category.dart';
import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import 'orders.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomePage';
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.cyan,
        actions: [
          InkWell(
            onTap:(){
              Navigator.pushNamed(context,Notify.id);
            },
            child:const Padding(
              padding:  EdgeInsets.all(8),
              child: Icon(Icons.notification_add),
            ),
          )
        ],
      ),
      body: Container(
          child: ListView(
        children: [
          const Padding(padding: EdgeInsets.only(top: 100)),
          const Image(
            image: AssetImage('assets/images/chemist.png'),
            width: 100,
            height: 100,
          ),
          const Padding(padding: EdgeInsets.only(top: 50)),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SearchByCategory.id);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 200,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Center(
                        child: Text(
                      S.of(context).category,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                      textAlign: TextAlign.center,
                    ))),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          GestureDetector(
            onTap: () {
              isCategory = false;
              showSearch(context: context, delegate: SearchCategory());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 200,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Center(
                        child: Text(
                      S.of(context).search,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                      textAlign: TextAlign.center,
                    ))),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Order.id);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 200,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Center(
                        child: Text(
                      S.of(context).order,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                      textAlign: TextAlign.center,
                    ))),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>Report()),
              );

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 200,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child:const Center(
                        child: Text(
                      'Report',
                      style:  TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                      textAlign: TextAlign.center,
                    ))),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 200,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Center(
                        child: Text(
                          S.of(context).exit,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                          textAlign: TextAlign.center,
                        ))),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
