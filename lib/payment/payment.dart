import 'package:estructura_practica_1/payment/payment_card.dart';
import 'package:estructura_practica_1/profile.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(Payment());

class Payment extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: _scaffoldKey,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () {
            Navigator.of(context).pop();
          }),
          backgroundColor: PRIMARY_COLOR,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              SizedBox(
                width: 85,
              ),
              Text(
                "Pagos",
                style: TextStyle(fontWeight: FontWeight.w100),
              )
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.of(context).push(
                  // TODO: Eliminar este boton y adaptar todo el contenido de la pagina de perfil en un Drawer aqui en la pantalla Home
                  MaterialPageRoute(builder: (_) => Profile()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: PaymentCard(
                title: "Tarjeta de crédito",
                image: "https://cdn.iconscoutmails.com/icon/free/png-128/credit-card-2702821-2242618.png",
                scaffoldKey: _scaffoldKey,
              ),
            ),
            Container(
              child: PaymentCard(
                title: "PayPal",
                image: "https://ps.w.org/woo-paypal-gateway/assets/icon-256x256.png?rev=1783107",
                scaffoldKey: _scaffoldKey,
              ),
            ),
            Container(
              child: PaymentCard(
                title: "Tarjeta de regalo",
                image: "https://d2rlxvz0vagqj.cloudfront.net/wp-content/uploads/2020/11/minimal-gift-11.png",
                scaffoldKey: _scaffoldKey,
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}
