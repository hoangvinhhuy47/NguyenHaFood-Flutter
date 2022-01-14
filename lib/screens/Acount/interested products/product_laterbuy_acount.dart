import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:shop_app/API/acount/getproductlaterbuy_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/Model/constants.dart';
import 'package:shop_app/screens/ViewCart/viewcart_acitivty.dart';

import 'item_productbuylate_acount.dart';

Future<GetProductLaterBuyResponse> GetProductLater(String pageindex) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/GetProductLaterBuy?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "UserID": goBal.UserID,
        "PageIndex": pageindex,
      }));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return GetProductLaterBuyResponse.fromJson(jsonDecode(response.body));
}

class productbuylate_acount extends StatefulWidget {
  const productbuylate_acount({Key key, this.product}) : super(key: key);

  State<productbuylate_acount> createState() => _productbuylate_acount();
  final GetProductLaterBuyResponse product;
}

class _productbuylate_acount extends State<productbuylate_acount> {
  GetProductLaterBuyResponse getProductLaterBuyResponse;
  GetProductLaterBuyResponse getProductLaterBuyResponsemore;

  int show = 1;
  int pageindex = 2;
  int check = 1;

  void _getApi(String pageindex) async {
    if (show == 1) {
      getProductLaterBuyResponse = await GetProductLater(pageindex);
      if (getProductLaterBuyResponse.homeData.length != 0) {
        setState(() {
          show = 2;
        });
      }
    }
  }

  void _getApimore(String pageIndex) async {
    if (show == 1) {
      getProductLaterBuyResponsemore = await GetProductLater(pageIndex);
      if (getProductLaterBuyResponsemore.homeData.length != 0) {
        pageindex=pageindex+1;
        setState(() {
          getProductLaterBuyResponse.homeData.addAll(getProductLaterBuyResponsemore.homeData);
          show = 2;
        });
      }
      else{
        check=2;
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
              ? Container()
              : LazyLoadScrollView(
                  child: GridView.builder(
                      shrinkWrap: true,
                      primary: true,
                      scrollDirection: Axis.vertical,
                      itemCount: getProductLaterBuyResponse.homeData.length,
                      // physics: NeverScrollableScrollPhysics(),
                      // physics: ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                        childAspectRatio: 2.8,
                      ),
                      itemBuilder: (context, index) =>
                          item_product_laterbuy_acount(
                            product: getProductLaterBuyResponse.homeData[index],
                          )),
                  onEndOfPage: () => loadmore())),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: maucam,
      elevation: 5,
      toolbarHeight: 60,
      title: Text(
        "Sản Phẩm Mua Sau",
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
    if(check==1){
      _getApimore(pageindex.toString());
      print('pageindex ${pageindex.toString()}');
    }
    else{
      print('hết');
    }
  }
}
