import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:shop_app/API/search_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/screens/ViewCart/viewcart_acitivty.dart';
import '../../Model/constants.dart';
import 'package:http/http.dart' as http;

import 'Product_Search.dart';

Future<SearchProductResponse> SearchProduct(
    String searchString, String pageIndex) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/SearchProduct?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "UserID": goBal.UserID,
        "PageIndex": pageIndex,
        "SearchString": searchString
      }));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return SearchProductResponse.fromJson(jsonDecode(response.body));
}

class SearchActivity extends StatefulWidget {
  State<SearchActivity> createState() => _SearchActivity();
}

class _SearchActivity extends State<SearchActivity> {
  final textinput = TextEditingController();
  SearchProductResponse response;
  SearchProductResponse responsemore;
  int search = 1;
  int check =1;
  int pageindex =2;
  void _searchproductmore(String stringSearch, String pageIndex) async {
    responsemore = await SearchProduct(stringSearch, pageIndex);
    if (responsemore.homeData.productList.length > 0) {
      pageindex = pageindex+1;
      setState(() {
        response.homeData.productList.addAll( responsemore.homeData.productList);
        search = 2;
      });
    }
    else{
      check=2;
    }
  }
  void _searchproduct(String stringSearch, String pageIndex) async {
    response = await SearchProduct(stringSearch, pageIndex);
    if (response.homeData.productList.length > 0) {
      setState(() {
        search = 2;
      pageindex =2;
      });
    }
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(context),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: size.width,height: 3,color: maucam,),
            Card(
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 60,
                color: mautrang,
                width: size.width,
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Container(
                          width: size.width - 120,
                          height: 40,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              color: mautrang,
                              borderRadius: BorderRadius.all(Radius.circular(2)),
                              boxShadow: [
                                BoxShadow(
                                  color: mauxam,
                                  spreadRadius:1,
                                  blurRadius: 1,
                                )
                              ]),
                          child: TextField(
                            controller: textinput,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                              EdgeInsets.only(top: 1.0,left: 10),
                              hintText: 'Tìm Kiếm...',
                            ),
                          )),
                    ),
                    Card(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: 40,
                          width: 40,
                          color: maucam,
                          child: TextButton(
                              onPressed: () {
                                print('${textinput.text}');
                                _searchproduct(textinput.text, '1');
                              },
                              child: SvgPicture.asset(
                                'assets/icons/search.svg',
                                fit: BoxFit.cover,
                                color: mautrang,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            search == 1
                ? Container()
                :
                LazyLoadScrollView(child:
                Expanded(
                    child: GridView.builder(
                      itemCount: response.homeData.productList.length,
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) => product_search(
                        productList: response.homeData.productList[index],
                      ),
                    )
                ), onEndOfPage: ()=> loadmore())
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: mautrang,
      elevation: 0,
      toolbarHeight: 40,
      title: Text(
        "Tìm Kiếm",
        style: TextStyle(color: maucam),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: maucam,
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

  void loadmore() {
    if(check==1){
      _searchproductmore(textinput.text,pageindex.toString());
      print('pageindex ${pageindex.toString()}');
    }
    else{
      print('hết');
    }
  }
}
