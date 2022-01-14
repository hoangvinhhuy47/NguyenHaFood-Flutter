import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:shop_app/API/acount/getproductReview_response.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/Model/constants.dart';
import 'package:shop_app/screens/Acount/interested%20products/item_product_review_acount.dart';
import 'package:shop_app/screens/ViewCart/viewcart_acitivty.dart';

Future<GetProductReViewResponse> GetProductReView(String pageindex) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/GetProductReView?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "UserID": goBal.UserID,        "PageIndex": pageindex,
      }));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return GetProductReViewResponse.fromJson(jsonDecode(response.body));
}

class product_review_acount extends StatefulWidget {
  State<product_review_acount> createState() => _product_review_acount();
}

class _product_review_acount extends State<product_review_acount> {
  GetProductReViewResponse response;
  GetProductReViewResponse responsemore;
  int show = 1;
  int pageindex =2;
  int check=1;
  void _getApimore(String pageIndex) async {
    if (show == 1) {
      responsemore = await GetProductReView(pageIndex);
      if (responsemore.productReviewList.length != 0) {
        pageindex=pageindex+1;
        setState(() {
          response.productReviewList.addAll(responsemore.productReviewList);
          show = 2;
        });
      }else{
        check=2;
      }
    }
  }
  void _getApi(String pageindex) async {
    if (show == 1) {
      response = await GetProductReView(pageindex);
      if (response.productReviewList.length != 0) {
        setState(() {
          show = 2;
        });
      }
    }
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    _getApi('1');
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        height: size.height - 80,
        child: show == 1
            ? Container():LazyLoadScrollView(
            child: GridView.builder(
            shrinkWrap: true,
            primary: true,
            scrollDirection: Axis.vertical,
            itemCount: response.productReviewList.length,
            // physics: NeverScrollableScrollPhysics(),
            // physics: ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 2.8,
            ),
            itemBuilder: (context, index) => item_product_review_acount(
              product: response.productReviewList[index],
            )), onEndOfPage:()=>loadmore())

      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: maucam,
      elevation: 5,
      toolbarHeight: 60,
      title: Text(
        "Sản Phẩm Đánh giá",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
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

  void loadmore() {
    if(check==1) {
      show = 1;
      _getApimore(pageindex.toString());
      print('pageindex ${pageindex.toString()}');
    }
    else{
      print('hết');
    }
  }
}