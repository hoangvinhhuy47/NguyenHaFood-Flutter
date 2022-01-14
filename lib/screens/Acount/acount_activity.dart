import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/screens/Acount/Order/item_getorder_activity.dart';
import 'package:shop_app/screens/Acount/interested%20products/product_buy_acount.dart';
import 'package:shop_app/screens/Acount/interested%20products/product_favorite_acount.dart';
import 'package:shop_app/screens/Acount/interested%20products/product_laterbuy_acount.dart';
import 'package:shop_app/screens/Acount/interested%20products/product_review_acount.dart';
import 'package:shop_app/screens/Acount/interested%20products/product_view_acount.dart';
import 'package:shop_app/screens/ViewCart/viewcart_acitivty.dart';

import '../../Model/constants.dart';
import 'Order/GetOrder_Activity.dart';
import 'interested products/item_product_view_acount.dart';
import 'login_activtiy.dart';
class AcountActivity extends StatefulWidget{
  State<AcountActivity> createState()=>_AcountActivity();
}
class _AcountActivity extends State<AcountActivity> {
  String linkgroup = "https://www.facebook.com/groups/791878421562215";
  String linkfb="https://www.facebook.com/nguyenhafood.vn.video";
  String linkgg="https://www.google.com/maps/place//data=!4m2!3m1!1s0x31752f2eb132daeb:0xd2b5280c8fbca374?source=g.page.m";
  String linkzalo="https://zaloshop.me/store?id=f692c631cf7826267f69";
  String twitter="https://twitter.com/nguyenhafood";
  String linkyb = "https://www.youtube.com/channel/UClpibeSzfocURe-6PqE_0bg?view_as=subscriber";
  String linkinsta = "https://www.instagram.com/nguyenhafood/";
  String linktw="https://twitter.com/nguyenhafood";
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: buildAppBar(context),
        body: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                header1(size),
                header3(context,size),
                header6(size),
                header7(size),
              ],
            ),
          ),
        ));
  }

  Widget header1(Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: Card(
        child: TextButton(
          onPressed: (){
            Model.goToNewScreen(context, login_activity());
          },
          child: Container(
            height: 100,
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: maucam,
                    spreadRadius: 0.8,
                    blurRadius: 0.8,
                  )
                ]),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: size.width - 80,
                  padding: EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Xin chào bạn đến với NguyenHaFood.',
                        style: TextStyle(
                            color: mauden,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Đăng Nhập/ Đăng Ký',
                        style: TextStyle(
                            color: maucam,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5),
                  height: 50,
                  width: 50,
                  child: TextButton(
                    onPressed: () {},
                    child: Image.asset(
                      'assets/icons/settingacount.gif',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget header3(BuildContext context,Size size) {
    return ClipRRect(
      child: Container(
        height: 300,
        width: size.width,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  _goToNewScreen(context,login_activity());
                },
                child: Container(
                  height: 35,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      boxShadow: [
                        BoxShadow(
                          color: mauxam,
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                        )
                      ]),
                  child: Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          width: 50,
                          height: 30,
                          child: Image.asset(
                            'assets/icons/eye_show.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 20),
                            height: 30,
                            child: Text(
                              'Sản Phẩm Đã Xem',
                              style: TextStyle(
                                  color: mauden,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  _goToNewScreen(context,login_activity());

                },
                child: Container(
                  height: 35,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      boxShadow: [
                        BoxShadow(
                          color: mauxam,
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                        )
                      ]),
                  child: Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          width: 50,
                          height: 30,
                          child: Image.asset(
                            'assets/icons/loveproduct.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 20),
                            height: 30,
                            child: Text(
                              'Sản Phẩm Yêu Thích',
                              style: TextStyle(
                                  color: mauden,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  _goToNewScreen(context,login_activity());

                },
                child: Container(
                  height: 35,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      boxShadow: [
                        BoxShadow(
                          color: mauxam,
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                        )
                      ]),
                  child: Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          width: 50,
                          height: 30,
                          child: Image.asset(
                            'assets/icons/buy_late.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 20),
                            height: 30,
                            child: Text(
                              'Sản Phẩm Mua Sau',
                              style: TextStyle(
                                  color: mauden,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  _goToNewScreen(context,login_activity());

                },
                child: Container(
                  height: 35,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      boxShadow: [
                        BoxShadow(
                          color: mauxam,
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                        )
                      ]),
                  child: Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          width: 50,
                          height: 30,
                          child: Image.asset(
                            'assets/icons/buy_check.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 20),
                            height: 30,
                            child: Text(
                              'Sản Phẩm Đã Mua',
                              style: TextStyle(
                                  color: mauden,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  _goToNewScreen(context,login_activity());
                },
                child: Container(
                  height: 35,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      boxShadow: [
                        BoxShadow(
                          color: mauxam,
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                        )
                      ]),
                  child: Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          width: 50,
                          height: 30,
                          child: Image.asset(
                            'assets/icons/danhgia.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 20),
                            height: 30,
                            child: Text(
                              'Sản Phẩm Đã Đánh Giá',
                              style: TextStyle(
                                  color: mauden,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



  Widget header6(Size size) {
    return ClipRRect(
      child: Container(
        height: 150,
        width: size.width,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {},
                child: Container(
                  height: 35,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      boxShadow: [
                        BoxShadow(
                          color: mauxam,
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                        )
                      ]),
                  child: Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          width: 50,
                          height: 30,
                          child: Image.asset(
                            'assets/icons/connect.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 20),
                            height: 30,
                            child: Text(
                              'Kết Nối',
                              style: TextStyle(
                                  color: mauden,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Model.launchURL(linkgroup);
                },
                child: Container(
                  height: 35,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      boxShadow: [
                        BoxShadow(
                          color: mauxam,
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                        )
                      ]),
                  child: Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          width: 50,
                          height: 30,
                          child: Image.asset(
                            'assets/icons/connect_group.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 20),
                            height: 30,
                            child: Text(
                              'Tham Gia Nhóm Cộng Đồng',
                              style: TextStyle(
                                  color: mauden,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget header7(Size size) {
    return ClipRRect(
      child: Container(
        height: 100,
        width: size.width,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Model.launchURL(linkfb);

                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                'assets/icons/facebook.gif',
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Model.launchURL(linkgg);

                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                'assets/icons/google.gif',
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Model.launchURL(linkzalo);

                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                'assets/icons/zalo.png',
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Model.launchURL(linkyb);

                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                'assets/icons/youtube.gif',
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Model.launchURL(linktw);

                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                'assets/icons/twiiter.gif',
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: maucam,
      elevation: 0,
      title: Text(
        "Tài Khoản",
        style: TextStyle(color: mautrang),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: mautrang,
          ),
          onPressed: () {
            Model.goToNewScreen(context, viewcart_activity());
          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }

  void _backsrceen(BuildContext context) {
    Navigator.pop(context);
  }
  void _goToNewScreen(BuildContext context ,Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

}

