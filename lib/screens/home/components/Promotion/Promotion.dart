import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/API/home_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';

import '../../../../Model/constants.dart';
import 'package:shop_app/Model/Model.dart';

class PromotionHome extends StatelessWidget {
  final ItemListElement product;

  const PromotionHome({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        padding: const EdgeInsets.only(right: 1, left: 1, top: 2, bottom: 1),
        child: Card(
          child: Container(
            height: 180,
            width: (2.5*size.width)/3,
            color: mautrang,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: (){
                      Model.goToDeTailProduct(context, product.itemId);
                    },
                    child: Container(
                      width: (2.5*size.width)/3,
                      height: 100,
                      child: Stack(alignment: Alignment.bottomLeft, children: [
                        Container(
                          width: (2.5*size.width)/3,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              goBal.URL_image+product.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          child:
                          Model.showSpecialPriceScreen(product.price, product.salePrice, product.specialPrice)!=null?
                          Container(
                            width: 50,
                            height: 25,
                            color: maudo,
                            alignment: Alignment.center,
                            child:
                            Text(' -${product.specialPrice}%',style: TextStyle(color: mautrang),),
                          ):Container(),
                        )
                      ]),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: (2*size.width)/3-50,
                              height: 30,
                              child: Text(
                                product.name,
                                style: TextStyle(
                                    color: mauden,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              width: (size.width)/3-80,
                              child: Row(
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    child: Image.asset(
                                      "assets/icons/iconstar.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    width: 13,
                                    height: 13,
                                    child: Text('5',
                                        style: TextStyle(
                                          color: mauden,
                                        )),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          width: (2.5*size.width)/3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${Model.showPriceSreen(product.price, product.salePrice)} đ",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: maudo,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "${Model.showSalePriceSreen(product.price, product.salePrice)} ",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: mauxam,
                                                fontWeight: FontWeight.w500,
                                                decoration:
                                                TextDecoration.lineThrough,
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ],),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                                child: Container(
                                    height: 45,
                                    width:50,
                                    color: mautrang,
                                    child: TextButton(
                                      onPressed: () {
                                        Model.addtocart(context,product.itemId, true, product.price.toString(), product.skuId,product.name,product.image);},
                                      child: Image.asset(
                                        'assets/icons/cartview.png',
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              )
                            ],
                          ),
                        )
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
}
