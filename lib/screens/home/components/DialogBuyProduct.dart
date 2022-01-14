import 'package:flutter/cupertino.dart';
import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/material.dart';

class dialogBuyProduct extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 289.0, end: 0.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xfff5c68a)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 275.0, start: 57.0),
            Pin(size: 54.0, middle: 0.7454),
            child: Text(
              'Sản Phẩm Đã Được Thêm Vào \nGiỏ Hàng.',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: const Color(0xfffc840d),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 35.0, end: 12.0),
            Pin(size: 35.0, middle: 0.7295),
            child:
            // Adobe XD layer: 'exit_black' (shape)
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/icons/background_home.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 156.0, start: 12.0),
            Pin(size: 96.0, end: 96.0),
            child:
            // Adobe XD layer: 'seafood' (shape)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 231.0, end: 8.0),
            Pin(size: 21.0, middle: 0.7978),
            child: Text(
              'Thịt cua đồng biểni oándkasndkla',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 190.0, end: 49.0),
            Pin(size: 19.0, end: 140.0),
            child: Text(
              'Cung Cấp Bởi NguyenHaFood',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 14,
                color: const Color(0xfff98008),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 83.0, middle: 0.5478),
            Pin(size: 19.0, end: 100.0),
            child: Text(
              'Giá:200.000đ',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 14,
                color: const Color(0xff040404),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 12.0, end: 16.0),
            Pin(size: 50.0, end: 6.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: const Color(0xfffc840d),
                border: Border.all(width: 1.0, color: const Color(0xfffefefe)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 30.0, start: 34.0),
            Pin(size: 30.0, end: 16.0),
            child:
            // Adobe XD layer: 'cart' (shape)
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 119.0, middle: 0.5016),
            Pin(size: 24.0, end: 22.0),
            child: Text(
              'Xem Giỏ Hàng',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: const Color(0xfff6f5f5),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }




}