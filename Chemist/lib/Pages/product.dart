import 'dart:convert';

import 'package:chemist/Function/addProduct.dart';
import 'package:chemist/Widgets/CustomRow.dart';
import 'package:chemist/Widgets/kStatic.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Services/api.dart';
import '../Widgets/Custom_Button.dart';
import '../Widgets/model.dart';

int x = 0;

class Product extends StatefulWidget {
  static String id = "Product";
  Model? model;
  Product({this.model});
  @override
  State<StatefulWidget> createState() {
    return _Product();
  }
}

class _Product extends State<Product> {
  void _showDialog(BuildContext context, String title, String content) {
    Widget cancel = TextButton(
      child: const Text('Cancel'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Color color = Colors.red;
    if (title == 'SUCCESS') {
      color = Colors.blue;
    }
    AlertDialog alert = AlertDialog(
      title: Text(title, style: TextStyle(color: color)),
      content: Text(content),
      actions: [cancel],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: kStatically.gradient,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: ListView(
            children: [
              Image.asset(
                "assets/images/chemist.png",
                width: 300,
                height: 170,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  width: 100,
                  height: 520,
                  child: Card(
                    elevation: 30,
                    shadowColor: Colors.deepOrange,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomRow(
                            name: 'Sci :',
                            content: widget.model!.scientific,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomRow(
                              name: 'Commercial :',
                              content: widget.model!.commercial),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomRow(
                              name: 'Category :',
                              content: (widget.model!.category_id).toString()),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomRow(
                              name: 'Price :',
                              content: widget.model!.price.toString()),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomRow(
                              name: 'Quantity :',
                              content: widget.model!.quantity.toString()),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomRow(
                              name: 'Date :', content: widget.model!.date),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomRow(
                              name: 'Company :',
                              content: widget.model!.company),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      x--;
                                    });
                                  },
                                  icon: Padding(
                                    padding: const EdgeInsets.only(bottom: 0.8),
                                    child: const Icon(Icons.minimize),
                                  )),
                              Text('$x',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      x++;
                                    });
                                  },
                                  icon: const Icon(Icons.add)),
                            ],
                          ),
                          InkWell(
                            onTap: () async {
                              Map order1 = {
                                "scientificName": widget.model!.scientific,
                                "quantity": x.toString()
                              };
                              AddProduct();
                              http.Response response = await Api().orderApi(
                                  "$BaseUrl/makeOrder",
                                  order1);
                              x = 0;
                              setState(() {});
                              if (response.statusCode == 200) {
                                dynamic decode = jsonDecode(response.body);
                                _showDialog(
                                    context, "SUCCESS", decode['success']);
                              } else {
                                _showDialog(context, "ERROR", "Sorry");
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 200,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.cyanAccent,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                    ),
                                    child: const Center(
                                        child: Text(
                                      "ADD",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                      textAlign: TextAlign.center,
                                    ))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          )),
    );
  }
}
