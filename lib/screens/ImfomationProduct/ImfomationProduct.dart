import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/API/ProductDetail/writereview_request.dart';
import 'package:shop_app/API/ProductDetail/writereview_response.dart';
import 'package:shop_app/API/add_removeproduct_response.dart';
import 'package:shop_app/API/ProductDetail/imfomationproduct_response.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/screens/Loading_Activity.dart';
import 'package:shop_app/screens/ViewCart/viewcart_acitivty.dart';
import '../../Model/constants.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

import 'ProductRelationList.dart';
import 'SimilarProduct.dart';

Future<WriteReviewResponse> WriteReview(
    WriteReviewRequest reviewRequest) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/GetProductDetail?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(reviewRequest));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return WriteReviewResponse.fromJson(jsonDecode(response.body));
}

Future<GetProductDetailResponse> GetProductDetail(String IDProduct) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/GetProductDetail?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "UserID": goBal.UserID,
        "ProductID": IDProduct,
      }));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return GetProductDetailResponse.fromJson(jsonDecode(response.body));
}

Future<AddRemoveFavoriteResponse> AddRemoveFavorite(
    String IDProduct, String SkuID) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/AddRemoveFavorite?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "UserID": "e6e57e6a-98d9-497e-a15c-0675adc03007",
        "ProductID": IDProduct,
        "SkuID": SkuID,
      }));
  print('${IDProduct}');
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return AddRemoveFavoriteResponse.fromJson(jsonDecode(response.body));
}

class ImfomationProduct extends StatefulWidget {
  const ImfomationProduct({Key key, this.IDProduct}) : super(key: key);

  State<ImfomationProduct> createState() => _ImfomationProduct();
  final String IDProduct;
}

class _ImfomationProduct extends State<ImfomationProduct> {
  GetProductDetailResponse detailResponse;
  AddRemoveFavoriteResponse addRemoveFavoriteResponse;
  WriteReviewRequest reviewRequest;
  WriteReviewResponse reviewResponse;
  int getAPI = 1;
  int favorite = 1;
  int show = 1;

  double reviewValue = 1;
  String contentReview = 'Rất Hài Lòng';
  final review_title = TextEditingController();

  void _getAPI() async {
    try {
      detailResponse = await GetProductDetail(widget.IDProduct);

      if (detailResponse.statusId == 1) {
        if (detailResponse.homeData.webItem.isFavorite == true) {
          setState(() {
            favorite = 1;
          });
        } else {
          setState(() {
            favorite = 2;
          });
        }
        setState(() {
          getAPI = 2;
        });
      }
    }
    catch(e){
      detailResponse = await GetProductDetail(widget.IDProduct);

      if (detailResponse.statusId == 1) {
        if (detailResponse.homeData.webItem.isFavorite == true) {
          setState(() {
            favorite = 1;
          });
        } else {
          setState(() {
            favorite = 2;
          });
        }
        setState(() {
          getAPI = 2;
        });
      }
    }
  }

  void _writeReview(WriteReviewRequest reviewRequest) async {
    reviewResponse = await WriteReview(reviewRequest);
    if (reviewResponse.statusId == 1) {
      print('Thành Công');
    }
  }

  void _addremoveFavorite(String IDProduct, String SkuID) async {
    addRemoveFavoriteResponse = await AddRemoveFavorite(IDProduct, SkuID);
    if (addRemoveFavoriteResponse.statusId == 1) {
      setState(() {
        if (favorite == 1) {
          favorite = 2;
        } else {
          favorite = 1;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (getAPI == 1) {
      _getAPI();
      return LoadingListPage();
    } else {
      Size size = MediaQuery.of(context).size;
      return Scaffold(
          body: Scaffold(
        appBar: AppBar(
          backgroundColor: mautrang,
          toolbarHeight: 50,
          centerTitle: true,
          title: Text(
            'Chi Tiết Sản Phẩm',
            style: TextStyle(
                color: mauden, fontWeight: FontWeight.w500, fontSize: 16),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 40,
              height: 40,
              child: Card(
                child: TextButton(
                    onPressed: () {
                      Model.backsrceen(context);
                    },
                    child: Image.asset(
                      'assets/icons/back_imfo.png',
                      fit: BoxFit.cover,
                      color: mauden,
                    )),
              ),
            ),
          ),
          actions: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 60,
                height: 40,
                child: Card(
                  child: TextButton(
                      onPressed: () {
                        Model.goToNewScreen(context, viewcart_activity());
                      },
                      child: SvgPicture.asset(
                        'assets/icons/cart.svg',
                        fit: BoxFit.cover,
                        color: mauden,
                      )),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 60,
                height: 40,
                child: Card(
                  child: TextButton(
                      onPressed: () {},
                      child: Image.asset(
                        'assets/images/home1.png',
                        fit: BoxFit.cover,
                        color: mauden,
                      )),
                ),
              ),
            ),
          ],
        ),
        bottomSheet: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 0, right: 0),
          height: 55,
          color: mautrang,
          width: size.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Card(
              child: Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                color: mautrang,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        _addremoveFavorite(
                            detailResponse.homeData.webItem.itemId,
                            detailResponse.homeData.webItem.skuId);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        child: favorite == 2
                            ? Image.asset(
                                'assets/images/love.png',
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/images/addlove.png',
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 50,
                        width: size.width - 150,
                        color: maucam,
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Model.addtocart(
                                    context,
                                    detailResponse.homeData.webItem.itemId,
                                    true,
                                    detailResponse.homeData.webItem.price
                                        .toString(),
                                    detailResponse.homeData.webItem.skuId,
                                    detailResponse.homeData.webItem.name,
                                    detailResponse.homeData.webItem.image);
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                child: SvgPicture.asset(
                                  'assets/icons/cart.svg',
                                  fit: BoxFit.fill,
                                  color: mautrang,
                                ),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Model.addtocart(
                                      context,
                                      detailResponse.homeData.webItem.itemId,
                                      true,
                                      detailResponse.homeData.webItem.price
                                          .toString(),
                                      detailResponse.homeData.webItem.skuId,
                                      detailResponse.homeData.webItem.name,
                                      detailResponse.homeData.webItem.image);
                                },
                                child: Text(
                                  'Thêm Giỏ Hàng',
                                  style: TextStyle(
                                      color: mautrang,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Stack(
                    children: [
                      Container(
                        child: Container(
                          child: Container(
                            height: 200,
                            width: size.width - 10,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFFFFFFFF),
                                  Color(0xFF131313),
                                  Color(0xFFFFFFFF),
                                ],
                              ),
                            ),
                            child: Card(
                              child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Container(
                                      height: 350,
                                      width: size.width - 10,
                                      child: CarouselSlider.builder(
                                          itemCount: detailResponse
                                              .homeData.webItemPhotoList.length,
                                          itemBuilder: (BuildContext context,
                                                  int itemIndex,
                                                  int pageViewIndex) =>
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.network(
                                                  goBal.URL_image +
                                                      detailResponse.homeData
                                                          .webItemPhotoList
                                                          .elementAt(itemIndex)
                                                          .image,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                          options: CarouselOptions(
                                            autoPlay: true,
                                            autoPlayInterval:
                                                Duration(seconds: 3),
                                            autoPlayAnimationDuration:
                                                Duration(milliseconds: 2000),
                                            autoPlayCurve:
                                                Curves.fastLinearToSlowEaseIn,
                                            enlargeCenterPage: true,
                                            scrollDirection: Axis.horizontal,
                                            aspectRatio: 10 / 16,
                                            viewportFraction: 0.8,
                                            initialPage: 0,
                                            enableInfiniteScroll: true,
                                          )),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 180),
                        padding: EdgeInsets.only(
                          top: 10,
                          left: 5,
                          right: 5,
                        ),
                        decoration: BoxDecoration(
                            color: mautrang,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: mauxam,
                                spreadRadius: 1,
                                blurRadius: 1,
                              )
                            ]),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// card name
                            _cardname(size),

                            ///card sp tuoi song
                            _cardsptuoisong(size),

                            /// danh gia sao
                            _danhgiasao(size),

                            /// chi tiet sp
                            _chitietsp(size),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    }
  }

  Widget _cardname(
    Size size,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 150,
        width: size.width - 20,
        child: Card(
            child: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: maucam,
              spreadRadius: 3 / 4,
              blurRadius: 3 / 4,
            )
          ]),
          padding: EdgeInsets.only(left: 5, top: 5, right: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 330,
                height: 45,
                child: Text(
                  detailResponse.homeData.webItem.name,
                  style: TextStyle(
                      color: mauden, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 150,
                height: 20,
                child: RatingBar.builder(
                  initialRating: detailResponse.homeData.webItem.reviewValue,
                  minRating: 1,
                  itemSize: 15,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ignoreGestures: true,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ),
              Container(
                width: size.width - 50,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                          '${detailResponse.homeData.webItem.salePrice} đ',
                          style: TextStyle(
                              fontSize: 16,
                              color: maudo,
                              fontWeight: FontWeight.w700)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Model.showSpecialPriceScreen(
                                  detailResponse.homeData.webItem.price,
                                  detailResponse.homeData.webItem.salePrice,
                                  detailResponse
                                      .homeData.webItem.specialPrice) !=
                              null
                          ? Text('${detailResponse.homeData.webItem.price} đ',
                              style: TextStyle(
                                fontSize: 14,
                                color: mauxam,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.lineThrough,
                              ))
                          : Text(''),
                    ),
                    ClipRRect(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(20)),
                      child: Model.showSpecialPriceScreen(
                                  detailResponse.homeData.webItem.price,
                                  detailResponse.homeData.webItem.salePrice,
                                  detailResponse
                                      .homeData.webItem.specialPrice) !=
                              null
                          ? Container(
                              width: 50,
                              height: 25,
                              color: maudo,
                              alignment: Alignment.center,
                              child: Text(
                                '- ${detailResponse.homeData.webItem.specialPrice} %',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: mautrang,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 30,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/truck_imfo.gif',
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Giao Hàng Nhanh Trong 3h',
                        style: TextStyle(
                            color: mauxanh,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ))
            ],
          ),
        )),
      ),
    );
  }

  Widget _cardsptuoisong(Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 200,
        width: size.width - 20,
        child: Card(
            child: Container(
          padding: EdgeInsets.only(left: 5, top: 5, right: 2),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: maucam,
              spreadRadius: 3 / 4,
              blurRadius: 3 / 4,
            )
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 330,
                height: 45,
                child: Text(
                  'Sản phẩm tươi sống, trọng lượng thực tế chênh lệch  khoảng 10%',
                  style: TextStyle(
                      color: mauden, fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                width: 350,
                height: 100,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      alignment: Alignment.center,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 40,
                                width: 40,
                                child: Image.asset(
                                  'assets/icons/shieldcheck.png',
                                  fit: BoxFit.fill,
                                )),
                            Container(
                              width: 80,
                              alignment: Alignment.center,
                              child: Text(
                                'Bồi Thường 111% hàng giả',
                                style: TextStyle(
                                    color: mauden,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      alignment: Alignment.center,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 40,
                                width: 40,
                                child: Image.asset(
                                  'assets/images/buttonrebuy.png',
                                  fit: BoxFit.fill,
                                )),
                            Container(
                              width: 80,
                              alignment: Alignment.center,
                              child: Text(
                                'Kiểm tra hàng hóa trước khi nhận hàng',
                                style: TextStyle(
                                    color: mauden,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      alignment: Alignment.center,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 40,
                                width: 40,
                                child: Image.asset(
                                  'assets/icons/tra30ngay.png',
                                  fit: BoxFit.fill,
                                )),
                            Container(
                              width: 80,
                              alignment: Alignment.center,
                              child: Text(
                                'Đổi Trả Trong 30 ngày, nếu lỗi',
                                style: TextStyle(
                                    color: mauden,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget _danhgiasao(Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 250,
        width: size.width - 20,
        child: Card(
            child: Container(
          padding: EdgeInsets.only(left: 5, top: 5, right: 2),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: maucam,
              spreadRadius: 3 / 4,
              blurRadius: 3 / 4,
            )
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width - 20,
                height: 45,
                child: Text(
                  'Khách Hàng Nhận Xét',
                  style: TextStyle(
                      color: mauden, fontSize: 16, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: size.width - 20,
                height: 180,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Card(
                          child: Container(
                              height: 100,
                              width: 120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${detailResponse.homeData.webItem.reviewValue}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Container(
                                      height: 20,
                                      child: RatingBar.builder(
                                        initialRating: detailResponse
                                            .homeData.webItem.reviewValue,
                                        minRating: 1,
                                        itemSize: 15,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        ignoreGestures: true,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Container(
                                        height: 20,
                                        child: Text(
                                          '${detailResponse.homeData.webItem.reviewCount} nhận xét',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: mauden,
                                              fontWeight: FontWeight.w400),
                                        )),
                                  )
                                ],
                              )),
                        ),
                        Card(
                          child: Container(
                              height: 100,
                              width: size.width - 180,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ///review value
                                  Padding(
                                    padding: EdgeInsets.only(top: 2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: size.width - 210,
                                          height: 10,
                                          child: RatingBar.builder(
                                            initialRating: 5,
                                            minRating: 1,
                                            itemSize: 15,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            ignoreGestures: true,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                        ),
                                        Text(
                                          '5 ',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: mauden,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: size.width - 210,
                                          height: 10,
                                          child: RatingBar.builder(
                                            initialRating: 4,
                                            minRating: 1,
                                            ignoreGestures: true,
                                            itemSize: 15,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                        ),
                                        Text(
                                          '5 ',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: mauden,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: size.width - 210,
                                          height: 10,
                                          child: RatingBar.builder(
                                            initialRating: 3,
                                            minRating: 1,
                                            itemSize: 15,
                                            ignoreGestures: true,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                        ),
                                        Text(
                                          '5 ',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: mauden,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: size.width - 210,
                                          height: 10,
                                          child: RatingBar.builder(
                                            initialRating: 2,
                                            minRating: 1,
                                            ignoreGestures: true,
                                            itemSize: 15,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                        ),
                                        Text(
                                          '5 ',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: mauden,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: size.width - 210,
                                          height: 10,
                                          child: RatingBar.builder(
                                            initialRating: 1,
                                            minRating: 1,
                                            itemSize: 15,
                                            ignoreGestures: true,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                        ),
                                        Text(
                                          '5 ',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: mauden,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        child: TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(32.0))),
                                    content: Container(
                                      width: 300.0,
                                      child: _dialogAddReView(size),
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: 20,
                            width: size.width - 80,
                            child: Text(
                              'Viết Nhận Xét',
                              style: TextStyle(
                                  color: maucam,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget _chitietsp(Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: size.width - 20,
        padding: const EdgeInsets.only(bottom: 50),
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width - 20,
                height: 50,
                child: Row(
                  children: [
                    Card(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            show = 1;
                          });
                        },
                        child: Container(
                          width: (size.width - 80) / 2,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            'Thông Tin Sản Phẩm',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            show = 2;
                          });
                        },
                        child: Container(
                          width: (size.width - 80) / 2,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            'Sản Phẩm Tương Tự',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              _ttchitietsp(size)
            ],
          ),
        ),
      ),
    );
  }

  Widget _ttchitietsp(Size size) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Container(
          alignment: Alignment.topLeft,
          child: show == 1
              ? Container(
                  child: Html(
                  data: detailResponse.homeData.webItem.description,
                ))
              : Column(
                  children: [
                    Container(
                      child:
                          detailResponse.homeData.productRelationList.length !=
                                  0
                              ? _sptuongtu(size)
                              : Container(),
                    ),
                    Container(
                      child: detailResponse.homeData.webItemRelation.length != 0
                          ? _spmuakem(size)
                          : Container(),
                    )
                  ],
                )),
    );
  }

  Widget _spmuakem(Size size) {
    return Container(
      child: detailResponse.homeData.webItemRelation != null
          ? Container(
              width: size.width - 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sản Phẩm Mua Kèm',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: mauden)),
                  Container(
                    height: 250,
                    child: GridView.builder(
                        itemCount:
                            detailResponse.homeData.webItemRelation.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                          childAspectRatio: 1.3,
                        ),
                        itemBuilder: (context, index) => similarProduct(
                              product: detailResponse
                                  .homeData.webItemRelation[index],
                            )),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }

  Widget _sptuongtu(Size size) {
    return Container(
      child: detailResponse.homeData.webItemRelation != null
          ? Container(
              width: size.width - 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sản Phẩm Tương Tự',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: mauden)),
                  Container(
                    height: 250,
                    child: GridView.builder(
                        itemCount:
                            detailResponse.homeData.webItemRelation.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                          childAspectRatio: 1.3,
                        ),
                        itemBuilder: (context, index) => productRelationList(
                              product: detailResponse
                                  .homeData.productRelationList[index],
                            )),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }

  Widget _dialogAddReView(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Đánh Giá",
              style: TextStyle(fontSize: 18.0),
            ),
            Container(
              height: 25,
              child: RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                itemSize: 20,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  if (rating == 1) {
                    setState(() {
                      contentReview = 'Rất Không Hài Lòng';
                      reviewValue = rating;
                    });
                  }
                  if (rating == 2) {
                    setState(() {
                      contentReview = 'Không Hài Lòng';
                      reviewValue = rating;
                    });
                  }
                  if (rating == 3) {
                    setState(() {
                      contentReview = 'Bình Thường';
                      reviewValue = rating;
                    });
                  }
                  if (rating == 4) {
                    setState(() {
                      contentReview = 'Hài Lòng';
                      reviewValue = rating;
                    });
                  }
                  if (rating == 5) {
                    setState(() {
                      contentReview = 'Rất Hài Lòng';
                      reviewValue = rating;
                    });
                  }
                },
              ),
            ),
          ],
        ),
        Container(
            width: size.width - 50,
            height: 40,
            alignment: Alignment.center,
            child: Text(
              contentReview,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            )),
        SizedBox(
          height: 5.0,
        ),
        Divider(
          color: Colors.grey,
          height: 4.0,
        ),
        Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          child: TextField(
            controller: review_title,
            decoration: InputDecoration(
              hintText: "Thêm Đánh Giá",
              border: InputBorder.none,
            ),
            maxLines: 8,
          ),
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
            decoration: BoxDecoration(
              color: maucam,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.0),
                  bottomRight: Radius.circular(32.0)),
            ),
            child: TextButton(
              onPressed: () {
                reviewRequest = new WriteReviewRequest();
                reviewRequest.review.custumerID = goBal.UserID;
                reviewRequest.review.reviewValue = reviewValue.toString();
                reviewRequest.review.reviewContent = contentReview;
                reviewRequest.review.reviewStatus = '1';
                reviewRequest.review.reviewTitle = review_title.text;
                reviewRequest.review.itemID =
                    detailResponse.homeData.webItem.itemId;
                _writeReview(reviewRequest);
              },
              child: Text(
                "Đánh Giá",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
