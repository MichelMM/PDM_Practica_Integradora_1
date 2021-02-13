
import 'package:estructura_practica_1/models/product_desserts.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemDesserts extends StatefulWidget {
  final ProductDesserts dessert;
  ItemDesserts({
    Key key,
    @required this.dessert,
  }) : super(key: key);

  @override
  _ItemDessertsState createState() => _ItemDessertsState();
}

class _ItemDessertsState extends State<ItemDesserts> {
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
              color: Color(0xffBCB0A1),
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
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/dessertsdetails',
                        arguments: widget.dessert);
                  },
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 140,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Postres",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "${widget.dessert.productTitle}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w100,
                                fontFamily: 'AkzidenzGrotesk',
                                fontSize: 24),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "\$${widget.dessert.productPrice}",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 35),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
                child: Image.network(
                  "${widget.dessert.productImage}",
                  fit: BoxFit.contain,
                  height: 140,
                  width: 140,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 21.0, top: 26.0),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.dessert.liked = !widget.dessert.liked;
                  });
                },
                icon: Icon(
                  widget.dessert.liked ? Icons.favorite : Icons.favorite_border,
                  size: 29,
                  color: PRIMARY_COLOR,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
