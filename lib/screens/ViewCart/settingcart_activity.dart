import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/API/adress/getadressbook_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/Model/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/screens/Loading_Activity.dart';

import 'Oder/createorder_activity.dart';

Future<GetAdressBookResponse> GetAdress() async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/GetAddressBook?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "UserID": goBal.UserID,
      }));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return GetAdressBookResponse.fromJson(jsonDecode(response.body));
}

class setttingcart extends StatefulWidget {
  State<setttingcart> createState() => _setttingcart();
}

class _setttingcart extends State<setttingcart> {
  int show = 1;
  GetAdressBookResponse response;
  bool check = true;
  bool check1 = false;
  bool checktt = true;
  bool checktt1 = false;
  bool checktt2 = false;
  bool checkhddt= false;
final noteOrder =  TextEditingController();
  final taxCode =  TextEditingController();
  final TaxCompanyAddress =  TextEditingController();
  final TaxCompanyEmail =  TextEditingController();
  final TaxCompanyName =  TextEditingController();
  final TaxNotes =  TextEditingController();
  void getApi() async {
    if (show == 1) {
      response = await GetAdress();
      if (response.statusId == 1) {
        if (response.addressBook.length != 0) {
          for (int i = 0; i < response.addressBook.length; i++) {
            if (response.addressBook.elementAt(i).isDefault == true) {
              goBal.adressUser = "Tên:" +
                  response.addressBook.elementAt(i).fullName +
                  '\n' +
                  "SĐT:" +
                  response.addressBook.elementAt(i).cellPhone +
                  '\n' +
                  "Đ/C:" +
                  response.addressBook.elementAt(i).fullAddress;
              break;
            }
          }
          setState(() {
            show = 2;
          });
        } else {
          goBal.adressUser = 'Vui Lòng Cập Nhật Địa Chỉ Giao Hàng!';
          setState(() {
            show = 2;
          });
        }
      }
    }
  }
void CheckValue(){
    if(goBal.typeshipAdress==1){
      check = true;
      check1 = false;
    }
    else{
      check1 = true;
      check = false;
    }
    if(goBal.typepayment==1){
       checktt = true;
       checktt1 = false;
       checktt2 = false;
    }
    else if(goBal.typepayment==2){
      checktt = false;
      checktt1 = true;
      checktt2 = false;
    }
    else{
      checktt = false;
      checktt1 = false;
      checktt2 = true;
    }
    if(goBal.checkHDTT==1){
      checkhddt=false;
    }
    else{
      checkhddt=true;
    }
    if(goBal.noteOrder!=''){
      noteOrder.text=goBal.noteOrder;
    }
   taxCode.text  =goBal.taxCode;
    TaxCompanyAddress.text  =goBal.TaxCompanyAddress;
    TaxCompanyEmail.text  =goBal.TaxCompanyEmail;
    TaxCompanyName.text  =goBal.TaxCompanyName;
    TaxNotes.text  =goBal.TaxNotes;
}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    getApi();
    CheckValue();
    return show == 1
        ? LoadingListPage()
        : Scaffold(
            bottomSheet: bottomsheet(context),
            body: Container(
              height: size.height - 130,
              width: size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    appbar(context),
                    SizedBox(
                      height: 40,
                    ),
                    Header3(context),
                    Header4(context),
                    Header5(context),
                    Header7(context),
                    Header6(context),
                  ],
                ),
              ),
            ));
  }

  Widget Header3(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 150,
      width: size.width,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: mauden,
                  spreadRadius: 0.2,
                  blurRadius: 0.2,
                )
              ]),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Địa Chỉ Của Bạn',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: mauden),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Danh Sách Địa Chỉ'),
                                  content: setDialog_adress(),
                                );
                              });
                        },
                        child: Text(
                          'Thay Đổi',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: mauxanh),
                        ),
                      ),
                    ],
                  )),
              Container(
                height: 100,
                alignment: Alignment.centerLeft,
                child: Text(
                  '${goBal.adressUser}',
                  style: TextStyle(
                      color: mauden, fontSize: 14, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomsheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        height: 120,
        width: size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: maucam,
                spreadRadius: 0.2,
                blurRadius: 0.2,
              )
            ]),
        child: Column(
          children: [
            Container(
              height: 50,
              width: size.width - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tổng Tiền:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '${goBal.TotalAmountCart}đ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: maudo),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Model.backsrceen(context);
                    },
                    child: Card(
                      child: Container(
                        color: mautrang,
                        height: 50,
                        width: (size.width - 80) / 2,
                        alignment: Alignment.center,
                        child: Text(
                          'Trở Về',
                          style: TextStyle(
                              color: maucam,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      goBal.noteOrder=noteOrder.text.toString();
                      if(goBal.noteOrder!=null && goBal.noteOrder!='') {
                        Model.goToNewScreen(context, createorder_activity());
                      }
                      else{
                        Fluttertoast.showToast(msg: 'Vui Lòng Nhập Ghi Chú Đơn Hàng');
                      }
                    },
                    child: Card(
                      child: Container(
                        height: 50,
                        color: maucam,
                        width: (size.width - 80) / 2,
                        alignment: Alignment.center,
                        child: Text(
                          'Xác Nhận',
                          style: TextStyle(
                              color: mautrang,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget Header4(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 150,
      width: size.width,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: mauden,
                  spreadRadius: 0.2,
                  blurRadius: 0.2,
                )
              ]),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hình Thức Giao Hàng',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: mauden),
                      ),
                    ],
                  )),
              Container(
                height: 100,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width / 2 - 15,
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Checkbox(
                              value: check,
                              onChanged: (value) {
                                setState(() {
                                 goBal.typeshipAdress=1;
                                  check = value;
                                  check1 = !value;
                                });
                              }),
                          Container(
                            width: size.width / 2 - 80,
                            child: Text('Giao Hàng Tiêu Chuẩn'),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 1,
                      color: mauden,
                    ),
                    Container(
                      width: size.width / 2 - 15,
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Checkbox(
                              value: check1,
                              onChanged: (value) {
                                setState(() {
                                  goBal.typeshipAdress=2;
                                  check1 = value;
                                  check = !value;
                                });
                              }),
                          Container(
                            width: size.width / 2 - 80,
                            child: Text('Giao Hàng Nhanh'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Header5(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 150,
      width: size.width,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: mauden,
                  spreadRadius: 0.2,
                  blurRadius: 0.2,
                )
              ]),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hình Thức Thanh Toán',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: mauden),
                      ),
                    ],
                  )),
              Container(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Checkbox(
                              value: checktt,
                              onChanged: (value) {
                                setState(() {
                                  goBal.typepayment=1;
                                  checktt = value;
                                  checktt1 = !value;
                                  checktt2 = !value;
                                });
                              }),
                          Text(
                            'Thanh Toán Tiền Mặt',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: mauden),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                              'assets/images/pay_atm.gif',
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Checkbox(
                              value: checktt1,
                              onChanged: (value) {
                                setState(() {
                                  goBal.typepayment=2;

                                  checktt = !value;
                                  checktt1 = value;
                                  checktt2 = !value;
                                });
                              }),
                          Text(
                            'Thanh Toán Bằng ATM',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: mauden),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                              'assets/images/payment.gif',
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Checkbox(
                              value: checktt2,
                              onChanged: (value) {
                                setState(() {
                                  goBal.typepayment=3;
                                  checktt = !value;
                                  checktt1 = !value;
                                  checktt2 = value;
                                });
                              }),
                          Text(
                            'Thanh Toán Bằng Momo',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: mauden),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                              'assets/images/payment.gif',
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appbar(BuildContext context) {
    return AppBar(
      backgroundColor: maucam,
      elevation: 0,
      title: Text(
        "Điều Chỉnh Đơn Hàng",
        style: TextStyle(color: mautrang),
      ),
      centerTitle: true,
      actions: [
        Container(
          height: 40,
          width: 40,
          child: IconButton(
            icon: Image.asset(
              "assets/icons/exiit.png",
              // By default our  icon color is white
              color: mautrang,
            ),
            onPressed: () {
              Model.backsrceen(context);
            },
          ),
        ),
      ],
    );
  }

  Widget Header6(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 150,
      width: size.width,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: mauden,
                  spreadRadius: 0.2,
                  blurRadius: 0.2,
                )
              ]),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ghi Chú',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: mauden),
                      ),
                    ],
                  )),
              Container(
                height: 100,
                alignment: Alignment.topCenter,
                child: Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: mauden,
                            spreadRadius: 0.8,
                            blurRadius: 0.8,
                          )
                        ]),
                    child: TextField(
                      controller: noteOrder,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        prefixIcon: Icon(
                          Icons.title,
                          color: Colors.black,
                        ),
                        hintText: 'Nhập ghi chú cho đơn hàng...',
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Header7(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 100,
      width: size.width,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: mauden,
                  spreadRadius: 0.2,
                  blurRadius: 0.2,
                )
              ]),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hóa Đơn Điện Tử',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: mauden),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                  return AlertDialog(
                                  title: Text('Hóa Đơn Điện Tử', style: TextStyle(color: maucam,fontSize: 18,fontWeight: FontWeight.w500),),
                                  content: DialogHoaDonDienTu(context),
                                );
                              });
                        },
                        child: Text(
                          'Thêm',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: mauxanh),
                        ),
                      ),
                    ],
                  )),
              Container(
                height: 50,
                alignment: Alignment.centerLeft,
                child: checkhddt==false?Text(
                  '+ Bạn Chưa Thêm Hóa Đơn Nào.',
                  style: TextStyle(
                      color: mauden, fontSize: 14, fontWeight: FontWeight.w300),
                ):Text(
                  ' + Bạn Đã Thêm Hóa Đơn Điện Tử',
                  style: TextStyle(
                      color: maucam, fontSize: 14, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget setDialog_adress() {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 2, // Change as per your requirement
      width: size.width - 20, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: response.addressBook.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              index.toString() +
                  '. ' +
                  response.addressBook.elementAt(index).fullAddress,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            onTap: () {
              setState(() {
                goBal.adressUser = "Tên:" +
                    response.addressBook.elementAt(index).fullName +
                    '\n' +
                    "SĐT:" +
                    response.addressBook.elementAt(index).cellPhone +
                    '\n' +
                    "Đ/C:" +
                    response.addressBook.elementAt(index).fullAddress;
              });
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }

  Widget DialogHoaDonDienTu(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: size.height , // Change as per your requirement
        width: size.width - 10,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width - 10,
                height: 20,
                child: Text('Mã Số Thuế (*)',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
              ),
              SizedBox(height: 10),
              Container(
                height: 30,
                alignment: Alignment.center,
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: mauxam,
                            spreadRadius: 0.8,
                            blurRadius: 0.8,
                          )
                        ]),
                    child: TextField(
                      controller: taxCode,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.short_text,
                          color: Colors.black12,
                        ),
                        contentPadding: EdgeInsets.only(top: 1,bottom: 3),
                        hintText: 'nhập mã số thuế...',
                      ),
                    )),
              ),
              SizedBox(height: 15),
              Container(
                width: size.width - 10,
                height: 20,
                child: Text('Tên Công Ty (*)',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
              ),
              SizedBox(height: 10),
              Container(
                height: 30,
                alignment: Alignment.center,
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: mauxam,
                            spreadRadius: 0.8,
                            blurRadius: 0.8,
                          )
                        ]),
                    child: TextField(
                      controller: TaxCompanyName,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.short_text,
                          color: Colors.black12,
                        ),
                        contentPadding: EdgeInsets.only(top: 1,bottom: 3),
                        hintText: 'nhập mã tên công ty...',
                      ),
                    )),
              ),
              SizedBox(height: 15),
              Container(
                width: size.width - 10,
                height: 20,
                child: Text('Địa Chỉ Công Ty (*)',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
              ),
              SizedBox(height: 10),
              Container(
                height: 30,
                alignment: Alignment.center,
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: mauxam,
                            spreadRadius: 0.8,
                            blurRadius: 0.8,
                          )
                        ]),
                    child: TextField(
controller: TaxCompanyAddress,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.short_text,
                          color: Colors.black12,
                        ),
                        contentPadding: EdgeInsets.only(top: 1,bottom: 3),
                        hintText: 'nhập địa chỉ...',
                      ),
                    )),
              ),
              SizedBox(height: 15),
              Container(
                width: size.width - 10,
                height: 20,
                child: Text('Email (*)',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
              ),
              SizedBox(height: 10),
              Container(
                height: 30,
                alignment: Alignment.center,
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: mauxam,
                            spreadRadius: 0.8,
                            blurRadius: 0.8,
                          )
                        ]),
                    child: TextField(
controller: TaxCompanyEmail,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.short_text,
                          color: Colors.black12,
                        ),
                        contentPadding: EdgeInsets.only(top: 1,bottom: 3),
                        hintText: 'nhập email...',
                      ),
                    )),
              ),
              SizedBox(height: 15),
              Container(
                width: size.width - 10,
                height: 20,
                child: Text('Ghi Chú (*)',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
              ),
              SizedBox(height: 10),
              Container(
                height: 80,
                alignment: Alignment.topLeft,
                child: Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: mauxam,
                            spreadRadius: 0.8,
                            blurRadius: 0.8,
                          )
                        ]),
                    child: TextField(
                      controller: TaxNotes,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.short_text,
                          color: Colors.black12,
                        ),
                        hintText: 'ghi chú hóa đơn....',
                      ),
                    )),
              ),
              SizedBox(height: 15),
              Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: (){
                      setState(() {
                        checkhddt=true;
                        goBal.checkHDTT=2;
                        goBal.VATMethodID=2;
                        goBal.taxCode=taxCode.text;
                        goBal.TaxCompanyAddress=TaxCompanyAddress.text;
                        goBal.TaxCompanyEmail=TaxCompanyEmail.text;
                        goBal.TaxCompanyName=TaxCompanyName.text;
                        goBal.TaxNotes=TaxNotes.text;
                      });
                      Navigator.of(context).pop();
                    }, child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                        child: Container(
                          alignment: Alignment.center,
                          width: (size.width - 100)/3,
                          height: 50,
                          color: maucam,
                          child: Text('Thêm',style:  TextStyle(color: mautrang,fontWeight: FontWeight.w500,fontSize: 16),),
                        ),
                    )
                    ),
                    TextButton(onPressed: (){
                      setState(() {
                        checkhddt=false;
                        goBal.checkHDTT=1;
                        goBal.VATMethodID=1;
                        goBal.taxCode='';
                        goBal.TaxCompanyAddress='';
                        goBal.TaxCompanyEmail='';
                        goBal.TaxCompanyName='';
                        goBal.TaxNotes='';
                      });
                      Navigator.of(context).pop();
                    }, child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        alignment: Alignment.center,
                        width: (size.width - 100)/3,
                        height: 50,
                        color: mauxam,
                        child: Text('Hủy',style:  TextStyle(color: mauden,fontWeight: FontWeight.w500,fontSize: 16),),
                      ),
                    )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
