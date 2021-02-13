import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
 
void main() => runApp(Splash2());
 
class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: /*Home(title: APP_TITLE)*/'/login',
      // title: new Text('cupping',textScaleFactor: 5.5,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontFamily: 'AkzidenzGrotesk',),),
      image: new Image.asset('assets/images/cupping.png',scale: 1,color: Colors.white),
      imageBackground: NetworkImage('https://www.wallpaperflare.com/static/1015/14/551/coffee-coffee-grains-coffee-beans-toasted-wallpaper-preview.jpg',),
      photoSize: 150.0,
      loaderColor: Color(0xffEC9762),
    );
  }
}
