import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/API/ProductDetail/imfomationproduct_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';

import '../../Model/constants.dart';
import 'ImfomationProduct.dart';

class productRelationList extends StatefulWidget {
  const productRelationList({Key key, this.product}) : super(key: key);

  State<productRelationList> createState() => _productRelationList();
  final WebItem product;
}

class _productRelationList extends State<productRelationList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 300,
        width: 350,
        padding: const EdgeInsets.only(right: 1, left: 1, top: 1, bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 240,
              height: 120,
              child: TextButton(
                onPressed: (){
                  Model.goToDeTailProduct(context, widget.product.itemId);
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 200,
                              height: 120,
                              child: Image.network(goBal.URL_image +widget.product.image,
                                  fit: BoxFit.cover),
                            ),
                            ClipRRect(
                              borderRadius:
                              BorderRadius.horizontal(left: Radius.circular(5)),
                              child: Model.showSpecialPriceScreen(widget.product.price,
                                  widget.product.salePrice, widget.product.specialPrice) ==
                                  null
                                  ? Container()
                                  : Container(
                                height: 25,
                                width: 40,
                                color: maudo,
                                alignment: Alignment.center,
                                child: Text(
                                  ' -${widget.product.specialPrice.toString()}%',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: mautrang,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          ],
                        ))),
              ),
              color: mautrang,
            ),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 150,
                              child: Text(widget.product.name,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: mauden,
                                    fontSize: 12,
                                  )),
                            ),
                            Container(
                              width: 13,
                              height: 13,
                              child: Image.asset(
                                "assets/icons/iconstar.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: 13,
                              height: 13,
                              child: Text('${widget.product.reviewValue}',
                                  style: TextStyle(
                                    color: mauden,
                                  )),
                            )
                            // Text("*${product.itemId}",
                            //     maxLines: 2, style: TextStyle(color: maucam)),
                          ],
                        )),
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "${Model.showPriceSreen(widget.product.price, widget.product.salePrice)} đ",
                              style: TextStyle(fontSize: 12, color: maudo),
                            ),
                            Text(
                              "${Model.showSalePriceSreen(widget.product.price, widget.product.salePrice)} ",
                              style: TextStyle(
                                fontSize: 12,
                                color: mauxam,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: TextButton(
                                onPressed: () {
                                  Model.addtocart(context,widget.product.itemId, true, widget.product.price.toString(), widget.product.skuId,widget.product.name,widget.product.image);

                                },
                                child: Image.asset(
                                  'assets/icons/cartview.png',
                                  fit: BoxFit.fitWidth,
                                  color: maucam,
                                  cacheHeight: 50,
                                  cacheWidth: 50,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}