import 'package:chemist/Pages/Favorite.dart';
import 'package:chemist/Pages/HomePage.dart';
import 'package:chemist/Pages/Notify.dart';
import 'package:chemist/Pages/ShowReport.dart';
import 'package:chemist/Pages/language.dart';
import 'package:chemist/Pages/orders.dart';
import 'package:chemist/Pages/product.dart';
import 'package:chemist/Pages/showOrder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Pages/Login.dart';
import 'Pages/Register.dart';
import 'Pages/search_by_category.dart';
import 'Providers/AppProvider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Services/api.dart';
import 'generated/l10n.dart';
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return AppStoreProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(canvasColor: Colors.cyanAccent),
       //language
        locale: Provider.of<AppStoreProvider>(context).getlanguage,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('ar'), // Spanish
        ],

        //IDs
        routes: {
          Language.id: (context) => Language(),
          Register.id: (context) => const Register(),
          HomePage.id: (context) => const HomePage(),
          SearchByCategory.id: (context) => SearchByCategory(),
          Login.id: (context) => const Login(),
          Product.id: (context) => Product(),
          Api.id:(context)=>Api(),
          Favorite.id:(context)=>Favorite(),
          Order.id:(context)=>Order(),
          Notify.id:(context)=>Notify(),
          ShowOrder.id:(context)=>ShowOrder(),
          ShowReport.id:(context)=>ShowReport()
        },
        debugShowCheckedModeBanner: false,
        home: const Login());
  }
}
