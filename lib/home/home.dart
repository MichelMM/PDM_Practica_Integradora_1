import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/item_home.dart';
import 'package:estructura_practica_1/profile.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(
              width: 125,
            ),
            Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.w100),
            )
          ],
        ),
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
          )
        ],
      ),
      drawer: Drawer(
        child: Profile(),
        elevation: 2000,
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openHotDrinksPage,
            child: Container(
              child: ItemHome(
                title: "Bebidas calientes",
                image: "https://i.imgur.com/XJ0y9qs.png",
              ),
            ),
          ),
          GestureDetector(
            onTap: _openDessertPage,
            child: Container(
              child: ItemHome(
                title: "Postres",
                image: "https://i.imgur.com/fI7Tezv.png",
              ),
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: Container(
              child: ItemHome(
                title: "Granos",
                image: "https://i.imgur.com/5MZocC1.png",
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _scaffoldKey.currentState
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  backgroundColor: BUNKER_COLOR,
                  content: Text(
                    "Proximamente",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ));
            },
            child: Container(
              child: ItemHome(
                title: "Tazas",
                image: "https://i.imgur.com/fMjtSpy.png",
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openHotDrinksPage() async {
    Navigator.of(context).pushNamed('/hotdrinks');
  }

  void _openGrainsPage() async {
    Navigator.of(context).pushNamed('/grains');
  }

  void _openDessertPage() {
    Navigator.of(context).pushNamed('/desserts');
  }
}
