import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/API/ViewCart/getcart_response.dart';
import 'package:shop_app/API/ViewCart/getpromotion_resquest.dart';
import 'package:shop_app/API/ViewCart/getpromotioncode_response.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/Model/constants.dart';
import 'package:shop_app/screens/Acount/login_activtiy.dart';
import 'package:shop_app/screens/Loading_Activity.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/screens/ViewCart/settingcart_activity.dart';

import 'itemviewcart_activity.dart';
import 'package:http/http.dart' as http;

Future<GetPromotionCodeResponse> GetPromotionCode(
    GetPromotionCodeRequest codeRequest) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/GetPromotionCode?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(codeRequest));

  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return GetPromotionCodeResponse.fromJson(jsonDecode(response.body));
}

Future<GetCartResponse> GetCart() async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/GetCart?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "UserID": goBal.UserID,
        "PageIndex": "1",
      }));

  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return GetCartResponse.fromJson(jsonDecode(response.body));
}

class viewcart_activity extends StatefulWidget {
  State<viewcart_activity> createState() => _viewcart_activity();
}

class _viewcart_activity extends State<viewcart_activity> {
  GetCartResponse response;
  GetPromotionCodeResponse getPromotionCodeResponse;
  int show = 1;
  double totalAmountCart = 0;
  double totalAmountPromotion = 0;
  int showpromotion = 1;
  String text_typepromotion = '';
  String text_Pricepromotion = '';
  double pricePromotion = 0;
  GetPromotionCodeRequest request;
  List<OrderDetailList> lst_oderdetail1;
  List<dynamic> lst_promotionItemtype2 = new List<dynamic>();
  List<dynamic> lst_promotionItemtype3 = new List<dynamic>();
  final text_promotioncode = TextEditingController();

  void getAPI() async {
    if (show == 1) {
      response = await GetCart();
      if (response.statusId == 1) {
        if(response.homeData.length==0){
          setState(() {
            show=3;
          });
        }
        else {
          setState(() {
            show = 2;
            totalAmountCart = response.homeData
                .elementAt(0)
                .totalAmount;
          });
        }
      }
    }
  }

  void getAPIPromotioncode(
      String code, List<OrderDetailList> lst_oderdetail) async {
    request = new GetPromotionCodeRequest();
    request.promotionCode = code;
    request.orderDetailList = lst_oderdetail;
    getPromotionCodeResponse = await GetPromotionCode(request);

    if (getPromotionCodeResponse.statusId == 1 &&
        getPromotionCodeResponse.promotion.promotionType != 0) {
      if (getPromotionCodeResponse.promotion.promotionType == 1 &&
          getPromotionCodeResponse.promotion.promotion != null) {
        print('Giảm Giá Theo Hóa Đơn');
        print('${getPromotionCodeResponse.promotion}');
        setState(() {
          totalAmountPromotion = totalAmountCart -
              getPromotionCodeResponse.promotion.promotion.discountAmount;
          showpromotion = 2;
          text_typepromotion = 'Giảm Giá Theo Đơn Hàng';
          text_Pricepromotion = '- ' +
              getPromotionCodeResponse.promotion.promotion.discountAmount
                  .toString() +
              'đ';
        });
      } else if (getPromotionCodeResponse.promotion.promotionType == 2 ||
          getPromotionCodeResponse.promotion.promotionType == 3) {
        if (getPromotionCodeResponse.promotion.promotion != null) {
          print('Giảm Giá Theo Sản Phẩm');
          lst_promotionItemtype2 = new List<String>();
          for (int i = 0;
              i < getPromotionCodeResponse.promotion.promotionItems.length;
              i++) {
            for (int j = 0; j < response.homeData.length; j++) {
              if (getPromotionCodeResponse.promotion.promotionItems
                      .elementAt(i)
                      .productId ==
                  response.homeData.elementAt(j).skuProductId) {
                pricePromotion = pricePromotion +
                    getPromotionCodeResponse.promotion.promotionItems
                        .elementAt(i)
                        .discountamount;
                lst_promotionItemtype2.add(
                    response.homeData.elementAt(j).itemName +
                        '\n '
                            ' Giảm: -' +
                        getPromotionCodeResponse.promotion.promotionItems
                            .elementAt(i)
                            .discountamount
                            .toString() +
                        'đ' +
                        '/' +
                        getPromotionCodeResponse.promotion.promotionItems
                            .elementAt(i)
                            .quantity
                            .toString() +
                        'Sp');
              }
            }
          }
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Khuyến Mãi'),
                  content: dialog_Promotiontype2(),
                );
              });
          setState(() {
            totalAmountPromotion = totalAmountCart - pricePromotion;
            showpromotion = 2;
            text_typepromotion = 'Giảm Giá Theo Sản Phẩm';
            text_Pricepromotion = '- ' + pricePromotion.toString() + 'đ';
          });
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Model.dialog_erro(context, 'Mã Khuyến Mãi Không Hợp Lệ');
              });
        }
      } else if (getPromotionCodeResponse.promotion.promotionType == 4 &&
          getPromotionCodeResponse.promotion.promotionItemGifs != null) {
        print('Tặng Kèm Sp Theo Hóa đơn');
        print('${getPromotionCodeResponse.promotion}');
        lst_promotionItemtype3 = new List<dynamic>();
        for (int i = 0;
            i < getPromotionCodeResponse.promotion.promotionItemGifs.length;
            i++) {
          lst_promotionItemtype3.add('Tặng Kèm:' +
              getPromotionCodeResponse.promotion.promotionItemGifs
                  .elementAt(i)
                  .productName +
              '\n' +
              'SL:x' +
              getPromotionCodeResponse.promotion.promotionItemGifs
                  .elementAt(i)
                  .discountQuantity
                  .toString());
        }
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Khuyến Mãi'),
                content: dialog_Promotiontype6(),
              );
            });
        setState(() {
          totalAmountPromotion = totalAmountCart;
          showpromotion = 2;
          text_typepromotion = 'Tặng Sản Phẩm Theo Hóa Đơn';
          // text_Pricepromotion = '- ' +
          //     pricePromotion
          //         .toString() +
          //     'đ';
        });
      } else if (getPromotionCodeResponse.promotion.promotionType == 6 &&
          getPromotionCodeResponse.promotion.promotionItemGifs != null) {
        print('Tặng Kèm Sp Theo Sản Phẩm');
        print('${getPromotionCodeResponse.promotion}');
        lst_promotionItemtype3 = new List<dynamic>();
        for (int i = 0;
            i < getPromotionCodeResponse.promotion.promotionItemGifs.length;
            i++) {
          lst_promotionItemtype3.add('Tặng Kèm:' +
              getPromotionCodeResponse.promotion.promotionItemGifs
                  .elementAt(i)
                  .productName +
              '\n' +
              'SL:x' +
              getPromotionCodeResponse.promotion.promotionItemGifs
                  .elementAt(i)
                  .discountQuantity
                  .toString());
          break;
        }
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Khuyến Mãi'),
                content: dialog_Promotiontype6(),
              );
            });
        setState(() {
          totalAmountPromotion = totalAmountCart;
          showpromotion = 2;
          text_typepromotion = 'Tặng Sản Phẩm Theo Sản Phẩm';
          // text_Pricepromotion = '- ' +
          //     pricePromotion
          //         .toString() +
          //     'đ';
        });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Model.dialog_erro(context, 'Mã Khuyến Mãi Không Hợp Lệ');
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Model.dialog_erro(context, 'Mã Khuyến Mãi Không Hợp Lệ');
          });
    }
  }

  ///
  void refu_deleteProductInCart(int index) {
    setState(() {
      showpromotion = 1;
      totalAmountPromotion = 0;
      text_promotioncode.text = '';
      text_typepromotion = '';
      text_Pricepromotion = '';
      totalAmountCart =
          totalAmountCart - response.homeData.elementAt(index).price;
      response.homeData.removeAt(index);
    });
  }

  void deleteProductInCart(int index) {
    setState(() {
      showpromotion = 1;
      totalAmountPromotion = 0;
      text_promotioncode.text = '';
      text_typepromotion = '';
      text_Pricepromotion = '';
      totalAmountCart =
          totalAmountCart - response.homeData.elementAt(index).amount;
      response.homeData.removeAt(index);
    });
  }

  void flusQuanlitiProductInCart(int index) {
    setState(() {
      showpromotion = 1;
      totalAmountPromotion = 0;
      text_promotioncode.text = '';
      text_typepromotion = '';
      text_Pricepromotion = '';
      response.homeData.elementAt(index).quantity =
          response.homeData.elementAt(index).quantity + 1;
      response.homeData.elementAt(index).amount =
          response.homeData.elementAt(index).amount +
              response.homeData.elementAt(index).price;
      totalAmountCart =
          totalAmountCart + response.homeData.elementAt(index).price;
    });
  }

  void refuserQuanlitiProductInCart(int index) {
    setState(() {
      showpromotion = 1;
      totalAmountPromotion = 0;
      text_promotioncode.text = '';
      text_typepromotion = '';
      text_Pricepromotion = '';
      response.homeData.elementAt(index).quantity =
          response.homeData.elementAt(index).quantity - 1;
      response.homeData.elementAt(index).amount =
          response.homeData.elementAt(index).amount -
              response.homeData.elementAt(index).price;
      totalAmountCart =
          totalAmountCart - response.homeData.elementAt(index).price;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    getAPI();
    return show != 1
        ? Scaffold(
            bottomSheet: bottomsheet(context),
            body: Container(
              padding: EdgeInsets.only(bottom: 130),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appbar(context),
                    Container(
                      width: size.width,
                      height: 3,
                      color: maucam,
                    ),
                   show!=3?Container(
                        child: GridView.builder(
                            shrinkWrap: true,
                            primary: true,
                            scrollDirection: Axis.vertical,
                            itemCount: response.homeData.length,
                            physics: NeverScrollableScrollPhysics(),
                            // physics: ScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              crossAxisSpacing: 1,
                              childAspectRatio: 3,
                            ),
                            itemBuilder: (context, index) => itemcard_product(
                                  product: response.homeData[index],
                                  deleteProductInCart: deleteProductInCart,
                                  flusQuanlitiProductInCart:
                                      flusQuanlitiProductInCart,
                                  refuserQuanlitiProductInCart:
                                      refuserQuanlitiProductInCart,
                                  index: index,
                                  refu_deleteProductInCart:
                                      refu_deleteProductInCart,
                                ))):Container(),
                    Container(
                      width: size.width,
                      height: 3,
                      color: mauxam,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Headerpromotion(context),
                  ],
                ),
              ),
            ),
          )
        : LoadingListPage();
  }

  Widget Headerpromotion(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 200,
      width: size.width,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: mauden,
                  spreadRadius: 0.2,
                  blurRadius: 0.2,
                )
              ]),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  'Thêm Mã Giảm Giá',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500, color: mauden),
                ),
              ),
              Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: size.width - 20 - 100,
                        alignment: Alignment.centerLeft,
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
                        child: TextField(
                          controller: text_promotioncode,
                          keyboardType: TextInputType.text,
                          readOnly: showpromotion == 1 ? false : true,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 10.0),
                            prefixIcon: Icon(
                              Icons.notes,
                              color: Colors.black,
                            ),
                            hintText: 'Nhập Mã Giảm Giá',
                          ),
                        )),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 80,
                        height: 50,
                        color: showpromotion == 1 ? maucam : maudo,
                        alignment: Alignment.center,
                        child: TextButton(
                            onPressed: () {
                              if (showpromotion == 1) {
                                lst_oderdetail1 = List<OrderDetailList>();
                                for (int i = 0;
                                    i < response.homeData.length;
                                    i++) {
                                  OrderDetailList oderdetail =
                                      new OrderDetailList();
                                  oderdetail.quantity =
                                      response.homeData.elementAt(i).quantity;
                                  oderdetail.price =
                                      response.homeData.elementAt(i).price;
                                  oderdetail.amount =
                                      response.homeData.elementAt(i).amount;
                                  oderdetail.skuProductID = response.homeData
                                      .elementAt(i)
                                      .skuProductId;
                                  lst_oderdetail1.add(oderdetail);
                                }
                                getAPIPromotioncode(
                                    text_promotioncode.text, lst_oderdetail1);
                              } else {
                                ///
                                setState(() {
                                  showpromotion = 1;
                                  totalAmountPromotion = 0;
                                  text_promotioncode.text = '';
                                  text_typepromotion = '';
                                  text_Pricepromotion = '';
                                });
                              }
                            },
                            child: showpromotion == 1
                                ? Text(
                                    'Áp Dụng',
                                    style: TextStyle(
                                        color: mautrang,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )
                                : Text(
                                    'Hủy Bỏ',
                                    style: TextStyle(
                                        color: mautrang,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: size.width,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Loại Giảm Giá:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      text_typepromotion,
                      style: TextStyle(
                          fontSize: 14,
                          color: maudo,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ),
              Container(
                height: 40,
                width: size.width,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tạm Tính:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      text_Pricepromotion,
                      style: TextStyle(
                          fontSize: 14,
                          color: maudo,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget appbar(BuildContext context) {
    return AppBar(
      backgroundColor: maucam,
      elevation: 0,
      title: Text(
        "Giỏ Hàng",
        style: TextStyle(color: mautrang),
      ),
      centerTitle: true,
      actions: [
        Container(
          height: 40,
          width: 40,
          child: IconButton(
            icon: Image.asset(
              "assets/icons/exiit.png",
              // By default our  icon color is white
              color: mautrang,
            ),
            onPressed: () {
              Model.backsrceen(context);
            },
          ),
        ),
      ],
    );
  }

  Widget bottomsheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        height: 120,
        width: size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: maucam,
                spreadRadius: 0.2,
                blurRadius: 0.2,
              )
            ]),
        child: Column(
          children: [
            Container(
              height: 50,
              width: size.width - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tổng Tiền:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  showpromotion == 1
                      ? Text(
                          '${totalAmountCart}đ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: maudo),
                        )
                      : Text(
                          '${totalAmountPromotion}đ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: maudo),
                        ),
                ],
              ),
            ),
            Container(
              height: 60,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Model.backsrceen(context);
                    },
                    child: Card(
                      child: Container(
                        color: mautrang,
                        height: 50,
                        width: (size.width - 80) / 2,
                        alignment: Alignment.center,
                        child: Text(
                          'Trang Chủ',
                          style: TextStyle(
                              color: maucam,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  goBal.CheckLogin == 2
                      ? TextButton(
                          onPressed: () {
                            showpromotion == 1
                                ? goBal.TotalAmountCart = totalAmountCart
                                : goBal.TotalAmountCart = totalAmountPromotion;
                            showpromotion == 1
                                ? goBal.codePromotion = text_promotioncode.text
                                : goBal.codePromotion = '';
                            showpromotion == 1
                                ? goBal.titilePromotion = text_typepromotion
                                : goBal.titilePromotion = '';
                            showpromotion == 1
                                ? goBal.pricePromotion = pricePromotion.toString()
                                : goBal.pricePromotion = '';
                            Model.goToNewScreen(context, setttingcart());
                          },
                          child: Card(
                            child: Container(
                              height: 50,
                              color: maucam,
                              width: (size.width - 80) / 2,
                              alignment: Alignment.center,
                              child: Text(
                                'Đặt Hàng',
                                style: TextStyle(
                                    color: mautrang,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        )
                      : TextButton(
                          onPressed: () {
                            Model.goToNewScreen(context, login_activity());
                          },
                          child: Card(
                            child: Container(
                              height: 50,
                              color: maucam,
                              width: (size.width - 80) / 2,
                              alignment: Alignment.center,
                              child: Text(
                                'Đăng Nhập',
                                style: TextStyle(
                                    color: mautrang,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dialog_Promotiontype2() {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 2, // Change as per your requirement
      width: size.width - 20, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: lst_promotionItemtype2.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              index.toString() + '. ' + lst_promotionItemtype2.elementAt(index),
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            onTap: () {
              setState(() {});
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }

  Widget dialog_Promotiontype6() {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 2, // Change as per your requirement
      width: size.width - 20, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: lst_promotionItemtype3.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              index.toString() + '. ' + lst_promotionItemtype3.elementAt(index),
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            onTap: () {
              setState(() {});
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }
}
