import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/item_cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

class Cart extends StatefulWidget {
  final List<ProductItemCart> productsList;
  Cart({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.productsList) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(
          children: [
            SizedBox(
              width: 32,
            ),
            Text(
              "Lista de compras",
              style: TextStyle(fontWeight: FontWeight.w100),
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 170.0),
              child: ListView.builder(
                itemCount: widget.productsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemCart(
                    onAmountUpdated: _priceUpdate,
                    product: widget.productsList[index],
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total", style: TextStyle(fontSize: 20)),
                    Text("${_total.round()} MX\$",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w100)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 22,
                      ),
                      child: FlatButton(
                        minWidth: 310,
                        height: 46,
                        highlightColor: MACCHEESE_COLOR,
                        color: MALTA_COLOR,
                        onPressed: () {
                          Navigator.of(context).pushNamed('/payment');
                        },
                        child: Text(
                          'PAGAR',
                          style: TextStyle(fontFamily: 'AkzidenzGrotesk'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }
}
