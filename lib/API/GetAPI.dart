import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../Model/constants.dart';
import 'package:http/http.dart' as http;
import 'home_response.dart';

// api

Future<HomeResponse> GetHomeData() async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/GetHomeData?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "UserID": "e6e57e6a-98d9-497e-a15c-0675adc03007",
        "PageIndex": "1",
      }));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return HomeResponse.fromJson(jsonDecode(response.body));

}

class GetAPI extends StatelessWidget {
  Future<HomeResponse> _future;

  Widget build(BuildContext context) {
    return Scaffold(
      // each product have NguyenHaFood.db color
      appBar: buildAppBar(context),
      body: Center(
        child: IconButton(
            onPressed: () async {
              HomeResponse homeResponse = await GetHomeData();
            },
            icon: Image.asset(
              "assets/icons/click.png",
              color: kTextColor,
            )),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      // title: Text('${_future.statusId.toString()}'),
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          _backsrceen(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }

  void _backsrceen(BuildContext context) {
    Navigator.pop(context);
  }
}
