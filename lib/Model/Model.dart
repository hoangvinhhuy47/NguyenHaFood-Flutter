import 'dart:convert';

import 'package:custom_dialog/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/API/addtocart_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/screens/ImfomationProduct/ImfomationProduct.dart';
import 'package:shop_app/screens/ViewCart/viewcart_acitivty.dart';
import 'package:shop_app/screens/home/components/DialogBuyProduct.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Dialog_buyproduct.dart';
import 'constants.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter/cupertino.dart';
class Model {
  static double showPriceSreen(double Price, double SalePrice) {
    if (Price == SalePrice) {
      return Price;
    } else {
      return SalePrice;
    }
  }

  static String showSalePriceSreen(double Price, double SalePrice) {
    if (Price == SalePrice) {
      return '';
    } else {
      return Price.toString() + ' ' + 'đ';
    }
  }

  static String showSpecialPriceScreen(
      double Price, double SalePrice, double SpecialPrice) {
    if (Price == SalePrice) {
      return null;
    } else {
      return '-' + SpecialPrice.toString() + '%';
    }
  }

  static DateTime coverStringToDate(String datetime) {
    if (datetime != null) {
      return DateTime.parse(datetime);
    } else {
      return null;
    }
  }

  static String coverDatetoString(DateTime date) {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy HH:mm");
    if (date != null) {
      return dateFormat.format(date);
    } else {
      return null;
    }
  }

  static String coverDatetoString1(DateTime date) {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    if (date != null) {
      return dateFormat.format(date);
    } else {
      return null;
    }
  }

  static void goToNewScreen(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static void goToDeTailProduct(BuildContext context, String IDProduct) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ImfomationProduct(
                IDProduct: IDProduct,
              )),
    );
  }

  static void showDialog(BuildContext context, String IDproduct, String name,
      String Price, String Image) {
    Size size = MediaQuery.of(context).size;
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: 'Dialog',
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 300),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: size.width,
            child: dialogbuyproduct(
              idProduct: IDproduct,
              nameProduct: name,
              Price: Price,
              Image: Image,
            ),
          ),
        );
      },
    );
  }


  static void addtocart(BuildContext context, String IDproduct, bool IsLogin,
      String Price, String SkuID, String nameProduct, String Image) async {
    AddToCartResponse response;
    if(goBal.CheckLogin==2) {
     response =
      await addToCardResponse(IDproduct, true, Price, SkuID);
    }
    else{
     response =
      await addToCardResponse(IDproduct, false, Price, SkuID);
    };
    if (response.statusId == 1) {
      showDialog(context, IDproduct, nameProduct, Price, Image);
    }
  }

  static Future<AddToCartResponse> addToCardResponse(
      String IDproduct, bool IsLogin, String Price, String SkuID) async {
    final URLAPI = Uri.parse(
        "https://demobanhang.softwareviet.com/api/Retail/AddToCart?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
    final response = await http.post(URLAPI,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "UserID": goBal.UserID,
          "IsLogin": IsLogin.toString(),
          "Price": Price,
          "Quantity": '1',
          "ProductID": IDproduct,
          "SkuID": SkuID,
        }));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
    return AddToCartResponse.fromJson(jsonDecode(response.body));
  }

  static String VATmethod(int status) {
    if (status != 1) {
      return "(Có Hóa Đơn)";
    } else {
      return "(Không Có Hóa Đơn)";
    }
  }

  static String ChangeStatusHTgiaohangOrder(int status) {
    if (status == 1) {
      return "Giao hàng tiêu chuẩn";
    } else if (status == 2) {
      return "Giao hàng nhanh";
    }
    return "Lỗi";
  }

  static String ChangePaymentOrder(int status) {
    if (status == 1) {
      return "Thanh toán bằng tiền mặt";
    } else if (status == 2) {
      return "Thanh toán bằng hình thức chuyển khoản";
    }
    return "Lỗi";
  }

  static String changeTypeOrder_button(int type) {
    if (type == 1) {
      return 'Hủy Đơn Hàng';
    } else if (type == 2) {
      return 'Tiếp Tục Mua Hàng';
    } else if (type == 3) {
      return 'Mua Lại';
    } else if (type == 4) {
      return 'Mua Lại';
    }
    return '';
  }

  static String changeTypeOrder(int type) {
    if (type == 1) {
      return 'Đang Xử Lí';
    }
    if (type == 2) {
      return 'Đang Vận Chuyển';
    }
    if (type == 3) {
      return 'Đã Hủy';
    }
    if (type == 4) {
      return 'Hoàn Thành';
    }
    return '';
  }

  // static Future<bool> buyProduct(BuildContext context,
  //     String IDproduct, bool IsLogin, String Price, String SkuID) async {
  //   AddToCartResponse response =
  //       await addtocart(context,IDproduct, IsLogin, Price, SkuID);
  //   if (response.statusId == 1) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
 static Widget dialog_erro(BuildContext context,String text) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
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
                      text,
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
                      color: mauvang,
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
                top: -50,
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 40,
                  child: Icon(
                    Icons.warning_amber_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                )),
          ],
        ));
  }
 static void launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  static void backsrceen(BuildContext context) {
    Navigator.pop(context);
  }


}
