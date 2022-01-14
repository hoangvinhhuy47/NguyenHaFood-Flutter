import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/API/login_response.dart';
import 'package:shop_app/DataBase/GetUser.dart';
import 'package:shop_app/DataBase/SqlLite.dart';
import 'package:shop_app/DataBase/UserDatabase.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/Model/constants.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import '../main_activity.dart';
Future<LoginResponse> CheckLogin(
    String user, String password) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/CheckLogin?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "UserName":user,
        "Password":password
      }));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return LoginResponse.fromJson(jsonDecode(response.body));
}



class login_activity extends StatefulWidget {
  State<login_activity> createState() => _login_activity();
}

class _login_activity extends State<login_activity> {

  bool show = false;
  LoginResponse response;
  final acount = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: buildAppBar(context),
        body: Container(
          child: Column(
            children: [
              ClipRRect(
                  child: Container(
                height: 2 * (size.height - 120) / 6,
                width: size.width,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'Chào Mừng Bạn Đến Với Nguyen Ha Food',
                      style: TextStyle(
                          color: maucam,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Card(
                      child: Container(
                        height: (2 * (size.height - 120) / 6) - 60,
                        width: 3 * size.width / 4,
                        child: Image.asset(
                          'assets/images/logo.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              )),
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                child: Container(
                  height: 4 * (size.height - 100) / 6,
                  child: DefaultTabController(
                      length: 2,
                      child: Scaffold(
                        backgroundColor: mautrang,
                        appBar: TabBar(
                          tabs: [
                            Container(
                                alignment: Alignment.center,
                                height: 50,
                                child: Text(
                                  'Đăng Nhập',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: maucam,
                                      fontWeight: FontWeight.w400),
                                )),
                            Container(
                                alignment: Alignment.center,
                                height: 50,
                                child: Text(
                                  'Đăng Ký',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: maucam,
                                      fontWeight: FontWeight.w400),
                                )),
                          ],
                        ),
                        body: TabBarView(children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                boxShadow: [
                                  BoxShadow(
                                    color: maucam,
                                    spreadRadius: 0.8,
                                    blurRadius: 0.8,
                                  )
                                ]),
                            child: signin(context,size),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                boxShadow: [
                                  BoxShadow(
                                    color: maucam,
                                    spreadRadius: 0.8,
                                    blurRadius: 0.8,
                                  )
                                ]),
                             child:register(context,size),
                          ),
                        ]),
                      )),
                ),
              )
            ],
          ),
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: maucam,
      toolbarHeight: 60,
      elevation: 0,
      title: Text(
        "Đăng Nhập/ Đăng Ký",
        style: TextStyle(color: mautrang),
      ),
      centerTitle: true,
    );
  }
    Widget signin(BuildContext context, Size size){
      return Container(
        width: size.width-10,
        padding:
        EdgeInsets.only(left: 10, right: 10, top: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tài Khoản',
                style: TextStyle(
                    color: maucam,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 5,right: 5),
                child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 5,right: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(2)),
                        boxShadow: [
                          BoxShadow(
                            color: mauden,
                            spreadRadius: 0.5,
                            blurRadius: 0.5,

                          )
                        ]),
                    child: TextField(
                      controller: acount,
                      keyboardType:
                      TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.only(top: 14.0),
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          color: Colors.black,
                        ),
                        hintText: 'Tài Khoản',
                      ),
                    )),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Mật Khẩu',
                style: TextStyle(
                    color: maucam,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 5,right: 5),
                child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 5,right: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: mauden,
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                          )
                        ]),
                      child: TextField(
                        controller: password,
                        keyboardType:
                        TextInputType.visiblePassword,
                        obscureText: show==false?true:false,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                          EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.black,
                          ),
                          hintText: 'Mật Khẩu',
                        ),
                      )),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: size.width,
                height: 30,
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      child: Checkbox(
                          activeColor: maucam,
                          hoverColor: maucam,
                          value: show,
                          onChanged: (value) {
                            setState(() {
                              show = value;
                            });
                          }),
                    ),
                    Text('Hiện Thị Mật Khẩu',
                        style: TextStyle(
                          color: maucam,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: size.width,
                alignment: Alignment.center,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    checklogin(context,acount.text,password.text);
                  },
                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.circular(10),
                    child: Container(
                      width: size.width / 2,
                      height: 50,
                      color: maucam,
                      alignment: Alignment.center,
                      child: Text(
                        'Đăng Nhập',
                        style: TextStyle(
                            color: mautrang,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                width: size.width - 20,
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Quên Mật Khẩu?',
                    style: TextStyle(
                        color: mauden,
                        fontWeight: FontWeight.w300,
                        decoration:
                        TextDecoration.underline),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                width: size.width - 20,
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '-Hoặc Đăng Nhập Với-',
                    style: TextStyle(
                        color: mauden,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                width: size.width - 20,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {

                        },
                        child:Image.asset('assets/icons/icon_fb.png',fit: BoxFit.cover,)
                    ),
                    TextButton(
                        onPressed: () {},
                        child:Image.asset('assets/icons/icon_gg.png',fit: BoxFit.cover,)
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  Widget register(BuildContext context,Size size){
    bool check =false;
    bool check1 =false;
    return Container(
      width: size.width,
      padding:
      EdgeInsets.only(left: 10, right: 10, top: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: maucam,
                        spreadRadius: 0.8,
                        blurRadius: 0.8,
                      )
                    ]),
                child: TextField(
                  keyboardType:
                  TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(top: 5.0,left: 10),
                    hintText: 'Họ và tên',
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: maucam,
                        spreadRadius: 0.8,
                        blurRadius: 0.8,
                      )
                    ]),
                child: TextField(
                  keyboardType:
                  TextInputType.phone,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(top: 5.0,left: 10),
                    hintText: 'Số điện thoại',
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: maucam,
                        spreadRadius: 0.8,
                        blurRadius: 0.8,
                      )
                    ]),
                child: TextField(
                  keyboardType:
                  TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(top: 5.0,left: 10),
                    hintText: 'Ngày Sinh',
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: maucam,
                        spreadRadius: 0.8,
                        blurRadius: 0.8,
                      )
                    ]),
                child: TextField(
                  keyboardType:
                  TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(top: 5.0,left: 10),
                    hintText: 'Địa Chỉ',
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: maucam,
                        spreadRadius: 0.8,
                        blurRadius: 0.8,
                      )
                    ]),
                child: TextField(
                  keyboardType:
                  TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(top: 5.0,left: 10),
                    hintText: 'Tài Khoản',
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: maucam,
                        spreadRadius: 0.8,
                        blurRadius: 0.8,
                      )
                    ]),
                child: TextField(
                  keyboardType:
                  TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(top: 5.0,left: 10),
                    hintText: 'Mật Khẩu',
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: maucam,
                        spreadRadius: 0.8,
                        blurRadius: 0.8,
                      )
                    ]),
                child: TextField(
                  keyboardType:
                  TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(top: 5.0,left: 10),
                    hintText: 'Nhập Lại Mật Khẩu',
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: maucam,
                        spreadRadius: 0.8,
                        blurRadius: 0.8,
                      )
                    ]),
                child: TextField(
                  keyboardType:
                  TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(top: 5.0,left: 10),
                    hintText: 'Địa Chỉ Email',
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: maucam,
                        spreadRadius: 0.8,
                        blurRadius: 0.8,
                      )
                    ]),
                child: TextField(
                  keyboardType:
                  TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(top: 5.0,left: 10),
                    hintText: 'Mã Giới Thiệu',
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 80,
              child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Giới Tính',style: TextStyle(color: maucam,fontSize: 14),),
                  Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Checkbox(value: check, onChanged: (value){
                              check=value;
                            }),
                            Text('Nam')
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Checkbox(value: check, onChanged: (value){
                              check=value;
                            }),
                            Text('Nữ')
                          ],
                        ),
                      )
                    ],
                  ),)
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    children: [
                      Checkbox(value: check, onChanged: (value){
                        check=value;
                      }),
                      Text('Chấp Nhận Điều Khoản Sử Dụng',style: TextStyle(color: maucam,fontSize: 14,fontWeight: FontWeight.w400),)

                    ],
                  ),
                )
              ],
            ),),
            SizedBox(
              height: 10.0,
            ),
            Container(
              alignment: Alignment.center,
              width: size.width,
              height: 70,
              child: TextButton(
                onPressed: (){},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: size.width/2,
                    height: 50,
                    color: maucam,
                    alignment: Alignment.center,
                    child: Text('Đăng Ký', style: TextStyle(color: mautrang,fontSize: 16,fontWeight: FontWeight.w400),),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
  void checklogin(BuildContext context1,String user, String pass) async {
    try {
      response = await CheckLogin(user, pass);
      if (response.statusId == 1) {
        goBal.CheckLogin = 2;
        User user = new User();
        user.iD = 1;
        user.customerID = response.customer.customerId;
        user.userName = response.customer.userName;
        user.fullName = response.customer.fullName;
        user.passWordEnCode = response.customer.password;
        user.passWord = password.text;
        user.email = response.customer.email;
        LoginCtr con = new LoginCtr();
        con.saveUser(user);
        SharedPreferences preferences = await SharedPreferences.getInstance();
        setState(() {
          preferences.setString('UserID', user.customerID);
          preferences.setString('Pass', user.passWord);
          preferences.setString('FullName', user.fullName);
          preferences.setString('UserName', user.userName);
          preferences.commit();
        });
        goBal.CheckLogin = 2;
        goBal.UserID = user.customerID;
        goBal.UserName = user.fullName;
        goBal.DateJoin =
            Model.coverDatetoString1(response.customer.createdDate);
        goBal.userCellPhone = response.customer.cellPhone;
        Model.goToNewScreen(context1, HomeScreen());
      }
      else {
        Model.dialog_erro(context1, 'Sai Tài Khoản  Hoặc Mật Khẩu');
      }
    }
    catch(e){
      showDialog(context: context, builder: (BuildContext context){
        return   Model.dialog_erro(context1, 'Sai Tài Khoản  Hoặc Mật Khẩu');
      });
    }
  }
}
