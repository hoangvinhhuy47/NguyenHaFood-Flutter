import 'dart:async';
import 'dart:convert';

import 'package:custom_dialog/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/API/home_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/Model/constants.dart';

import 'package:shop_app/API/GetAPI.dart';
import 'package:shop_app/screens/Acount/interested%20products/product_favorite_acount.dart';
import 'package:shop_app/screens/Acount/interested%20products/product_view_acount.dart';
import 'package:shop_app/screens/Loading_Activity.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/screens/ViewCart/viewcart_acitivty.dart';
import 'package:shop_app/screens/home/components/Promotion/ProductDTOHome.dart';
import 'package:shop_app/screens/home/components/Promotion/ProductFavorite.dart';
import 'package:shop_app/screens/home/components/Promotion/ProductView.dart';
import 'package:shop_app/screens/home/components/Promotion/Promotion.dart';
import 'DialogBuyProduct.dart';
import 'ProductHome/Home_Catory.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
Future<HomeResponse> GetHomeData() async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/GetHomeData?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "UserID": goBal.UserID,
        "PageIndex": "1",
      }));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return HomeResponse.fromJson(jsonDecode(response.body));
}

class HomeActivity extends StatefulWidget {
  const HomeActivity({key, this.update}) : super(key: key);

  @override
  State<HomeActivity> createState() => _HomeActivity();
  final ValueChanged<int> update;

}

class _HomeActivity extends State<HomeActivity> with AutomaticKeepAliveClientMixin {
  HomeResponse homeResponse;
  int update = 1;
  Timer timer;
  double a;


  @override
  bool get wantKeepAlive => true;

  void _getAPI() async {
    homeResponse = await GetHomeData();
    if (update == 1) {
      do {
        if (homeResponse.statusId == 1) {
          setState(() {
            a = double.parse(
                (homeResponse.homeData.itemDtoList.length * 700).toString());
            update = 2;
          });
          break;
        }
      } while (update == 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size size = MediaQuery.of(context).size;

    _getAPI();
    if (update == 1) {
      return Expanded(child: LoadingListPage());
    } else {
      return Scaffold(
        backgroundColor: mautrang,
          //    appBar: buildAppBar(context),
          body: SingleChildScrollView(
        child: Column(
          children: [
            // slide
            Container(
              child: Container(
                height: 400,
                child: Stack(
                  alignment: Alignment.topCenter,
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFFF6943E),
                            Color(0xFFF67A0E),
                            Color(0xFFF68828),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 50),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        child: Image.asset(
                                          'assets/images/logo.jpg',
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Nguyen Ha Food',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: mautrang),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(right: 5, top: 40),
                                child: Row(
                                  children: [
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
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: 2.5*size.width/3,
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 20),
                                  child: Text(
                                    " Địa Chỉ: 14/7bis kỳ đồng, phường 9 ,quận 3, TP.Hồ Chí Minh.",
                                    style: TextStyle(
                                        color: mautrang,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  )),
                              Container(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                    "   Website:  https://nguyenhafood.vn/",
                                    style: TextStyle(
                                        color: mautrang,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 60,
                      child: Container(
                        height: 150,
                        width:size.width - 30,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 5.5,
                                blurRadius: 5.5,
                              )
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(5),
                              right: Radius.circular(5)),
                          child: Container(
                            height: 150,
                            width: size.width-30,
                            child: CarouselSlider.builder(
                                itemCount: homeResponse
                                    .homeData.slideDetailList.length,
                                itemBuilder: (BuildContext context,
                                        int itemIndex, int pageViewIndex) =>
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        goBal.URL_image +
                                            homeResponse
                                                .homeData.slideDetailList
                                                .elementAt(itemIndex)
                                                .image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                options: CarouselOptions(
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 0.8,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Khuyến Mãi đặc biệt
            Card(
              child: Container(
                padding: EdgeInsets.only(top:20),
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: mauxam,
                        spreadRadius: 2,
                        blurRadius: 2,
                      )
                    ]),
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 220,
                      width: size.width,

                      child: GridView.builder(
                          shrinkWrap: true,
                          primary: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: homeResponse
                              .homeData.webItemPromotionDtoList
                              .elementAt(0)
                              .itemList
                              .length,
                          // physics: NeverScrollableScrollPhysics(),
                          // physics: ScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 3,
                            childAspectRatio: size.width/(size.width*1.28),
                          ),
                          itemBuilder: (context, index) => PromotionHome(
                                product: homeResponse
                                    .homeData.webItemPromotionDtoList
                                    .elementAt(0)
                                    .itemList[index],
                              )),
                    ),
                    Positioned(
                      bottom: 280,
                      child: Container(
                        height: 50,
                        width: size.width - 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: maucam,
                                spreadRadius: 2,
                                blurRadius: 2,
                              )
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(30),
                              right: Radius.circular(30)),
                          child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Khuyến Mãi Đặc Biệt',
                                    style: TextStyle(
                                        color: maudo,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  Container(
                                      height: 30,
                                      width: 30,
                                      child: Image.asset(
                                        'assets/images/sale.gif',
                                        fit: BoxFit.cover,
                                      )),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //sp yeu thich
           goBal.CheckLogin!=1&&homeResponse.homeData.favoritelist!=null?Container(
              height: 550,
              child: Card(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sản Phẩm Yêu Thích",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Model.goToNewScreen(context,product_favorite_acount());
                            },
                            child: Text(
                              "Xem Thêm",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: maucam,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      height: 450,
                      child: GridView.builder(
                          shrinkWrap: true,
                          primary: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: homeResponse.homeData.favoritelist.length,
                          // physics: NeverScrollableScrollPhysics(),
                          // physics: ScrollPhysics(),
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 3,
                            childAspectRatio: 1.1,
                          ),
                          itemBuilder: (context, index) => ProductFavorite_Home(
                            product:
                            homeResponse.homeData.favoritelist[index],
                          )),
                    ),
                  ],
                ),
              ),
            ):Container(),
            //sp da xem
            goBal.CheckLogin!=1&&homeResponse.homeData.productViewList!=null?Container(
              height: 545,
              child: Card(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(1),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sản Phẩm Đã Xem",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Model.goToNewScreen(context,product_view_acount());
                            },
                            child: Text(
                              "Xem Thêm",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: maucam,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      height: 445,
                      child: GridView.builder(
                          shrinkWrap: true,
                          primary: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              homeResponse.homeData.productViewList.length,
                          // physics: NeverScrollableScrollPhysics(),
                          // physics: ScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                            childAspectRatio: 1.1,
                          ),
                          itemBuilder: (context, index) => ProductView_Home(
                                product: homeResponse
                                    .homeData.productViewList[index],
                              )),
                    ),
                  ],
                ),
              ),
            ):Container(),
            //sp dto
            Container(

              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: GridView.builder(
                    shrinkWrap: true,
                    primary: true,
                    scrollDirection: Axis.vertical,
                    itemCount: homeResponse.homeData.itemDtoList.length,
                    physics: NeverScrollableScrollPhysics(),
                    // physics: ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 0.52,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 4.0,
                    ),
                    itemBuilder: (context, index) => CatoryActivity(
                          categories: homeResponse.homeData.itemDtoList[index],
                        )),
              ),
            ),
          ],
        ),
      ));
    }
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: maucam,
      elevation: 5,
      toolbarHeight: 60,
      title: Text(
        "Nguyen Ha Food",
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
            widget.update(1);
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

  void _goToNewScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GetAPI()),
    );
  }
}
