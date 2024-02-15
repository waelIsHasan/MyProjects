import 'package:chemist/Pages/product.dart';
import 'package:flutter/material.dart';

import '../Function/all_Category_Product.dart';
import '../Function/searchADrug.dart';
import '../Function/searchDrugs.dart';
import '../Widgets/CustomCard.dart';
import '../Widgets/model.dart';
bool isCategory =true;
class SearchCategory extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){ query='';}, icon:const Icon( Icons.backspace_outlined)),
    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }
  @override
  Widget buildResults(BuildContext context) {
    if(!isCategory){
    return FutureBuilder<Model>(
      future: SearchADrug().getSearchADrug(query),
      builder: (BuildContext context, AsyncSnapshot<Model> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('There is no a Drug in this name',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),));
        } else {
          Model product = snapshot.data!;
          return   Product(model: product,);
        }
      },
    );}
    else {
      return FutureBuilder<List<Model>>(
        future: SearchDrugs().getSearchDrugs(query),
        builder: (BuildContext context, AsyncSnapshot<List<Model>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('There is no a Category in this name ',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),));
          } else {
            List<Model> productofCategry = snapshot.data!;
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
      );
    }
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('');
  }
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('');
    }

