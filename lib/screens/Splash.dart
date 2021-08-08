import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:SalesApp/dashboard.dart';
//import 'package:SalesApp/theme/style.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
      navigateRoute: DashboardPrincipal(),
      duration: 7000,
      imageSize: 130,
      imageSrc: "splashscreen_image.png",
      //imageSrc: "icone.png",
      text: "Sales App",
      textType: TextType.ScaleAnimatedText,
      textStyle: TextStyle(
        fontSize: 30.0,
        color: Colors.white
      ),
      backgroundColor: Colors.red[900],
    );

    return MaterialApp(
      title: 'SalesApp',
      home: example1,
    );
  }
}