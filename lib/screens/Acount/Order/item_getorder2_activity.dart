import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/API/Order/getorder_response.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/Model/constants.dart';

import 'order_detail_activity.dart';

class item_getorder3_activity extends StatefulWidget {
  const item_getorder3_activity({Key key, this.orderList}) : super(key: key);

  State<item_getorder3_activity> createState() => _item_getorder3_acitivity();
  final OrderList orderList;
}

class _item_getorder3_acitivity extends State<item_getorder3_activity> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: 130,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Card(
            child: Container(
              height: 120,
              width: size.width,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: 15,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mã:${widget.orderList.orderCode}', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: mauden),),
                          Text('Ngày ${Model.coverDatetoString1(widget.orderList.createdDate)}', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: mauden),)
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: (){    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => oder_detail_activity(
                          OderID: widget.orderList.orderId,
                        )),
                      );},
                      child: Container(
                        height: 80,
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              child: Image.asset('assets/icons/location.png',fit: BoxFit.cover,),
                            ),
                            Container(
                              height: 60,
                              width: size.width-150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 20,
                                    child: Text('${widget.orderList.shipAddress}',style: TextStyle(color: mauden,fontSize: 14,fontWeight: FontWeight.w400),),
                                  ),
                                  Container(
                                    height: 20,
                                    child: Text('${widget.orderList.totalAmount}',style: TextStyle(color: maudo,fontSize: 14,fontWeight: FontWeight.w400),),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 60,
                              width: size.width-(size.width-150)-70,
                              alignment: Alignment.bottomRight,
                              child: Text('Đã Hủy',style: TextStyle(color: maudo,fontSize: 14,fontWeight: FontWeight.w400),),
                            )
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
      ),
    );
  }
}
