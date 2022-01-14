import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:shop_app/API/Order/getorder_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/Model/constants.dart';
import 'package:shop_app/screens/Acount/Order/item_getorder1_activity.dart';
import 'package:shop_app/screens/Acount/Order/item_getorder2_activity.dart';
import 'package:shop_app/screens/Acount/Order/item_getorder_activity.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/screens/Loading_Activity.dart';
import 'package:shop_app/screens/ViewCart/viewcart_acitivty.dart';

import 'item_getorder3_activity.dart';

Future<GetOrderResponse> GetOrder(String pageIndex, String OrderStatus) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/GetOrder?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "UserID": goBal.UserID,
        "PageIndex": pageIndex,
        "OrderStatus": OrderStatus
      }));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return GetOrderResponse.fromJson(jsonDecode(response.body));
}

class getOrder extends StatefulWidget {
  const getOrder({Key key, this.typecheck}) : super(key: key);

  State<getOrder> createState() => _getOrder();
  final int typecheck;
}

class _getOrder extends State<getOrder> {
  int show1 = 1;
  int show2 = 1;
  int show3 = 1;
  int show4 = 1;
  int pageindex1 = 2;
  int pageindex2 = 2;
  int pageindex3 = 2;
  int pageindex4 = 2;
  int check1 = 1;
  int check2 = 1;
  int check3 = 1;
  int check4 = 1;
  GetOrderResponse response1;
  GetOrderResponse response2;
  GetOrderResponse response3;
  GetOrderResponse response4;
  GetOrderResponse responsemore1;
  GetOrderResponse responsemore2;
  GetOrderResponse responsemore3;
  GetOrderResponse responsemore4;

  void gettype1(String pageIndex, String OrderSTT) async {
    if (show1 == 1) {
      response1 = await GetOrder(pageIndex, OrderSTT);
      if (response1.statusId == 1 && response1.orderList.length != 0) {
        setState(() {
          show1 = 2;
        });
      }
    }
  }

  void gettype2(String pageIndex, String OrderSTT) async {
    if (show2 == 1) {
      response2 = await GetOrder(pageIndex, OrderSTT);
      if (response2.statusId == 1 && response2.orderList.length != 0) {
        setState(() {
          show2 = 2;
        });
      }
    }
  }

  void gettype3(String pageIndex, String OrderSTT) async {
    if (show3 == 1) {
      response3 = await GetOrder(pageIndex, OrderSTT);
      if (response3.statusId == 1 && response3.orderList.length != 0) {
        setState(() {
          show3 = 2;
        });
      }
    }
  }

  void gettype4(String pageIndex, String OrderSTT) async {
    if (show4 == 1) {
      response4 = await GetOrder(pageIndex, OrderSTT);
      if (response4.statusId == 1 && response4.orderList.length != 0) {
        setState(() {
          show4 = 2;
        });
      }
    }
  }

  void gettype1more(String pageIndex, String OrderSTT) async {
    if (show1 == 1) {
      responsemore1 = await GetOrder(pageIndex, OrderSTT);
      if (responsemore1.statusId == 1 && responsemore1.orderList.length != 0) {
        pageindex1 = pageindex1 + 1;
        setState(() {
          response1.orderList.addAll(responsemore1.orderList);
          show1 = 2;
        });
      } else {
        check1 = 2;
      }
    }
  }

  void gettype2more(String pageIndex, String OrderSTT) async {
    if (show2 == 1) {
      responsemore2 = await GetOrder(pageIndex, OrderSTT);
      if (responsemore2.statusId == 1 && responsemore2.orderList.length != 0) {
        pageindex2 = pageindex2 + 1;
        setState(() {
          response2.orderList.addAll(responsemore2.orderList);
          show2 = 2;
        });
      } else {
        check2 = 2;
      }
    }
  }

  void gettype3more(String pageIndex, String OrderSTT) async {
    if (show3 == 1) {
      responsemore3 = await GetOrder(pageIndex, OrderSTT);
      if (responsemore3.statusId == 1 && responsemore3.orderList.length != 0) {
        pageindex3 = pageindex3 + 1;
        setState(() {
          response3.orderList.addAll(responsemore3.orderList);
          show3 = 2;
        });
      } else {
        check3 = 2;
      }
    }
  }

  void gettype4more(String pageIndex, String OrderSTT) async {
    if (show4 == 1) {
      responsemore4 = await GetOrder(pageIndex, OrderSTT);
      if (responsemore4.statusId == 1 && responsemore4.orderList.length != 0) {
        pageindex4 = pageindex4 + 1;
        setState(() {
          response4.orderList.addAll(responsemore4.orderList);
          show4 = 2;
        });
      } else {
        check4 = 2;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    gettype1('1', '1');
    gettype2('1', '2');
    gettype3('1', '3');
    gettype4('1', '4');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            child: DefaultTabController(
              initialIndex: widget.typecheck-1,
                length: 4,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: maucam,
                    title: Text(
                      "Quản Lí Đơn Hàng",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    centerTitle: true,
                    actions: <Widget>[
                      IconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/search.svg",
                          // By default our  icon color is white
                          color: kTextLightColor,
                        ),
                        onPressed: () {
                          // _goToNewScreen(context);
                        },
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/cart.svg",
                          // By default our  icon color is white
                          color: kTextLightColor,
                        ),
                        onPressed: () {},
                      ),
                    ],
                    bottom: TabBar(
                      tabs: [
                        Text('Đang xử lí'),
                        Text('Đang vận chuyển'),
                        Text('Đã hủy'),
                        Text('Hoàn tất'),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      Container(
                          height: size.height - 80,
                          child: show1 == 1
                              ? LoadingListPage()
                              : LazyLoadScrollView(
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      primary: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: response1.orderList.length,
                                      // physics: NeverScrollableScrollPhysics(),
                                      // physics: ScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        crossAxisSpacing: 1,
                                        mainAxisSpacing: 1,
                                        childAspectRatio: 2.6,
                                      ),
                                      itemBuilder: (context, index) =>
                                          item_getorder1_activity(
                                              orderList:
                                                  response1.orderList[index])),
                                  onEndOfPage: () => loadmore(1))),
                      Container(
                          height: size.height - 80,
                          child: show2 == 1
                              ? LoadingListPage()
                              : LazyLoadScrollView(
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      primary: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: response2.orderList.length,
                                      // physics: NeverScrollableScrollPhysics(),
                                      // physics: ScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        crossAxisSpacing: 1,
                                        mainAxisSpacing: 1,
                                        childAspectRatio: 2.6,
                                      ),
                                      itemBuilder: (context, index) =>
                                          item_getorder2_activity(
                                              orderList:
                                                  response2.orderList[index])),
                                  onEndOfPage: () => loadmore(2))),
                      Container(
                          height: size.height - 80,
                          child: show3 == 1
                              ? LoadingListPage()
                              : LazyLoadScrollView(
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      primary: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: response3.orderList.length,
                                      // physics: NeverScrollableScrollPhysics(),
                                      // physics: ScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        crossAxisSpacing: 1,
                                        mainAxisSpacing: 1,
                                        childAspectRatio: 2.6,
                                      ),
                                      itemBuilder: (context, index) =>
                                          item_getorder3_activity(
                                              orderList:
                                                  response3.orderList[index])),
                                  onEndOfPage: () => loadmore(3))),
                      Container(
                          height: size.height - 80,
                          child: show4 == 1
                              ? LoadingListPage()
                              : LazyLoadScrollView(
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      primary: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: response4.orderList.length,
                                      // physics: NeverScrollableScrollPhysics(),
                                      // physics: ScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        crossAxisSpacing: 1,
                                        mainAxisSpacing: 1,
                                        childAspectRatio: 2.6,
                                      ),
                                      itemBuilder: (context, index) =>
                                          item_getorder4_activity(
                                              orderList:
                                                  response4.orderList[index])),
                                  onEndOfPage: () => loadmore(4))),
                    ],
                  ),
                ))));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: maucam,
      elevation: 5,
      toolbarHeight: 60,
      title: Text(
        "Quản Lí Đơn Hàng",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextLightColor,
          ),
          onPressed: () {
            // _goToNewScreen(context);
          },
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextLightColor,
          ),
          onPressed: () {
            Model.goToNewScreen(context, viewcart_activity());

          },
        ),
      ],
    );
  }

  void loadmore(int type) {
    if (type == 1) {
      if (check1 == 1) {
        gettype1more(pageindex1.toString(), '1');
      }
    }
    if (type == 2) {
      if (check2 == 1) {
        gettype2more(pageindex2.toString(), '2');
      }
    }
    if (type == 3) {
      if (check3 == 1) {
        gettype3more(pageindex3.toString(), '3');
      }
    }
    if (type == 4) {
      if (check4 == 1) {
        gettype4more(pageindex4.toString(), '4');
      }
    }
  }
}
