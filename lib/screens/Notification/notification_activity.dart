import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/API/notification_response.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/screens/Notification/NewsList.dart';
import 'package:shop_app/screens/ViewCart/viewcart_acitivty.dart';

import '../../Model/constants.dart';
import 'package:http/http.dart' as http;

import 'DetailList.dart';

Future<GetNewListResponse> GetNewsList(String newsType,String pageIndex) async{
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/GetNewsList?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "NewsType":newsType,
        "PageIndex": pageIndex
      }));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return GetNewListResponse.fromJson(jsonDecode(response.body));
}

class Notification_Screen extends StatefulWidget{
  State<Notification_Screen> createState()=>_Notification_Screen();
}
class _Notification_Screen extends State<Notification_Screen>  {
  GetNewListResponse response;
  String newstype = '1';
  int show =1;
  int active =1;
  void _getnewlist(String newsType, String pageIndex) async{
    response = await GetNewsList(newsType,pageIndex);
    if(show==1){
     if(response.newsList.length!=0){
       setState(() {
         show=2;
       });
     }}
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _getnewlist(newstype, '1');
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        height: size.height-60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: size.width,height: 3,color: maucam,),
            Container(
              child: Container(
                height: 60,
                width: size.width,
                color: mautrang,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 5,right: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (size.width-15)/2,
                      height: 40,
                      decoration: BoxDecoration(
                          color: active==1?maucam:mautrang,
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          boxShadow: [
                            BoxShadow(
                              color: active==1?mautrang:mauden,
                              spreadRadius:1,
                              blurRadius: 1,
                            )
                          ]),
                      child: TextButton(
                        onPressed: (){
                          show=1;
                          active=1;
                          _getnewlist('1','1');
                        },
                        child: Text('Thông Báo',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: mauden),),
                      ),
                    ),
                    Container(
                      width: (size.width-15)/2,
                      height: 40,
                      decoration: BoxDecoration(
                          color:  active==2?maucam:mautrang,
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          boxShadow: [
                            BoxShadow(
                              color: active==2?mautrang:mauden,
                              spreadRadius:1,
                              blurRadius: 1,
                            )
                          ]),
                      child: TextButton(
                        onPressed: (){
                          active=2;
                          show=1;
                          _getnewlist('2','1');
                        },
                        child: Text('Tin Tức',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: mauden),),
                      ),
                    )
                  ],
                ),
              ),
            ),
            show==2?
                Container(width: size.width, height: size.height -200,
                    child: GridView.builder(
                      itemCount: response.newsList.length,
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.2,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) => newList(
                        newsList: response.newsList[index],
                        size: size,
                      ),
                    )):Container(),

          ],
        ),
      ),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 3,
      toolbarHeight: 50,
      title: Text("Thông Báo",style: TextStyle(color: maucam),),
      centerTitle: true,
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
          onPressed: () {
            Model.goToNewScreen(context, viewcart_activity());

          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
  Widget _notification(Size size){
    return Container();
  }
  void _backsrceen(BuildContext context) {
    Navigator.pop(context);
  }

}