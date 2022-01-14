import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/API/home_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';

import '../../../../Model/constants.dart';
import 'package:shop_app/Model/Model.dart';

class ProductView_Home extends StatelessWidget {
  final FavoritelistElement product;

  const ProductView_Home({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Card(
      child: Container(
        padding: const EdgeInsets.only(right: 1, left: 1, top: 1, bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 2*size.width/3,
              height: 120,
              child: TextButton(
                onPressed: (){
                  Model.goToDeTailProduct(context, product.itemId);
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 2*size.width/3,
                              height: 120,
                              child: Image.network(goBal.URL_image + product.image,
                                  fit: BoxFit.cover),
                            ),
                            ClipRRect(
                              borderRadius:
                              BorderRadius.horizontal(left: Radius.circular(5)),
                              child: Model.showSpecialPriceScreen(product.price,
                                  product.salePrice, product.specialPrice) ==
                                  null
                                  ? Container()
                                  : Container(
                                height: 25,
                                width: 40,
                                color: maudo,
                                alignment: Alignment.center,
                                child: Text(
                                  ' -${product.specialPrice.toString()}%',
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: (2*size.width)/3-100,
                              child: Text(product.itemName,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: mauden,
                                    fontSize: 12,
                                  )),
                            ),
                            Container(
                              child: Row(
                                children: [
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
                                    child: Text('${product.reviewValue}',
                                        style: TextStyle(
                                          color: mauden,
                                        )),
                                  )
                                ],
                              ),
                            )
                            // Text("*${product.itemId}",
                            //     maxLines: 2, style: TextStyle(color: maucam)),
                          ],
                        )),
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 50,
                              width: (2*size.width)/3-100,
                              child: Row(
                                children: [
                                  Text(
                                    "${Model.showPriceSreen(product.price, product.salePrice)} đ",
                                    style: TextStyle(fontSize: 12, color: maudo),
                                  ),
                                  Text(
                                    "${Model.showSalePriceSreen(product.price, product.salePrice)} ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: mauxam,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              width: (1*size.width)/3-75,
                              child: TextButton(
                                onPressed: () {
                                  Model.addtocart(context,product.itemId, true, product.price.toString(), product.skuId,product.itemName,product.image);
                                },
                                child: Image.asset(
                                  'assets/icons/cartview.png',
                                  fit: BoxFit.fill,
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
