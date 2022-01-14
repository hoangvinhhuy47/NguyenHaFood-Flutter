import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/API/ViewCart/createOrderRequest.dart';
import 'package:shop_app/API/ViewCart/createOrder_response.dart';
import 'package:shop_app/API/ViewCart/getcart_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/Model/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/screens/Loading_Activity.dart';
import 'package:shop_app/screens/ViewCart/Oder/momo_activity.dart';
import 'package:shop_app/screens/ViewCart/itemproduct_createOrder.dart';
import 'package:shop_app/screens/ViewCart/settingcart_activity.dart';
import 'package:shop_app/screens/ViewCart/viewcart_acitivty.dart';
import 'package:shop_app/screens/main_activity.dart';
import 'package:uuid/uuid.dart';


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
Future<CreateOrderResponse> CreateOrder(CreateOrderRequest createOrderRequest) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/CreateOrder?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(createOrderRequest));

  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return CreateOrderResponse.fromJson(jsonDecode(response.body));
}

class createorder_activity extends StatefulWidget {
  State<createorder_activity> createState() => _createorder_activity();
}

class _createorder_activity extends State<createorder_activity> {
  GetCartResponse response;
  int show = 2;
  CreateOrderResponse createOrderResponse;

  OrderDetailList orderDetailList;
  List<OrderDetailList> lst_oderdetail = new List<OrderDetailList>();
  void getCart() async {
    if (show == 2) {
      response = await GetCart();
      if (response.statusId == 1) {
        setState(() {
          show = 1;
        });
      }
    }
  }
  void createOrder(CreateOrderRequest createOrderRequest) async{
    createOrderResponse = await CreateOrder(createOrderRequest);
    if(createOrderResponse.statusId==1){
    print('Ok');
    }
  }
  @override
  Widget build(BuildContext context) {
    getCart();
    Size size = MediaQuery.of(context).size;
    return show == 1
        ? Scaffold(
            bottomSheet: bottomsheet(context),
            body: Container(
              width: size.width,
              height: size.height - 130,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appbar(context),
                    SizedBox(height: 10),
                    header1(context),
                    SizedBox(
                      height: 10,
                    ),
                    header2(context),
                    SizedBox(
                      height: 10,
                    ),
                    header3(context),
                    SizedBox(
                      height: 10,
                    ),
                    header4(context),
                    SizedBox(
                      height: 10,
                    ),
                    header5(context)
                  ],
                ),
              ),
            ),
          )
        : LoadingListPage();
  }

  Widget header1(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int hegiht = response.homeData.length!=1?140*response.homeData.length:167*response.homeData.length;
    return Container(
      width: size.width - 5,
      height: double.parse(hegiht.toString()),
      padding: EdgeInsets.only(left: 5, right: 5),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thông Tin Kiện Hàng',
                  style: TextStyle(
                      color: mauden, fontSize: 16, fontWeight: FontWeight.w400),
                ),
                TextButton(
                    onPressed: () {
                      Model.goToNewScreen(context, viewcart_activity());
                    },
                    child: Text(
                      'Thay đổi',
                      style: TextStyle(
                          color: mauxanh,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )),
              ],
            ),
          ),
          Container(
              child: GridView.builder(
                  shrinkWrap: true,
                  primary: true,
                  scrollDirection: Axis.vertical,
                  itemCount: response.homeData.length,
                  // physics: ScrollPhysics(),
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 3.3,
                  ),
                  itemBuilder: (context, index) => item_product_createOrder(
                        product: response.homeData[index],
                      ))),
        ],
      ),
    );
  }

  Widget header2(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width - 5,
      height: 150,
      padding: EdgeInsets.only(left: 5, right: 5),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thông Tin Khuyến Mãi',
                  style: TextStyle(
                      color: mauden, fontSize: 16, fontWeight: FontWeight.w400),
                ),
                TextButton(
                    onPressed: () {
                      Model.goToNewScreen(context, viewcart_activity());

                    },
                    child: Text(
                      'Thay đổi',
                      style: TextStyle(
                          color: mauxanh,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Mã Khuyến Mãi',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mauden)),
                Text('${goBal.codePromotion}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: maudo)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Loại Khuyến Mãi:',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mauden)),
                Text('${goBal.titilePromotion}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: maudo,
                        decoration: TextDecoration.underline)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tạm Tính:',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mauden)),
                Text('- ${goBal.pricePromotion}đ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: maudo,
                        decoration: TextDecoration.underline)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget header3(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width - 5,
      height: 300,
      padding: EdgeInsets.only(left: 5, right: 5),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thông Tin Giao Hàng',
                  style: TextStyle(
                      color: mauden, fontSize: 16, fontWeight: FontWeight.w400),
                ),
                TextButton(
                    onPressed: () {
                      Model.goToNewScreen(context, setttingcart());
                    },
                    child: Text(
                      'Thay đổi',
                      style: TextStyle(
                          color: mauxanh,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Địa Chỉ Của Bạn',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mauden)),
              ],
            ),
          ),
          Container(
            width: size.width - 20,
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: size.width - 40,
                    child: Text('${goBal.adressUser}',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: mauden))),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hình Thức Giao Hàng',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mauden)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('+ Giao Hàng Tiêu Chuẩn',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: mauxanh)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(goBal.typeshipAdress==1?'+Giao Hàng Tiêu Chuẩn':'+Giao Hàng Nhanh',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mauden)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(goBal.typepayment==1?'+ Thanh Toán Bằng Tiền Mặt':goBal.typepayment==2?'+ Thanh Toán Bằng ATM':goBal.typepayment==3?'+ Thanh Toán Bằng Momo':'',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: mauxanh)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget header4(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width - 5,
      height: 100,
      padding: EdgeInsets.only(left: 5, right: 5),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thông Tin Hóa Đơn Điện Tử',
                  style: TextStyle(
                      color: mauden, fontSize: 16, fontWeight: FontWeight.w400),
                ),
                TextButton(
                    onPressed: () {
                      Model.goToNewScreen(context, setttingcart());
                    },
                    child: Text(
                      'Thay đổi',
                      style: TextStyle(
                          color: mauxanh,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(goBal.checkHDTT==1?'+ Bạn Chưa Thêm Hóa Đơn Nào':'Bạn Đã Thêm Hóa Đơn',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: maucam)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget header5(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width - 5,
      height: 100,
      padding: EdgeInsets.only(left: 5, right: 5),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ghi Chú',
                  style: TextStyle(
                      color: mauden, fontSize: 16, fontWeight: FontWeight.w400),
                ),
                TextButton(
                    onPressed: () {
                      Model.goToNewScreen(context, setttingcart());
                    },
                    child: Text(
                      'Thay đổi',
                      style: TextStyle(
                          color: mauxanh,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(goBal.noteOrder,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: mauden)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget appbar(BuildContext context) {
    return AppBar(
      backgroundColor: maucam,
      elevation: 0,
      title: Text(
        "Kiểm Tra Đơn Hàng",
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
                  Text(
                    '${goBal.TotalAmountCart}đ',
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
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return dialog_BuyProdcut(context);
                          });
                    },
                    child: Card(
                      child: Container(
                        height: 50,
                        color: maucam,
                        width: (size.width - 80),
                        alignment: Alignment.center,
                        child: Text(
                          'Tạo Đơn Hàng',
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

  Widget dialog_BuyProdcut(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text(
                      'Thông Báo',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Bạn Đã Kiểm Tra Đúng Thông Tin Chưa?',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RaisedButton(
                      onPressed: () {
                        var IDoder = Uuid().v1();
                        ///request order
                        CreateOrderRequest _createOrderRequest = new CreateOrderRequest();
                        _createOrderRequest.promotionCode=goBal.codePromotion;
                        _createOrderRequest.order =new Order();
                        _createOrderRequest.orderDetailList = new List<OrderDetailList>();
                        ///oder
                        _createOrderRequest.order.customerID=goBal.UserID;
                        _createOrderRequest.order.customerName=goBal.UserName;
                        _createOrderRequest.order.customerPhone=goBal.userCellPhone;
                        _createOrderRequest.order.orderCode='';
                        _createOrderRequest.order.orderID=IDoder.toString();
                        _createOrderRequest.order.paymentMethodID=goBal.typepayment;
                        _createOrderRequest.order.taxCode=goBal.taxCode;
                        _createOrderRequest.order.taxCompanyAddress=goBal.TaxCompanyAddress;
                        _createOrderRequest.order.taxCompanyEmail=goBal.TaxCompanyEmail;
                        _createOrderRequest.order.taxCompanyName=goBal.TaxCompanyName;
                        _createOrderRequest.order.transportTypeID=goBal.typepayment;
                        _createOrderRequest.order.taxNotes=goBal.TaxNotes;
                        _createOrderRequest.order.vATMethodID=goBal.checkHDTT;
                        _createOrderRequest.order.notes=goBal.noteOrder;
                        _createOrderRequest.order.shipAddress=goBal.adressUser;

                        ///orderDetail

                        lst_oderdetail = new List<OrderDetailList>();
                        for (int i =0;i< response.homeData.length;i++){
                          orderDetailList = new OrderDetailList();
                          orderDetailList.itemName=response.homeData.elementAt(i).itemName;
                          orderDetailList.itemID=response.homeData.elementAt(i).itemId;
                          orderDetailList.quantity=response.homeData.elementAt(i).quantity;
                          orderDetailList.code=response.homeData.elementAt(i).code;
                          orderDetailList.cartID=response.homeData.elementAt(i).cartId;
                          orderDetailList.detailID=response.homeData.elementAt(i).detailId;
                          orderDetailList.price=response.homeData.elementAt(i).price;
                          orderDetailList.specialPrice=response.homeData.elementAt(i).specialPrice;
                          orderDetailList.skuProductID=response.homeData.elementAt(i).skuProductId;
                          orderDetailList.orgPrice=response.homeData.elementAt(i).orgPrice;
                          orderDetailList.amount=response.homeData.elementAt(i).amount;
                          orderDetailList.skuID=response.homeData.elementAt(i).skuId;
                          orderDetailList.skuProductCode=response.homeData.elementAt(i).skuProductCode;
                          orderDetailList.skuProductID=response.homeData.elementAt(i).skuProductId;
                          orderDetailList.skuProductName=response.homeData.elementAt(i).skuProductName;
                          orderDetailList.skuProductPrice=response.homeData.elementAt(i).skuProductPrice;
                          orderDetailList.skuSortOrder=response.homeData.elementAt(i).skuSortOrder;
                          orderDetailList.userName=response.homeData.elementAt(i).userName;
                          orderDetailList.totalAmount=response.homeData.elementAt(i).totalAmount;
                          orderDetailList.siteID=response.homeData.elementAt(i).siteId;
                          orderDetailList.storeID=response.homeData.elementAt(i).storeId;
                          orderDetailList.attributeID1=response.homeData.elementAt(i).attributeId1;
                          orderDetailList.attributeName1=response.homeData.elementAt(i).attributeName1;
                          orderDetailList.attributeID2=response.homeData.elementAt(i).attributeId2;
                          orderDetailList.attributeName2=response.homeData.elementAt(i).attributeName2;
                          orderDetailList.image=response.homeData.elementAt(i).image;
                          orderDetailList.cartType=response.homeData.elementAt(i).cartType;
                          lst_oderdetail.add(orderDetailList);
                        }
                        _createOrderRequest.orderDetailList.addAll(lst_oderdetail);
                     //  createOrder(_createOrderRequest);
                        goBal.OderID = _createOrderRequest.order.orderID;
                        if(goBal.typepayment==3){
                          Fluttertoast.showToast(msg: 'Hiện Tại Chữ Ký Số Chưa Hoàn Thiệc');
                          Model.goToNewScreen(context, momo_activity());
                        }
                        else{
                          Fluttertoast.showToast(msg: 'Tạo Đơn Hàng Thành Công');
                          Model.goToNewScreen(context, HomeScreen());
                        }

                        ///
                        // Navigator.of(context).pop();
                        // showDialog(
                        //     context: context,
                        //     builder: (BuildContext context) {
                        //     return   dialog_WaitingcreateOder(context);
                        //     });
                        // new Future.delayed(new Duration(seconds: 3), () {
                        //   Navigator.pop(context); //pop dialog
                        // });
                      },
                      color: maucam,
                      child: Text(
                        'Xác Nhận',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: maucam,
                  radius: 60,
                  child: Icon(
                    Icons.warning_amber_sharp,
                    color: Colors.white,
                    size: 40,
                  ),
                )),
          ],
        ));
  }

  Widget dialog_WaitingcreateOder(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 350,
        alignment: Alignment.center,
        child: Dialog(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                child: Center(
                  child: CircularProgressIndicator(
                    color: maucam,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("Đang Xử Lí...",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
            ],
          ),
        ),
      ),
    );
  }
  Widget dialog_acessfullOder(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text(
                      'Thông Báo',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Tạo Đơn Hàng Thành Công',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: maucam,
                      child: Text(
                        'Xác Nhận',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -40,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 50,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 40,
                  ),
                )),
          ],
        ));
  }

}
