import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/desserts/desserts_page.dart';
import 'package:estructura_practica_1/desserts/item_desserts_details.dart';
import 'package:estructura_practica_1/drinks/hot_drinks_page.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks_details.dart';
import 'package:estructura_practica_1/grains/grains_page.dart';
import 'package:estructura_practica_1/grains/item_grains_details.dart';
import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/login/login.dart';
import 'package:estructura_practica_1/login/signin.dart';
import 'package:estructura_practica_1/login/signup.dart';
import 'package:estructura_practica_1/splash2.dart';
import 'package:estructura_practica_1/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';


void main() => runApp(Splash());

class Splash extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => Splash2(),
        "/login": (context)=>Login(),
        "/signup": (context)=>Signup(),
        "/signin": (context)=>Signin(),
        "/home": (context)=>Home(title: APP_TITLE),
        "/hotdrinks": (context)=>HotDrinksPage(drinksList: hotDrinks,),
        "/hotdrinksdetails": (context)=>ItemHotDrinksDetails(),
        "/grains": (context)=>GrainsPage(grainsList: grains,),
        "/grainsdetails": (context)=>ItemGrainsDetails(),
        "/desserts": (context)=>DessertsPage(dessertList: desserts,),
        "/dessertsdetails": (context)=>ItemDessertDetails(),
        "/payment": (context)=>Payment(),
        "/cart":(context)=>Cart(productsList: cartList,),
      },
      theme: ThemeData(
        fontFamily: 'AkzidenzGrotesk',
        primarySwatch: PRIMARY_COLOR,
        accentColor: BUNKER_COLOR,
      ),
    );
  }
}

