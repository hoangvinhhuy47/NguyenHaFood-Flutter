import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/API/notification_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';

import '../../Model/constants.dart';
import 'DetailList.dart';

class newList extends StatefulWidget{
  const newList({Key key, this.size,this.newsList}) : super(key: key);

  State<newList> createState()=>_newList();
  final Size size;
  final NewsList newsList;
}
class _newList extends State<newList>{
  @override
  Widget build(BuildContext context) {
    return Card(
      child:  Container(
        color: mautrang,
        height: 300,
        width: widget.size.width - 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: widget.size.width,
              alignment: Alignment.centerLeft,
              child: Card(
                child: Container(
                  width: widget.size.width,
                  child: TextButton(
                    onPressed: () {   goToDeTailProduct(context,widget.newsList.newsId);},
                    child: Text(
                      '${widget.newsList.newsTitle}',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: maucam),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 30,
              width: widget.size.width - 10,
              color: mautrang,
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: widget.size.width - 100,
                    child: Text(
                      '${widget.newsList.shortDescription}',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: mauxam),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      goToDeTailProduct(context,widget.newsList.newsId);
                    },
                    child: Text(
                      'Xem Thêm',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: maudo,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: widget.size.width - 5,
                height: 150,
                child: Image.network(
                  goBal.URL_image + widget.newsList.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: widget.size.width-10,
              height: 50,
              padding: EdgeInsets.only(top: 5,left: 5),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    child: Image.asset('assets/images/eyes.png',fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 5,),
                  Text('${widget.newsList.viewCount.toString()}',style: TextStyle(color: mauxanh, fontSize: 16,fontWeight: FontWeight.w500),),
                  Container(height: 30,
                    width: 90,
                    padding: EdgeInsets.only(left: 60),
                    child: Image.asset('assets/images/calendar.png',fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 5,),
                  Text(Model.coverDatetoString(widget.newsList.createdDate),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: mauxanh),)
                ],
              ),
            )
          ],
        ),
      ));
  }

  static void goToDeTailProduct(BuildContext context, String IDProduct) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => detailList(
            newid: IDProduct,
          )),
    );
  }
}