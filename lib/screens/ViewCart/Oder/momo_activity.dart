import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/API/Momo/RequestMomoPayment.dart';
import 'package:shop_app/API/Momo/Request_MoMo.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';


Future<RequestMomoPayment> requestmomo(Request_Momo request_momo) async {
  final URLAPI = Uri.parse(
      "http://hr.softwareviet.com/api/momopayment/RequestMomoPayment/?GUIID=NjtUcnVuZ3RhbVBodWM7S0JMXzY7NjM2NzI5MDEwNTczMjMwMDAw");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(request_momo));

  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return RequestMomoPayment.fromJson(jsonDecode(response.body));
}


class momo_activity extends StatefulWidget {
  const momo_activity({Key key}) : super(key: key);

  State<momo_activity> createState() => _momo_activity();
}

class _momo_activity extends State<momo_activity>  with WidgetsBindingObserver  {
  Request_Momo request_momo;
  RequestMomoPayment response;
  int show = 1;
  String text;
  String depp='';
  // MomoVn _momoPay;
  void getAPI(Request_Momo request_momo) async {
    if (show == 1) {
      response = await requestmomo(request_momo);
      if (response.statusId == 1) {
        depp = response.data.payUrl;
        Model.launchURL(response.data.deeplink);
      }
      else{
        print('Lỗi');

      }
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _momoPay = MomoVn();
    // _momoPay.on(MomoVn.EVENT_PAYMENT_SUCCESS, result_momo);
    // _momoPay.on(MomoVn.EVENT_PAYMENT_ERROR, erro);
    WidgetsBinding.instance.addObserver(this);

  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // if(state == AppLifecycleState.resumed){
    //   result_momo();
    // }
    // if(state == AppLifecycleState.detached){
    //   result_momo();
    // }
    // if(state == AppLifecycleState.inactive){
    //   result_momo();
    // }
    if(state == AppLifecycleState.paused){
      result_momo();
    }

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
  void result_momo() async{

    try {
      Fluttertoast.showToast(msg: 'Thành Công');
      Uri uri = new Uri.dataFromString(depp);
      String codeParam = uri.queryParameters['signature'];
      print('${codeParam}');
    }
    catch(e){
      print(e);
    }
  }
  void sendtoMomo(){
    request_momo = new Request_Momo();
    request_momo.orderID=goBal.OderID;
    request_momo.amount=1500;
    request_momo.orderInfo='Đơn Hàng Của Huy';
    request_momo.redirectUrl='http://app_nguyenhafood.com';
    getAPI(request_momo);
  }
  void erro(){
    Fluttertoast.showToast(msg: 'Lỗi');
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
            onPressed: (){
              sendtoMomo();
            },
            child: Text('SendToMomo')));
  }
}
