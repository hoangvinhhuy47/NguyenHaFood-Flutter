import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/screens/ViewCart/viewcart_acitivty.dart';

import 'constants.dart';

class dialogbuyproduct extends StatefulWidget{
  const dialogbuyproduct({Key key, this.idProduct, this.nameProduct, this.Price, this.Image}) : super(key: key);

  State<dialogbuyproduct> createState()=>_dialogbuyproduct();
  final String idProduct;
  final String nameProduct;
  final String Price;
  final String Image;
}
class _dialogbuyproduct extends State<dialogbuyproduct>{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          child: Card(
            child: Container(
              height: 250,
              width: size.width - 30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: size.width,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.center,
                              height: 50,
                              width: size.width - 50,
                              child: Text(
                                'Sản Phẩm của bạn đã được thêm vào giỏ hàng!',
                                style: TextStyle(
                                    color: maucam,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              )),
                          Container(
                              height: 30,
                              width: 30,
                              child: TextButton(
                                onPressed: () {
                                  Model.backsrceen(context);
                                },
                                child: Container(
                                  child: SvgPicture.asset(
                                    'assets/images/close_dialog.svg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: size.width - 20,
                    padding: EdgeInsets.only(right: 5),
                    height: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 150,
                          width: 120,
                          padding: EdgeInsets.only(left: 5),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child:Image.network(goBal.URL_image+widget.Image,fit: BoxFit.cover,)
                          ),
                        ),
                        Container(
                          height: 130,
                          width: size.width - 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 70,
                                width: size.width - 140,
                                alignment: Alignment.topCenter,
                                child: Text(
                                  '${widget.nameProduct}',
                                  style: TextStyle(
                                      color: mauden,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Text(
                                'Cung Cấp Bởi NguyenHaFood',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: maucam),
                              ),
                              Text(
                                'Giá: ${widget.Price}đ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: mauden),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: maucam,
                        height: 50,
                        padding: EdgeInsets.only(left: 30, right: 30),
                        width: size.width - 100,
                        child: TextButton(
                            onPressed: () {
                              Model.goToNewScreen(context, viewcart_activity());

                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/cart.svg',
                                  color: mautrang,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'Xem Giỏ Hàng',
                                  style: TextStyle(
                                      color: mautrang,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

}