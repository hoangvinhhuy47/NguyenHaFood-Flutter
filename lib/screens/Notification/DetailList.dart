import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/API/notification_detail_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/Model/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';
Future<GetNewDetailResponse> GetNewsDetailList(String newsID) async{
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/GetNewsDetail?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "NewsID":newsID,
      }));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return GetNewDetailResponse.fromJson(jsonDecode(response.body));
}


class detailList extends StatefulWidget {
  const detailList({Key key, this.newid}) : super(key: key);

  State<detailList> createState() => _detailList();
  final String newid;
}

class _detailList extends State<detailList> {
  GetNewDetailResponse response;
  int show =1;
  void _getNewDetail(String newID) async{
    response = await GetNewsDetailList(newID);
    if(show==1){
    if(response.statusId==1 && response.news!=null){
      setState(() {
        show=2;
      });
    }}
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _getNewDetail(widget.newid);
    return Scaffold(
      appBar: buildAppBar(context),
      body: show==2?Container(
        width: size.width,
        height: size.height - 50,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              width: size.width,
              height: 3,
              color: maucam,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Card(
                child: Container(
                  width: size.width,
                  height: 120,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: 110,
                          width: (size.width - 10) / 4,
                          child: Image.network(goBal.URL_image+response.news.image,fit: BoxFit.cover,),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        height: 110,
                        width: 3*(size.width - 10) / 4,
                        child: Column(
                          children: [
                            Container(height: 55,
                            alignment: Alignment.topLeft,
                            child: Text('${response.news.newsTitle}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: mauden),),
                            ),
                            Container(height: 22,
                            child: Row(
                              children: [
                                Image.asset('assets/images/calendar.png',fit:BoxFit.cover),
                                Text(Model.coverDatetoString(response.news.createdDate),style: TextStyle(color: mauxam,fontSize: 14,fontWeight: FontWeight.w300),),
                              ],
                            ),
                            ),
                            Container(
                              height: 22,
                              child: Row(
                                children: [
                                  Container(
                                    width: 22,
                                    child: Image.asset('assets/images/eyes.png',fit: BoxFit.cover,),
                                 
                                  ),
                                  Text('${response.news.viewCount.toString()}',style: TextStyle(color: mauxanh,fontSize: 14),)
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
            Container(
              height: size.height-210,
              width: size.width-2,
              child: SingleChildScrollView(
                  child: Html(
                    data: response.news.longDescription,
                  )
              ),
            )
          ],
        ),
      ):Container(),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 3,
      toolbarHeight: 50,
      title: Text(
        "Chi Tiết",
        style: TextStyle(color: maucam),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: kTextColor,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
