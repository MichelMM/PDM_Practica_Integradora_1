import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class PaymentCard extends StatelessWidget {
  final String title;
  final String image;
  final GlobalKey<ScaffoldState> scaffoldKey;
  PaymentCard({
    Key key,
    @required this.title,
    @required this.image,
    @required this.scaffoldKey,
  }) : super(key: key);

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: scaffoldKey.currentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          title: Image.network(
              "https://www.elcomercio.com/files/article_main/uploads/2019/01/16/5c3f983710f3c.jpeg"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/CoffeeCup.png',
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("¡Orden exitosa!",
                              style: TextStyle(fontSize: 20)),
                          Text("Taza Cupping",
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  child: Text(
                    "Tu orden ha sido registrada, para más información busca en la opción historial de compras en tu perfil.",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w100, color: SQUIRRLE_COLOR),
                  ),
                ),
              )
            ],
          ),
          actions: [
            FlatButton(
              textColor: Color(0xFF6200EE),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text('ACEPTAR'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDialog();
      },
      child: Container(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 190,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 70, top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$title",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 5,
                          ),
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
                    "$image",
                    fit: BoxFit.contain,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 29.0, bottom: 37.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.edit,
                  size: 29,
                  color: PRIMARY_COLOR,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
