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

class item_product_createOrder extends StatefulWidget {
  const item_product_createOrder({Key key, this.product}) : super(key: key);

  State<item_product_createOrder> createState() => _item_product_createOrder();
  final HomeDatum product;

}

class _item_product_createOrder extends State<item_product_createOrder> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 120,
            width: size.width-100,
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
                  width: (3 * size.width - 100) / 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: (3 * size.width - 50) / 4 - 30,
                                padding: EdgeInsets.only(right: 50),
                                child: Text(
                                  '${widget.product.itemName}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          )),
                      header2(context),

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
      width: size.width-100,
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


  Widget header4(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomCenter,
      height: 30,
      width: ((3 * size.width - 100) / 4),
      padding: EdgeInsets.only(left: 10),
      child: Text(
        'Thành Tiền:${widget.product.amount}đ',
        style:
        TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: mauden),
      ),
    );
  }
}
