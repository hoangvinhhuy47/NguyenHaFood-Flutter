import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/DataBase/GetUser.dart';
import 'package:shop_app/DataBase/UserDatabase.dart';
import 'package:shop_app/DataBase/UserDatabase.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/screens/Acount/Adress/adressbook.dart';
import 'package:shop_app/screens/Acount/Order/item_getorder_activity.dart';
import 'package:shop_app/screens/Acount/interested%20products/product_buy_acount.dart';
import 'package:shop_app/screens/Acount/interested%20products/product_favorite_acount.dart';
import 'package:shop_app/screens/Acount/interested%20products/product_laterbuy_acount.dart';
import 'package:shop_app/screens/Acount/interested%20products/product_review_acount.dart';
import 'package:shop_app/screens/Acount/interested%20products/product_view_acount.dart';
import 'package:shop_app/screens/ViewCart/viewcart_acitivty.dart';
import 'package:shop_app/screens/main_activity.dart';
import 'package:uuid/uuid.dart';
import '../../Model/constants.dart';
import 'Order/GetOrder_Activity.dart';
import 'interested products/item_product_view_acount.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login_activtiy.dart';

class AcountLoginActivity extends StatefulWidget{
  State<AcountLoginActivity> createState()=>_AcountActivity();
}
class _AcountActivity extends State<AcountLoginActivity> {
  String linkgroup = "https://www.facebook.com/groups/791878421562215";
  String linkfb="https://www.facebook.com/nguyenhafood.vn.video";
  String linkgg="https://www.google.com/maps/place//data=!4m2!3m1!1s0x31752f2eb132daeb:0xd2b5280c8fbca374?source=g.page.m";
  String linkzalo="https://zaloshop.me/store?id=f692c631cf7826267f69";
  String twitter="https://twitter.com/nguyenhafood";
  String linkyb = "https://www.youtube.com/channel/UClpibeSzfocURe-6PqE_0bg?view_as=subscriber";
  String linkinsta = "https://www.instagram.com/nguyenhafood/";
  User user = new User();

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
                header2(context,size),
                header3(context,size),
                header4(size),
                header5(size),
                header6(size),
                header7(size),
                header8(size),
              ],
            ),
          ),
        ));
  }

  Widget header1(Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: Card(
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
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    'assets/icons/acount.png',
                    fit: BoxFit.cover,
                    color: maucam,
                  )),
              Container(
                height: 60,
                width: size.width - 150,
                padding: EdgeInsets.only(left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Xin Chào: ${goBal.UserName}',
                      style: TextStyle(
                          color: mauden,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Thành Viên: ${goBal.DateJoin}',
                      style: TextStyle(
                          color: mauxam,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )
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
    );
  }

  Widget header2(BuildContext context,Size size) {
    return ClipRRect(
      child: Container(
        height: 130,
        width: size.width,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 30,
                child: Text(
                  'Quản Lí Đơn Hàng',
                  style: TextStyle(
                      color: maucam, fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                height: 90,
                width: size.width,
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {
                          _goToNewScreen(context, getOrder(
                            typecheck: 1,
                          ));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 5),
                          height: 75,
                          width: 65,
                          child: Card(
                            child: Column(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                    'assets/icons/box_loading.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Đang xử lí',
                                  style: TextStyle(
                                      color: mauden,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        )),
                    TextButton(
                        onPressed: () { _goToNewScreen(context, getOrder(
                          typecheck: 2,
                        ));},
                        child: Container(
                          padding: EdgeInsets.only(top: 5),
                          height: 75,
                          width: 65,
                          child: Card(
                            child: Column(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                    'assets/icons/truck_32.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Đang vẩn chuyển',
                                  style: TextStyle(
                                      color: mauden,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        )),
                    TextButton(
                        onPressed: () { _goToNewScreen(context, getOrder(
                          typecheck: 3,
                        ));},
                        child: Container(
                          padding: EdgeInsets.only(top: 5),
                          height: 75,
                          width: 65,
                          child: Card(
                            child: Column(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                    'assets/icons/purchase_order_exit.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Đã Hủy',
                                  style: TextStyle(
                                      color: mauden,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        )),
                    TextButton(
                        onPressed: () {
                          _goToNewScreen(context, getOrder(
                            typecheck: 4,
                          ));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 5),
                          height: 75,
                          width: 65,
                          child: Card(
                            child: Column(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                    'assets/icons/purchase_order_check.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Hoàn Thành',
                                  style: TextStyle(
                                      color: mauden,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              )
            ],
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
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 30,
                child: Text(
                  'Quan Tâm',
                  style: TextStyle(
                      color: maucam, fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              TextButton(
                onPressed: () {
                  _goToNewScreen(context,product_view_acount());
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
                  _goToNewScreen(context,product_favorite_acount());
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
                  _goToNewScreen(context,productbuylate_acount());

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
                  _goToNewScreen(context,product_buy_acount());

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
                  _goToNewScreen(context,product_review_acount());
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

  Widget header4(Size size) {
    return ClipRRect(
      child: Container(
        height: 200,
        width: size.width,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 30,
                child: Text(
                  'Tiện Ích',
                  style: TextStyle(
                      color: maucam, fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              TextButton(
                onPressed: () {
                  Model.goToNewScreen(context, adressbook());
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
                            'assets/icons/location.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 20),
                            height: 30,
                            child: Text(
                              'Sổ Địa Chỉ',
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
                            'assets/icons/payment.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 20),
                            height: 30,
                            child: Text(
                              'Hình Thức Thanh Toán',
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
                            'assets/icons/support.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 20),
                            height: 30,
                            child: Text(
                              'Hỗ Trợ',
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

  Widget header5(Size size) {
    return ClipRRect(
      child: Container(
        height: 100,
        width: size.width,
        child: Row(
          children: [
            TextButton(
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  height: 100,
                  width: (size.width - 40) * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: maudo,
                          spreadRadius: 0.2,
                          blurRadius: 0.2,
                        )
                      ]),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/icons/sale_home.gif',
                            fit: BoxFit.cover),
                      ),
                      Text(
                        'Mã Khuyến Mãi',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: maudo),
                      )
                    ],
                  ),
                )),
            TextButton(
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  height: 100,
                  width: (size.width - 40) * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: maudo,
                          spreadRadius: 0.2,
                          blurRadius: 0.2,
                        )
                      ]),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/icons/referral.gif',
                            fit: BoxFit.cover),
                      ),
                      Text(
                        'Mã Giảm Giá',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: maudo),
                      )
                    ],
                  ),
                ))
          ],
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
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 30,
                child: Text(
                  'Mạng Xã hội',
                  style: TextStyle(
                      color: maucam, fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
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
              Container(
                padding: EdgeInsets.only(left: 5),
                height: 30,
                child: Text(
                  'Liên Kết',
                  style: TextStyle(
                      color: maucam, fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
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
                              launch(linkfb);
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
                              Model.launchURL(linkfb);
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
                            onPressed: () {},
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
                            onPressed: () {},
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
                            onPressed: () {},
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

  Widget header8(Size size) {
    return Card(
      child: Container(
        height: 80,
        child: Center(
          child: TextButton(
            onPressed: () {

              SignOut();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40,
                width: 150,
                color: maucam,
                alignment: Alignment.center,
                child: Text(
                  'Đăng Xuất',
                  style: TextStyle(
                      color: mautrang,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void checklogin() async{
    LoginCtr con = new LoginCtr();
    User usertest = new User();
    usertest= await con.getLogin();
    print('');
  }
void SignOut() async{
  LoginCtr con = new LoginCtr();
  con.deleteUser(user);
  var User = Uuid().v1();
  goBal.UserID =User.toString();
  goBal.CheckLogin=1;
  Model.goToNewScreen(context, HomeScreen());
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

