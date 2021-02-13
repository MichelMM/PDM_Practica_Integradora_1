import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grain;
  ItemGrains({
    Key key,
    @required this.grain,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
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
                    Navigator.of(context).pushNamed('/grainsdetails',
                        arguments: widget.grain);
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
                            "Granos",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "${widget.grain.productTitle}",
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
                            "\$${widget.grain.productPrice}",
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
                  "${widget.grain.productImage}",
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
                    widget.grain.liked = !widget.grain.liked;
                  });
                },
                icon: Icon(
                  widget.grain.liked ? Icons.favorite : Icons.favorite_border,
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
