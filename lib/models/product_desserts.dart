import 'dart:math';

import 'package:flutter/foundation.dart';

enum ProductSizeType { REBANADA, COMPLETO }

class ProductDesserts {
  final String productTitle; // nombre del producto
  final String productDescription; // descripcion del producto
  final String productImage; // url de imagen del producto
  ProductSizeType productSize; // tamano del producto
  double productPrice; // precio del producto autocalculado
  final int productAmount; // cantidad de producto por comprar
  bool liked;

  ProductDesserts({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productSize,
    @required this.productAmount,
    this.liked = false,
  }) {
    // inicializa el precio de acuerdo al size del producto
    productPrice = productPriceCalculator();
  }


    void productSizeChanger(int type) {
    switch (type) {
      case 0:
        productSize = ProductSizeType.REBANADA;
        productPrice = productPriceCalculator();
        break;
      case 1:
        productSize = ProductSizeType.COMPLETO;
        productPrice = productPriceCalculator();
        break;
      default:
        
    }
  }


  double productPriceCalculator() {
    if (this.productSize == ProductSizeType.REBANADA)
      return (20 + Random().nextInt(40)).toDouble();
    if (this.productSize == ProductSizeType.COMPLETO)
      return (60 + Random().nextInt(80)).toDouble();
    return 9999.0;
  }
}
