import 'package:flutter/material.dart';
import 'package:shop_app/Model/constants.dart';
import 'package:shop_app/screens/Loading_Activity.dart';
import 'package:shop_app/screens/ViewCart/viewcart_acitivty.dart';
import 'package:shop_app/screens/main_activity.dart';

import 'LoadingAppActivty.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
