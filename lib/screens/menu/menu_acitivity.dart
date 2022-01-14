import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:shop_app/API/getProductByCatory_Menu.dart';
import 'package:shop_app/API/menu_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/screens/Loading_Activity.dart';
import 'package:shop_app/screens/ViewCart/viewcart_acitivty.dart';
import 'package:shop_app/screens/menu/CatoryIteam/CatoryItemMenu.dart';
import 'package:shop_app/screens/menu/Catoryroot/CatoryRootMenu.dart';
import 'package:shop_app/screens/menu/ProductMenu/ProductMenu.dart';

import '../../Model/constants.dart';
import 'package:http/http.dart' as http;

Future<MenuResponse> GetCategoryData() async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/GetCategoryData?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{   "UserID": goBal.UserID,}));
  return MenuResponse.fromJson(jsonDecode(response.body));
}

Future<GetProductByCategoryResponse> GetProductByCatory_Menu(
    String IDProduct, String pageindex1) async {
  final URLAPI1 = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/GetProductByCategory?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA=");
  final response1 = await http.post(URLAPI1,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "UserID": "e6e57e6a-98d9-497e-a15c-0675adc03007",
        "ProductCategoryID": IDProduct,
        "PageIndex": pageindex1
      }));
  print('${response1.body}');
  return GetProductByCategoryResponse.fromJson(jsonDecode(response1.body));
}

class MenuActivity extends StatefulWidget {
  State<MenuActivity> createState() => _MenuActivity();
}

class _MenuActivity extends State<MenuActivity>
    with AutomaticKeepAliveClientMixin {
  MenuResponse menuResponse;
  GetProductByCategoryResponse catory;
  GetProductByCategoryResponse catorymore;
  int update = 1;
  int indexCatoryRoot = 0;
  int indexCatoryItem = 0;
  int pageindex = 1;
  bool typemenu = false;
  String OrderID = '';
  int pageindexmore = 2;

  void _updateCatory(String IDproduct, String pageindex, int indexcatoryroot,
      int indexcatoryitem, bool type) async {
    catory = await GetProductByCatory_Menu(IDproduct, pageindex);
    catorymore = new GetProductByCategoryResponse();
    if (catory.statusId == 1) {
      if (type == false) {
        typemenu = false;
        setState(() {
          typemenu = true;
          indexCatoryRoot = indexcatoryroot;
          OrderID = menuResponse.homeData.itemDtoList
              .elementAt(indexCatoryRoot)
              .itemList
              .elementAt(0)
              .category
              .productCategoryId;
          pageindexmore = 2;
        });
      } else {
        typemenu = false;
        setState(() {
          typemenu = true;
          indexCatoryItem = indexcatoryitem;
          OrderID = menuResponse.homeData.itemDtoList
              .elementAt(indexCatoryRoot)
              .itemList
              .elementAt(indexCatoryItem)
              .category
              .productCategoryId;
          pageindexmore = 2;
        });
      }
    }
  }

  void getAPIMOre(String IDproduct, String pageindex)async {
    catorymore = await  GetProductByCatory_Menu(IDproduct, pageindex);
    if(catorymore.statusId==1&& catorymore.homeData.productList.length!=0){
      pageindexmore = pageindexmore+1;
      setState(() {
        catory.homeData.productList.addAll( catorymore.homeData.productList);
      });
    }
  }

  void _getAPI() async {
    menuResponse = await GetCategoryData();
    if (update == 1) {
      if (menuResponse.statusId == 1) {
        setState(() {
          OrderID = menuResponse.homeData.itemDtoList
              .elementAt(0)
              .itemList
              .elementAt(0)
              .category
              .productCategoryId;
          update = 2;
          pageindexmore = 2;
        });
      }
    }
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    super.build(context);
    _getAPI();
    if (update == 1) {
      return Expanded(child: LoadingListPage());
    } else {
      return Scaffold(
        // each product have NguyenHaFood.db color
        appBar: buildAppBar(context),
        body: Scaffold(
          body: Column(
            children: [
              Container(
                width: size.width,
                height: 3,
                color: maucam,
              ),
              Container(
                height: 140,
                width: size.width,
                padding: const EdgeInsets.only(top: 5, left: 2, right: 2),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      goBal.URL_image +
                          menuResponse.homeData.itemDtoList
                              .elementAt(indexCatoryRoot)
                              .categoryRoot
                              .photo,
                      fit: BoxFit.cover,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 90,
                    height: size.height-280,
                    child: Card(
                      child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: menuResponse.homeData.itemDtoList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                          ),
                          itemBuilder: (context, index) => Stack(
                                children: [
                                  catoryRootMenu(
                                    itemDtoList: menuResponse
                                        .homeData.itemDtoList[index],
                                    active:
                                        index == indexCatoryRoot ? true : false,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      typemenu = true;
                                      indexCatoryItem = 0;
                                      _updateCatory(
                                          menuResponse.homeData.itemDtoList
                                              .elementAt(index)
                                              .itemList
                                              .elementAt(0)
                                              .category
                                              .productCategoryId,
                                          pageindex.toString(),
                                          index,
                                          0,
                                          false);
                                    },
                                  )
                                ],
                              )),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 85,
                        width: size.width-90,
                        child: Card(
                          child: GridView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: menuResponse.homeData.itemDtoList
                                  .elementAt(indexCatoryRoot)
                                  .itemList
                                  .length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                              ),
                              itemBuilder: (context, index) => Stack(
                                    children: [
                                      catoryrootItemMenu(
                                        iteamcatoymenu: menuResponse
                                            .homeData.itemDtoList
                                            .elementAt(indexCatoryRoot)
                                            .itemList[index],
                                        active: index == indexCatoryItem
                                            ? true
                                            : false,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          typemenu = true;
                                          _updateCatory(
                                              menuResponse.homeData.itemDtoList
                                                  .elementAt(indexCatoryRoot)
                                                  .itemList
                                                  .elementAt(index)
                                                  .category
                                                  .productCategoryId,
                                              pageindex.toString(),
                                              indexCatoryRoot,
                                              index,
                                              true);
                                        },
                                      )
                                    ],
                                  )),
                        ),
                      ),
                      Container(

                        width: size.width-90,
                        height: size.height-280-85,
                        child: Card(
                            child: LazyLoadScrollView(
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: typemenu == false
                                        ? menuResponse.homeData.itemDtoList
                                            .elementAt(indexCatoryRoot)
                                            .itemList
                                            .elementAt(indexCatoryItem)
                                            .productList
                                            .length
                                        : catory.homeData.productList.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: 1.62,
                                      mainAxisSpacing: 2,
                                    ),
                                    itemBuilder: (context, index) =>
                                        typemenu == false
                                            ? productMenu(
                                                productListmenu: menuResponse
                                                    .homeData.itemDtoList
                                                    .elementAt(0)
                                                    .itemList
                                                    .elementAt(0)
                                                    .productList[index],
                                                type: 1,
                                                productListMenu1: null,
                                              )
                                            : productMenu(
                                                type: 2,
                                                productListMenu1: catory
                                                    .homeData
                                                    .productList[index],
                                                productListmenu: null,
                                              )),
                                onEndOfPage: () => loadmore())),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: mautrang,
      elevation: 0,
      toolbarHeight: 50,
      title: Text(
        "Danh Mục",
        style: TextStyle(color: maucam),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: maucam,
          ),
          onPressed: () {},
        ),
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void loadmore() {
    getAPIMOre(OrderID,pageindexmore.toString());
  }
}
