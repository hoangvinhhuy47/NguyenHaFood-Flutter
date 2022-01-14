import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shop_app/API/acount/getproducview_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/Model/constants.dart';

class item_product_view_acount extends StatefulWidget {
  const item_product_view_acount({Key key, this.product}) : super(key: key);

  State<item_product_view_acount> createState() => _item_product_view_acount();
  final ProductViewList product;
}

class _item_product_view_acount extends State<item_product_view_acount> {
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
                    width: (size.width - 20) / 3,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          height: 120,
                          width: (size.width - 20) / 3,
                          child: Image.network(
                            goBal.URL_image+widget.product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10)),
                            child:Model.showSpecialPriceScreen(widget.product.price, widget.product.salePrice, widget.product.specialPrice)!=null? Container(
                              height: 20,
                              width: 30,
                              color: maudo,
                              alignment: Alignment.center,
                              child: Text(
                                '-${widget.product.specialPrice}%',
                                style: TextStyle(fontSize: 10, color: mautrang),
                              ),
                            ):Container())
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Model.goToDeTailProduct(context,widget.product.itemId);
                    },
                    child: Container(
                      height: 120,
                      width: 2 * (size.width - 30) / 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 2 * (size.width - 20) / 3,
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.product.itemName,
                              style: TextStyle(
                                  color: mauden,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${widget.product.salePrice} đ',
                                style: TextStyle(
                                    color: maudo,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Model.showSpecialPriceScreen(widget.product.price, widget.product.salePrice, widget.product.specialPrice)!=null?Text(
                                '${widget.product.price} đ',
                                style: TextStyle(
                                    color: mauxam,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough),
                              ):Text(''),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 2 * (size.width - 10) / 3,
                            alignment: Alignment.bottomRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(onPressed: () {
                                  Model.goToDeTailProduct(context,widget.product.itemId);
                                }, child: Container(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset('assets/images/eyes.png',fit: BoxFit.cover,color: maucam,),
                                )),
                                TextButton(onPressed: () {
                                  Model.addtocart(context,widget.product.itemId,true,widget.product.salePrice.toString(),widget.product.skuId,widget.product.itemName,widget.product.image);
                                }, child: Container(
                                  height: 25,
                                  width: 25,
                                  child: Image.asset('assets/icons/cartview.png',fit: BoxFit.cover,color: maucam,),
                                ))
                              ],
                            ),
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

    );
  }
}
