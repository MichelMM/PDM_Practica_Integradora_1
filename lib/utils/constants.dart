import 'package:estructura_practica_1/models/product_desserts.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';

// home
const String APP_TITLE = "Inicio";
// profile
const String PROFILE_TITLE = "Perfil";
const String PROFILE_LOGOUT = "CERRAR SESIÓN";
const String PROFILE_CART = "LISTA DE COMPRAS";
const String PROFILE_WISHES = "LISTA DE DESEOS";
const String PROFILE_HISTORY = "HISTORIAL DE COMPRAS";
const String PROFILE_SETTINGS = "CONFIGURACIÓN";
const String PROFILE_NAME = "Anna Doe";
const String PROFILE_EMAIL = "anna@doe.com";
const String PROFILE_PICTURE =
    "https://dkpp.go.id/wp-content/uploads/2018/10/photo.jpg";

// app
const Color PRIMARY_COLOR = MaterialColor(0xff214254, {
  50: Color.fromRGBO(33, 66, 84, .1),
  100: Color.fromRGBO(33, 66, 84, .2),
  200: Color.fromRGBO(33, 66, 84, .3),
  300: Color.fromRGBO(33, 66, 84, .4),
  400: Color.fromRGBO(33, 66, 84, .5),
  500: Color.fromRGBO(33, 66, 84, .6),
  600: Color.fromRGBO(33, 66, 84, .7),
  700: Color.fromRGBO(33, 66, 84, .8),
  800: Color.fromRGBO(33, 66, 84, .9),
  900: Color.fromRGBO(33, 66, 84, 1),
});

const Color BUNKER_COLOR = MaterialColor(0xff121B22, {
  50: Color.fromRGBO(18, 27, 34, .1),
  100: Color.fromRGBO(18, 27, 34, .2),
  200: Color.fromRGBO(18, 27, 34, .3),
  300: Color.fromRGBO(18, 27, 34, .4),
  400: Color.fromRGBO(18, 27, 34, .5),
  500: Color.fromRGBO(18, 27, 34, .6),
  600: Color.fromRGBO(18, 27, 34, .7),
  700: Color.fromRGBO(18, 27, 34, .8),
  800: Color.fromRGBO(18, 27, 34, .9),
  900: Color.fromRGBO(18, 27, 34, 1),
});
const Color SQUIRRLE_COLOR = MaterialColor(0xff8B8175, {
  50: Color.fromRGBO(139, 129, 117, .1),
  100: Color.fromRGBO(139, 129, 117, .2),
  200: Color.fromRGBO(139, 129, 117, .3),
  300: Color.fromRGBO(139, 129, 117, .4),
  400: Color.fromRGBO(139, 129, 117, .5),
  500: Color.fromRGBO(139, 129, 117, .6),
  600: Color.fromRGBO(139, 129, 117, .7),
  700: Color.fromRGBO(139, 129, 117, .8),
  800: Color.fromRGBO(139, 129, 117, .9),
  900: Color.fromRGBO(139, 129, 117, 1),
});
const Color MALTA_COLOR = MaterialColor(0xffBCB0A1, {
  50: Color.fromRGBO(188, 176, 161, .1),
  100: Color.fromRGBO(188, 176, 161, .2),
  200: Color.fromRGBO(188, 176, 161, .3),
  300: Color.fromRGBO(188, 176, 161, .4),
  400: Color.fromRGBO(188, 176, 161, .5),
  500: Color.fromRGBO(188, 176, 161, .6),
  600: Color.fromRGBO(188, 176, 161, .7),
  700: Color.fromRGBO(188, 176, 161, .8),
  800: Color.fromRGBO(188, 176, 161, .9),
  900: Color.fromRGBO(188, 176, 161, 1),
});
const Color MACCHEESE_COLOR = MaterialColor(0xffFABF7C, {
  50: Color.fromRGBO(250, 191, 124, .1),
  100: Color.fromRGBO(250, 191, 124, .2),
  200: Color.fromRGBO(250, 191, 124, .3),
  300: Color.fromRGBO(250, 191, 124, .4),
  400: Color.fromRGBO(250, 191, 124, .5),
  500: Color.fromRGBO(250, 191, 124, .6),
  600: Color.fromRGBO(250, 191, 124, .7),
  700: Color.fromRGBO(250, 191, 124, .8),
  800: Color.fromRGBO(250, 191, 124, .9),
  900: Color.fromRGBO(250, 191, 124, 1),
});
const Color APRICOT_COLOR = MaterialColor(0xffEC9762, {
  50: Color.fromRGBO(236, 151, 98, .1),
  100: Color.fromRGBO(236, 151, 98, .2),
  200: Color.fromRGBO(236, 151, 98, .3),
  300: Color.fromRGBO(236, 151, 98, .4),
  400: Color.fromRGBO(236, 151, 98, .5),
  500: Color.fromRGBO(236, 151, 98, .6),
  600: Color.fromRGBO(236, 151, 98, .7),
  700: Color.fromRGBO(236, 151, 98, .8),
  800: Color.fromRGBO(236, 151, 98, .9),
  900: Color.fromRGBO(236, 151, 98, 1),
});

List<ProductItemCart> cartList = <ProductItemCart>[];

List<ProductHotDrinks> hotDrinks = ProductRepository.loadProducts(ProductType.BEBIDAS);

List<ProductGrains> grains = ProductRepository.loadProducts(ProductType.GRANO);

List<ProductDesserts> desserts =  ProductRepository.loadProducts(ProductType.POSTRES);