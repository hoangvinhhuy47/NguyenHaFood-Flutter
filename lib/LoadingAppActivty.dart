import 'package:flutter/material.dart';
import 'package:shop_app/screens/main_activity.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class LoadingAppActivty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
      navigateRoute: HomeScreen(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "assets/images/logo.jpg",
      text: "Nguyên Hà Food",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );

    return MaterialApp(
      home: example1,
    );
  }
}