import 'package:chemist/Providers/AppProvider.dart';
import 'package:chemist/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Language extends StatefulWidget {
  static String id="Language";
  @override
  State<StatefulWidget> createState() {
    return _Language();
  }
}

class _Language extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  Text(
        S.of(context).language,
        style:const TextStyle(fontSize: 25),
      )),
      body: Padding(padding:const EdgeInsets.all(20),
        child: ListView(children: [
          InkWell(onTap: () {
                 Provider.of<AppStoreProvider>(context,listen: false).setlanguage =const Locale('ar') ;
                  },
                      child:  Card(elevation: 10,
                          child: ListTile(
                              leading:const Icon(Icons.abc, size: 35,),
                              title: Text(
                                 S.of(context).ar , style:const TextStyle(fontSize: 20))))),
                                   InkWell(onTap: () {

                 Provider.of<AppStoreProvider>(context,listen: false).setlanguage =const Locale('en') ;
                  },
                      child:  Card(elevation: 10,
                          child: ListTile(
                              leading:const Icon(Icons.abc, size: 35,),
                              title: Text(
                                 S.of(context).en , style:const TextStyle(fontSize: 20))))),

        ]),
      ),
    );
  }
}
