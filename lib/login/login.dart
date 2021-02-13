import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicio de Sesión',
      home: Scaffold(
        
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [PRIMARY_COLOR,BUNKER_COLOR],
              ),
            ),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/cupping.png',
                  scale: 2.7,
                  color: Colors.white,
                ),
                SizedBox(height: 100,),
                FlatButton(
                  minWidth: 310,
                  height: 46,
                  highlightColor: Color(0xffFABF7C),
                  color: Color(0xffBCB0A1),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text('REGISTRATE',style: TextStyle(fontFamily: 'AkzidenzGrotesk'),),
                ),
                SizedBox(height: 40,),
                FlatButton(
                  minWidth: 310,
                  height: 46,
                  highlightColor: Color(0xffFABF7C),
                  color: Color(0xffBCB0A1),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signin');
                  },
                  child: Text('INGRESA',style: TextStyle(fontFamily: 'AkzidenzGrotesk'),),
                ),
                SizedBox(height: 80,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
