import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/API/search_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';

import '../../Model/constants.dart';

class product_search extends StatefulWidget {
  const product_search({Key key, this.productList}) : super(key: key);

  State<product_search> createState() => _product_search();
  final ProductList productList;
}

class _product_search extends State<product_search> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.only(right: 1, left: 1, top: 1, bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 220,
              height: 120,
              child: TextButton(
                onPressed: () {
                  Model.goToDeTailProduct(context, widget.productList.itemId);
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
                          child: Image.network(
                              goBal.URL_image + widget.productList.image,
                              fit: BoxFit.cover),
                        ),
                        ClipRRect(
                          borderRadius:
                              BorderRadius.horizontal(left: Radius.circular(5)),
                          child: Model.showSpecialPriceScreen(
                                      widget.productList.price,
                                      widget.productList.salePrice,
                                      widget.productList.specialPrice) ==
                                  null
                              ? Container()
                              : Container(
                                  height: 25,
                                  width: 40,
                                  color: maudo,
                                  alignment: Alignment.center,
                                  child: Text(
                                    ' -${widget.productList.specialPrice.toString()}%',
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
                          width: 120,
                          child: Text(widget.productList.name,
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
                          child: Text('${widget.productList.reviewValue}',
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
                          "${Model.showPriceSreen(widget.productList.price, widget.productList.salePrice)} đ",
                          style: TextStyle(fontSize: 12, color: maudo),
                        ),
                        Text(
                          "${Model.showSalePriceSreen(widget.productList.price, widget.productList.salePrice)} ",
                          style: TextStyle(
                            fontSize: 12,
                            color: mauxam,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          child: TextButton(
                            onPressed: () {
                              Model.addtocart(
                                  context,widget.productList.itemId,
                                  true,
                                  widget.productList.price.toString(),
                                  widget.productList.skuId,  widget.productList.name,  widget.productList.image);
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
