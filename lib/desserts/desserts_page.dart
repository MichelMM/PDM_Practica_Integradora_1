import 'package:estructura_practica_1/desserts/item_desserts.dart';
import 'package:estructura_practica_1/models/product_desserts.dart';
import 'package:flutter/material.dart';


class DessertsPage extends StatelessWidget {
  final List<ProductDesserts> dessertList;
  DessertsPage({
    Key key,
    @required this.dessertList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Granos"),
      ),
      body: ListView.builder(
        itemCount: dessertList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemDesserts(
            dessert: dessertList[index],
          );
        },
      ),
    );
  }
}
