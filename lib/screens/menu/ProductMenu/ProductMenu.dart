import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shop_app/API/getProductByCatory_Menu.dart';
import 'package:shop_app/API/menu_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/Model/constants.dart';

class productMenu extends StatefulWidget {
  const productMenu(
      {Key key, this.productListmenu, this.productListMenu1, this.type})
      : super(key: key);

  State<productMenu> createState() => _productMenu();
  final ProductList productListmenu;
  final ProductListMenu productListMenu1;
  final int type;
}

class _productMenu extends State<productMenu> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (widget.type == 1) {
      return Container(
        child: Container(
          child: Card(
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: 150,
                      width: 90,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            height: 150,
                            width: 90,
                            child: Image.network(
                              goBal.URL_image + widget.productListmenu.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Model.showSpecialPriceScreen(
                                      widget.productListmenu.price,
                                      widget.productListmenu.salePrice,
                                      widget.productListmenu.specialPrice) !=
                                  null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(5)),
                                  child: Container(
                                    height: 20,
                                    width: 30,
                                    color: maudo,
                                    alignment: Alignment.center,
                                    child: Text(
                                      '-${widget.productListmenu.specialPrice} %',
                                      style: TextStyle(
                                          color: mautrang,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      Model.goToDeTailProduct(
                          context, widget.productListmenu.itemId);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 30,
                            width: 130,
                            child: Text(
                              '${widget.productListmenu.name}',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: mauden,
                                  fontWeight: FontWeight.w400),
                            )),
                        Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 8),
                            child: Row(
                              children: [
                                Text(
                                  '${widget.productListmenu.salePrice}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: maudo,
                                      fontWeight: FontWeight.w400),
                                ),
                                Model.showSalePriceSreen(
                                            widget.productListmenu.price,
                                            widget.productListmenu.salePrice) !=
                                        ''
                                    ? Text(
                                        "${Model.showSalePriceSreen(widget.productListmenu.price, widget.productListmenu.salePrice)} ",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: mauxam,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      )
                                    : Text(''),
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Giao Hàng Nhanh 3h',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: mauxanh,
                                  fontWeight: FontWeight.w400),
                            )),
                        Container(
                          height: 20,
                          width: 120,
                          child: RatingBar.builder(
                            initialRating: widget.productListmenu.reviewValue,
                            minRating: 1,
                            itemSize: 15,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 120,
                          child: Card(
                            child: TextButton(
                              onPressed: () {
                                Model.addtocart(
                                    context,widget.productListmenu.itemId,
                                    true,
                                    widget.productListmenu.price.toString(),
                                    widget.productListmenu.skuId,widget.productListmenu.name,widget.productListmenu.image);
                              },
                              child: Text(
                                'Thêm Giỏ Hàng',
                                style: TextStyle(fontSize: 12, color: maucam),
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      );
    } else {
      return Container(
        child: Container(
          child: Card(
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: 150,
                      width: 90,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            height: 150,
                            width: 90,
                            child: Image.network(
                              goBal.URL_image + widget.productListMenu1.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Model.showSpecialPriceScreen(
                                      widget.productListMenu1.price,
                                      widget.productListMenu1.salePrice,
                                      widget.productListMenu1.specialPrice) !=
                                  null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(5)),
                                  child: Container(
                                    height: 20,
                                    width: 30,
                                    color: maudo,
                                    alignment: Alignment.center,
                                    child: Text(
                                      '-${widget.productListMenu1.specialPrice} %',
                                      style: TextStyle(
                                          color: mautrang,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      Model.goToDeTailProduct(
                          context, widget.productListMenu1.itemId);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 30,
                            width: 130,
                            child: Text(
                              '${widget.productListMenu1.name}',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: mauden,
                                  fontWeight: FontWeight.w400),
                            )),
                        Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 8),
                            child: Row(
                              children: [
                                Text(
                                  '${widget.productListMenu1.salePrice}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: maudo,
                                      fontWeight: FontWeight.w400),
                                ),
                                Model.showSalePriceSreen(
                                            widget.productListMenu1.price,
                                            widget
                                                .productListMenu1.salePrice) !=
                                        ''
                                    ? Text(
                                        "${Model.showSalePriceSreen(widget.productListMenu1.price, widget.productListMenu1.salePrice)} ",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: mauxam,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      )
                                    : Text(''),
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Giao Hàng Nhanh 3h',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: mauxanh,
                                  fontWeight: FontWeight.w400),
                            )),
                        Container(
                          height: 20,
                          width: 120,
                          child: RatingBar.builder(
                            initialRating: widget.productListMenu1.reviewValue,
                            minRating: 1,
                            itemSize: 15,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 120,
                          child: Card(
                            child: TextButton(
                              onPressed: () {
                                Model.addtocart(
                                    context,widget.productListMenu1.itemId,
                                    true,
                                    widget.productListMenu1.price.toString(),
                                    widget.productListMenu1.skuId,widget.productListMenu1.name,widget.productListMenu1.image);
                              },
                              child: Text(
                                'Thêm Giỏ Hàng',
                                style: TextStyle(fontSize: 12, color: maucam),
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      );
    }
  }
}
