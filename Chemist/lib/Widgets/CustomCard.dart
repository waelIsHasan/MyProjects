import 'package:chemist/Pages/Favorite.dart';
import 'package:chemist/Pages/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../Function/Favorite.dart';
import '../Providers/AppProvider.dart';
import '../Services/api.dart';
import 'model.dart';

// ignore: must_be_immutable
class CustomCard extends StatefulWidget {
  CustomCard({super.key, this.model});
  Model? model;
  @override
  State<StatefulWidget> createState() {
    return _CustomCard();
  }
}

class _CustomCard extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    var where = (Provider.of<AppStoreProvider>(context, listen: false)
        .getFavoriteList
        .where((element) => element.scientific == widget.model!.scientific));
    Locale locale = Provider.of<AppStoreProvider>(context).getlanguage;
    bool ar = (locale == const Locale('ar'));
    return Container(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Product(
                        model: widget.model,
                      )),
            );
          },
          child: Stack(clipBehavior: Clip.none, children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: 150,
              child: Card(
                  elevation: 20,
                  shadowColor: Colors.indigo,
                  color: Colors.cyan,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      //  crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(widget.model?.scientific! ?? ' ',
                            style: const TextStyle(fontSize: 23)),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text((widget.model?.price ?? ' ').toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900)),
                              IconButton(
                                  onPressed: () async {
                                    int idDrug = widget.model!.drugId!;
                                    print(idDrug);

                                    if (widget.model!.favoirte == false) {
                                      Provider.of<AppStoreProvider>(context,
                                              listen: false)
                                          .setInFavoriteList = widget.model!;
                                      widget.model!.favoirte = true;
                                      FavoriteDrug().addFavorite(idDrug.toString());
                                      print(idDrug);
                                    } else {
                                      Provider.of<AppStoreProvider>(context,
                                              listen: false)
                                          .getFavoriteList
                                          .removeWhere((element) =>
                                              element.scientific ==
                                              widget.model!.scientific);
                                      widget.model!.favoirte = false;

                                      FavoriteDrug().deleteFavorit(idDrug.toString());
                                    }
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: (where.isNotEmpty)
                                        ? Colors.red
                                        : Colors.grey,
                                  )),
                            ]),
                      ],
                    ),
                  )),
            ),
            Positioned(
                bottom: 110,
                left: (ar ? 10 : 110),
                child: Image.asset(
                  "assets/images/chemist.png",
                  width: 70,
                )),
          ]),
        ));
  }
}
