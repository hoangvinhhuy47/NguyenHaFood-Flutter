import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/API/login_response.dart';
import 'package:shop_app/DataBase/GetUser.dart';
import 'package:shop_app/DataBase/SqlLite.dart';
import 'package:shop_app/DataBase/UserDatabase.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/Model/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import 'main_activity.dart';

Future<LoginResponse> CheckLogin(String user, String password) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/CheckLogin?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:
          jsonEncode(<String, String>{"UserName": user, "Password": password}));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return LoginResponse.fromJson(jsonDecode(response.body));
}

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _Loading();
}

final double initaialradius = 30.0;
double radius = 0.0;

class _Loading extends State<Loading> with SingleTickerProviderStateMixin {
  LoginResponse loginResponse;
  User user = new User();
  int show=1;

  void checkLogin(BuildContext context, String user1, String pass) async {
    loginResponse = await CheckLogin(user1, pass);
    if (loginResponse.statusId == 1) {
      goBal.DateJoin =
          Model.coverDatetoString1(loginResponse.customer.createdDate);
      goBal.CheckLogin = 2;
      goBal.UserID = loginResponse.customer.customerId;
      goBal.UserName = loginResponse.customer.fullName;
      goBal.userCellPhone = loginResponse.customer.cellPhone;
      Model.goToNewScreen(context, HomeScreen());

    } else {
      var User = Uuid().v1();
      goBal.UserID = User.toString();
      goBal.CheckLogin = 1;
      Model.goToNewScreen(context, HomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    GetDataBase(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      color: mautrang,
      height: size.height,
      width: size.width,
     child: Image.asset('assets/images/loading.jpg',fit: BoxFit.cover,),
    );
  }

  void GetDataBase(BuildContext context) async {
    Future.delayed(const Duration(seconds: 3), () async{
       user = new User();
       show=2;
       try {
         LoginCtr con = LoginCtr();
         user = await con.getLogin();
         if (user != null) {
           Fluttertoast.showToast(msg: 'Có Dữ liệu nè');
           checkLogin(context, user.userName, user.passWord);
         } else {
           var User1 = Uuid().v1();
            goBal.UserID = User1.toString();
           goBal.CheckLogin = 1;
           Fluttertoast.showToast(msg: 'Chưa có liệu nè');
           Model.goToNewScreen(context, HomeScreen());
         }
       } catch (e) {
         print('${e}');
       }
    }
    );
  }
}

class LoadingListPage extends StatefulWidget {
  @override
  _LoadingListPageState createState() => _LoadingListPageState();
}

class _LoadingListPageState extends State<LoadingListPage> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                enabled: _enabled,
                child: ListView.builder(
                  itemBuilder: (_, __) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 48.0,
                          height: 48.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: 40.0,
                                height: 8.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  itemCount: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
