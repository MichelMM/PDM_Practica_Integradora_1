import 'package:estructura_practica_1/models/product_desserts.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ItemDessertDetails());

class ItemDessertDetails extends StatefulWidget {
  @override
  _ItemDessertDetailsState createState() => _ItemDessertDetailsState();
}

class _ItemDessertDetailsState extends State<ItemDessertDetails> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var _pressed;

  @override
  Widget build(BuildContext context) {
    final ProductDesserts item = ModalRoute.of(context).settings.arguments;
    _pressed = (item.productSize == ProductSizeType.REBANADA) ? 0 : 1;
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: BackButton(onPressed: () {
            Navigator.of(context).pop();
          }),
          title: Text('${item.productTitle}'),
          centerTitle: true,
          backgroundColor: PRIMARY_COLOR,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xffEC9762), Color(0xffFABF7C)],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  item.liked = !item.liked;
                                });
                              },
                              icon: Icon(
                                item.liked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: PRIMARY_COLOR,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Align(
                              alignment: Alignment.center,
                              child: Image.network(item.productImage)),
                        ),
                      ],
                    ),
                    height: 300,
                    width: 300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "${item.productTitle}",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "${item.productDescription}",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TAMAÑOS DISPONIBLES",
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "\$${item.productPrice}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: MaterialButton(
                          child: Text(
                            "Rebanada",
                            style: TextStyle(
                                color: (_pressed == 0)
                                    ? Colors.deepPurple
                                    : Colors.black),
                          ),
                          onPressed: () {
                            _pressed = 0;
                            item.productSizeChanger(_pressed);
                            setState(() {});
                          },
                          color: (_pressed == 0)
                              ? Colors.deepPurple[50]
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(70.0),
                            side: BorderSide(
                                color: (_pressed == 0)
                                    ? Colors.deepPurple
                                    : Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: MaterialButton(
                          child: Text(
                            "Completo",
                            style: TextStyle(
                                color: (_pressed == 1)
                                    ? Colors.deepPurple
                                    : Colors.black),
                          ),
                          onPressed: () {
                            _pressed = 1;
                            item.productSizeChanger(_pressed);
                            setState(() {});
                          },
                          color: (_pressed == 1)
                              ? Colors.deepPurple[50]
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(70.0),
                            side: BorderSide(
                                color: (_pressed == 1)
                                    ? Colors.deepPurple
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: MaterialButton(
                          child: Text(
                            "AGREGAR AL CARRITO",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                          ),
                          onPressed: () {
                            _toCart(item);
                          },
                          height: 40,
                          color: SQUIRRLE_COLOR,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: SQUIRRLE_COLOR),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: MaterialButton(
                          child: Text(
                            "COMPRAR AHORA",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed("/payment");
                          },
                          height: 40,
                          color: SQUIRRLE_COLOR,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: SQUIRRLE_COLOR),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _toCart(ProductDesserts item) {
    bool alredyIn = false;
    for (ProductItemCart x in cartList) {
      if (x.productTitle == item.productTitle) {
        x.productAmount += 1;
        alredyIn = true;
      }
    }
    if (!alredyIn) {
      cartList.add(new ProductItemCart(
        productAmount: 1,
        productImage: item.productImage,
        productPrice: item.productPrice,
        productTitle: item.productTitle,
        typeOfProduct: ProductType.POSTRES,
      ));
      _scaffoldKey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          backgroundColor: BUNKER_COLOR,
          content: Text(
            "Agregado Exitosamente al Carrito de Compras",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ));
    }
  }
}
