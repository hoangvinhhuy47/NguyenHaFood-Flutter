import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/API/ViewCart/addproductlater_response.dart';
import 'package:shop_app/API/ViewCart/getcart_response.dart';
import 'package:shop_app/API/ViewCart/removeproductoncart_response.dart';
import 'package:shop_app/API/ViewCart/updatequaliti_response.dart';
import 'package:shop_app/API/acount/getproductReview_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/Model/constants.dart';
import 'package:http/http.dart' as http;

Future<AddProductLaterBuyResponse> AddProductLater(
    String ID,String SkuID) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/AddProductLaterBuy?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "ProductID": ID,
        "SkuID":SkuID,
        "UserID":goBal.UserID,
      }));
  print('Response status: ${ID}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return AddProductLaterBuyResponse.fromJson(jsonDecode(response.body));
}

Future<RemoveProductOnCartResponse> RemoveProduct(
    String ID) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/RemoveProductOnCart?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "CartDetailID": ID,
      }));
  print('Response status: ${ID}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return RemoveProductOnCartResponse.fromJson(jsonDecode(response.body));
}


Future<UpdateQuanlitiCartResponse> UpdateQuanlitiCart(
    String ID, String Quanliti) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/UpdateQuantityToCart?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "CartDetailID": ID,
        "Quantity": Quanliti,
      }));
  print('Response status: ${ID}');
  print('Response body: ${Quanliti}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return UpdateQuanlitiCartResponse.fromJson(jsonDecode(response.body));
}

class itemcard_product extends StatefulWidget {
  const itemcard_product(
      {Key key,
      this.product,
      this.deleteProductInCart,
      this.flusQuanlitiProductInCart,
      this.refuserQuanlitiProductInCart,
      this.index,
      this.refu_deleteProductInCart})
      : super(key: key);

  State<itemcard_product> createState() => _itemcard_product();
  final HomeDatum product;
  final ValueChanged<int> deleteProductInCart;
  final ValueChanged<int> flusQuanlitiProductInCart;
  final ValueChanged<int> refuserQuanlitiProductInCart;
  final ValueChanged<int> refu_deleteProductInCart;
  final int index;
}

class _itemcard_product extends State<itemcard_product> {
  UpdateQuanlitiCartResponse quanlitiCartResponse;
  RemoveProductOnCartResponse removeProductOnCartResponse;
  AddProductLaterBuyResponse addProductLaterBuyResponse;


  void addproductLaterBuy(String ID,String SKUID,int Index) async{
    addProductLaterBuyResponse = await AddProductLater(ID,SKUID);
    if(addProductLaterBuyResponse.statusId==1){
      widget.deleteProductInCart(Index);
    }
  }


  void removeProductOnCart(String ID,int Index) async{
    removeProductOnCartResponse = await RemoveProduct(ID);
    if(removeProductOnCartResponse.statusId==1){
      widget.deleteProductInCart(Index);
    }
  }
  void UpdateQuanlitiy(String ID, String Quanliti, int index, int type) async {
    quanlitiCartResponse = await UpdateQuanlitiCart(ID, Quanliti);
    if (quanlitiCartResponse.statusId == 1) {
      if (type == 1) {
        widget.flusQuanlitiProductInCart(index);
      }
      else
        {
          widget.refuserQuanlitiProductInCart(index);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 120,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: (size.width - 10) / 4,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 120,
                        width: (size.width - 10) / 4,
                        child: Image.network(
                          goBal.URL_image + widget.product.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10)),
                          child: Model.showSpecialPriceScreen(
                                      widget.product.price,
                                      widget.product.orgPrice,
                                      widget.product.specialPrice) !=
                                  null
                              ? Container(
                                  height: 20,
                                  width: 30,
                                  color: maudo,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '-${widget.product.specialPrice}%',
                                    style: TextStyle(
                                        fontSize: 10, color: mautrang),
                                  ),
                                )
                              : Container())
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  width: (3 * size.width - 30) / 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: (3 * size.width - 30) / 4 - 30,
                                padding: EdgeInsets.only(right: 50),
                                child: Text(
                                  '${widget.product.itemName}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                color: maudo,
                                width: 30,
                                child: TextButton(
                                  onPressed: () {
                                    removeProductOnCart( widget.product.detailId.toString(),widget.index);
                                  },
                                  child: Image.asset(
                                    'assets/icons/exiit.png',
                                    fit: BoxFit.cover,
                                    color: mautrang,
                                  ),
                                ),
                              )
                            ],
                          )),
                      header2(context),
                      header3(context),
                      header4(context)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header2(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 20,
      width: size.width-20,
      padding: EdgeInsets.only(left: 10,right:10 ),
      child: Row(
        children: [
          Text(
            '${widget.product.price}đ',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: maudo),
          ),
          Model.showSpecialPriceScreen(widget.product.price,
                      widget.product.orgPrice, widget.product.specialPrice) !=
                  null
              ? Text(
                  '${widget.product.orgPrice}đ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: mauxam,
                      decoration: TextDecoration.lineThrough),
                )
              : Text('')
        ],
      ),
    );
  }

  Widget header3(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 30,
      width: (3 * size.width - 30) / 4,
      padding: EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: (3 * size.width - 30) / 4 - 100,
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
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
                  child: TextButton(
                    onPressed: () {
                      if (widget.product.quantity != 1) {
                        UpdateQuanlitiy(
                            widget.product.detailId.toString(),
                            (widget.product.quantity.ceil() - 1).toString(),
                            widget.index,
                            2);
                      } else {
                        removeProductOnCart( widget.product.detailId.toString(),widget.index);
                      }
                    },
                    child: Image.asset(
                      'assets/icons/minus.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text('${widget.product.quantity}'),
                ),
                Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
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
                  child: TextButton(
                    onPressed: () {
                      UpdateQuanlitiy(
                          widget.product.detailId.toString(),
                          (widget.product.quantity.ceil() + 1).toString(),
                          widget.index,
                          1);
                    },
                    child: Image.asset(
                      'assets/icons/plus.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 80,
            alignment: Alignment.center,
            child: TextButton(
                onPressed: () {
                  addproductLaterBuy( widget.product.itemId.toString(),widget.product.skuId,widget.index);
                },
                child: Text(
                  'Mua Sau',
                  style: TextStyle(
                      color: mauxanh,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )),
          )
        ],
      ),
    );
  }

  Widget header4(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomCenter,
      height: 30,
      width: ((3 * size.width - 30) / 4),
      padding: EdgeInsets.only(left: 10),
      child: Text(
        'Thành Tiền:${widget.product.amount}đ',
        style:
            TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: mauden),
      ),
    );
  }
}
