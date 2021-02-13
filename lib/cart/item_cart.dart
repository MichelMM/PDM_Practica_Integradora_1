import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  final dynamic product;
  final ValueChanged<double> onAmountUpdated;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Stack(
        children: [
          Container(
            height: 160,
            margin: EdgeInsets.only(top: 28, bottom: 24, left: 24, right: 24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [APRICOT_COLOR, MACCHEESE_COLOR],
              ),
              borderRadius: BorderRadius.all(
                Radius.zero,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.9),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(2, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 312,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 102, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            "${widget.product.productTitle}",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w100),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(0),
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  _addProd();
                                },
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  size: 20,
                                ),
                              ),
                            ),
                            Text(
                              "${widget.product.productAmount}",
                              style: TextStyle(fontSize: 22),
                            ),
                            IconButton(
                              onPressed: () {
                                _remProd();
                              },
                              icon: Icon(
                                Icons.remove_circle_outline,
                                size: 20,
                              ),
                            ),
                            Text(
                              "\$${(widget.product.productAmount * widget.product.productPrice).round()}",
                              style: TextStyle(fontSize: 30),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
                child: Image.network(
                  "${widget.product.productImage}",
                  fit: BoxFit.contain,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 22.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                onPressed: () {
                  _deleteProd();
                },
                icon: Icon(
                  Icons.delete,
                  size: 25,
                  color: PRIMARY_COLOR,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _remProd() {
    if (widget.product.productAmount > 0) {
      setState(() {
        --widget.product.productAmount;
      });
      widget.onAmountUpdated(-1 * widget.product.productPrice);
    } else {
      _deleteProd();
    }
  }

  void _deleteProd() {
    cartList.removeWhere(
        (item) => item.productTitle == widget.product.productTitle);
        widget.onAmountUpdated(0);
    setState(() {});
  }
}
