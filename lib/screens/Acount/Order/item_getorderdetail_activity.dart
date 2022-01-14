import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/API/Order/getorder_response.dart';
import 'package:shop_app/API/Order/getorderdetail_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/constants.dart';

class item_getorderdetail extends StatefulWidget {
  const item_getorderdetail({Key key, this.orderList}) : super(key: key);

  State<item_getorderdetail> createState() => _item_getorderdetail();
  final DetailList orderList;
}

class _item_getorderdetail extends State<item_getorderdetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        child: Card(
      child: Container(
          width: size.width - 10,
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 100,
                  width: 2 * (size.width - 10) / 8,
                  child: Image.network(
                    goBal.URL_image + widget.orderList.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 6 * (size.width - 30) / 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      alignment:  Alignment.centerLeft,
                      child: Text('${widget.orderList.itemName}',style: TextStyle(color: mauden,fontSize: 16,fontWeight: FontWeight.w500),),
                    ),
                    Container(
                      height: 60,
                      alignment:  Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width-180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Số lượng: ${widget.orderList.quantity}',style: TextStyle(color: mauden,fontSize: 13,fontWeight: FontWeight.w300),),
                                Text('Giá: ${widget.orderList.salePrice}đ',style: TextStyle(color: mauden,fontSize: 13,fontWeight: FontWeight.w300),),
                              ],
                            ),
                          ),
                          Text('Thành Tiền: ${widget.orderList.amount}đ',style: TextStyle(color: maudo,fontSize: 16,fontWeight: FontWeight.w500),)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    ));
  }
}
