import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/API/ProductDetail/imfomationproduct_response.dart';
import 'package:shop_app/API/adress/addnewadress_request.dart';
import 'package:shop_app/API/adress/addnewadress_response.dart';
import 'package:shop_app/API/adress/getadressbook_response.dart';
import 'package:shop_app/API/adress/getallcity_response.dart';
import 'package:shop_app/API/adress/getalldistric_response.dart';
import 'package:shop_app/API/adress/getallward_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/Model/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/screens/Loading_Activity.dart';

Future<GetAllCityResponse> GetAllCity() async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/GetAllCity?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"": ""}));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return GetAllCityResponse.fromJson(jsonDecode(response.body));
}

Future<GetAllDistricResponse> GetAllDistric(String IDCity) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/GetAllDistrict?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"CityID": IDCity}));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return GetAllDistricResponse.fromJson(jsonDecode(response.body));
}

Future<GetAllWardResponse> GetAllWard(String IDdistric) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/GetAllWard?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"DistrictID": IDdistric}));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return GetAllWardResponse.fromJson(jsonDecode(response.body));
}

Future<AddNewAdressResponse> AdnewAdress(AddAddressBookRequest abc) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/AddAddressBook?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
var body = jsonEncode(abc);
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body:body);

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return AddNewAdressResponse.fromJson(jsonDecode(response.body));
}

class updateadress_activity extends StatefulWidget {
  State<updateadress_activity> createState() => _updateadress_activity();
}

class _updateadress_activity extends State<updateadress_activity> {
  GetAllCityResponse response;
  GetAllDistricResponse response_distric;
  GetAllWardResponse response_ward;
  AddAddressBookRequest request1= new AddAddressBookRequest();
  AddNewAdressResponse addNewAdressResponse;

  int show = 1;
  int _value = 0;
  int _valuedistric = 0;
  int _valuedisward = 0;
  bool valueredio = false;
  int showerro = 1;
  int showerro1 = 1;
  int showerro2 = 1;

  ///
  String StringCity,StringDistric,StringWard;
  void _getApi() async {
    if (show == 1) {
      response = await GetAllCity();
      if (response.statusId == 1) {
        setState(() {
          StringCity = response.cityList
              .elementAt(_value)
              .cityId;
          idcity = response.cityList
              .elementAt(_value)
              .cityName;
          _getApidistric(response.cityList
              .elementAt(_value)
              .cityId);
        });
      }
    }
  }

  void _getApidistric(String id) async {
    response_distric = await GetAllDistric(id);
    if (response_distric.statusId == 1) {
      setState(() {
        iddistric =
            response_distric.districtList
                .elementAt(_valuedistric)
                .districtName;
        StringDistric =response_distric.districtList
            .elementAt(_valuedistric)
            .districtId;
        _getApiWard(
            response_distric.districtList
                .elementAt(_valuedistric)
                .districtId);
      });
    }
  }

  void _getApiWard(String id) async {
    response_ward = await GetAllWard(id);
    if (response_ward.statusId == 1) {
      setState(() {
        idward = response_ward.wardList
            .elementAt(_valuedisward)
            .wardName;
        StringDistric=response_ward.wardList
            .elementAt(_valuedisward)
            .wardId;
        show = 2;
      });
    }
  }

  /// controler
  String idcity,
      iddistric,
      idward = '';
  final idadresss = TextEditingController();
  final iduser = TextEditingController();
  final idsdt = TextEditingController();
  final idfulladress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _getApi();
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(context),
      bottomSheet: bottomsheet(size),
      body: body(context, size),
    );
  }

  Widget body(BuildContext context, Size size) {
    return show == 1
        ? LoadingListPage()
        : Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      width: size.width,
      height: size.height - 50 - 70,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// tên người nhận
            Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tên Người Nhận(*)',
                    style: TextStyle(
                        color: mauden,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
                height: 40,
                alignment: Alignment.center,
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
                child: TextField(
                  controller: iduser,
                  maxLength: 50,
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 8, bottom: 0),
                      hintText:
                      showerro == 1 ? 'nhập tên người nhận' : '',
                      errorText:
                      showerro == 1 ? '' : 'Không Được Bỏ Trống'),
                )),
            SizedBox(
              height: 20,
            ),

            /// sdt
            Container(
              height: 30,
              child: Text(
                'Số Điện Thoại(*)',
                style: TextStyle(
                    color: mauden,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
                height: 30,
                alignment: Alignment.center,
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
                child: TextField(
                  controller: idsdt,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 8, bottom: 0),
                      hintText: showerro1 == 1 ? 'nhập số điện thoại' : '',
                      errorText: showerro1 == 1 ? '' : 'Không Được Bỏ Trống'
                  ),
                )),
            SizedBox(
              height: 20,
            ),

            ///tình thành phố
            Container(
              height: 30,
              child: Text(
                'Tỉnh/ Thành Phố(*)',
                style: TextStyle(
                    color: mauden,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
                height: 30,
                alignment: Alignment.center,
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
                child: new DropdownButton(
                    value: _value,
                    items: new List.generate(response.cityList.length,
                            (int index) {
                          return new DropdownMenuItem(
                            child: new Container(
                                child: new Text(
                                    "${response.cityList[index].cityName}"),
                                width: size.width - 60),
                            value: index,
                          );
                        }),
                    onChanged: (int value) {
                      setState(() {
                        _value = value;
                        _getApidistric(
                            response.cityList
                                .elementAt(_value)
                                .cityId);
                        idcity =
                            response.cityList
                                .elementAt(_value)
                                .cityName;
                        StringCity=
                            response.cityList
                                .elementAt(_value)
                                .cityId;
                      });
                    })),
            SizedBox(
              height: 20,
            ),
            // quận huyện
            Container(
              height: 30,
              child: Text(
                'Quận/ Huyện(*)',
                style: TextStyle(
                    color: mauden,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
                height: 30,
                alignment: Alignment.center,
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
                child: new DropdownButton(
                    value: _valuedistric,
                    items: new List.generate(
                        response_distric.districtList.length,
                            (int index) {
                          return new DropdownMenuItem(
                            child: new Container(
                                child: new Text(
                                    "${response_distric.districtList[index]
                                        .districtName}"),
                                width: size.width - 60),
                            value: index,
                          );
                        }),
                    onChanged: (int value) {
                      setState(() {
                        _valuedistric = value;
                        _getApiWard(response_distric.districtList
                            .elementAt(_valuedistric)
                            .districtId);
                        iddistric =
                            response_distric.districtList
                                .elementAt(_valuedistric)
                                .districtName;
                        StringDistric=
                            response_distric.districtList
                                .elementAt(_valuedistric)
                                .districtId;
                      });
                    })),
            SizedBox(
              height: 20,
            ),

            /// phường xã
            Container(
              height: 30,
              child: Text(
                'Phường/ Xã(*)',
                style: TextStyle(
                    color: mauden,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
                height: 30,
                alignment: Alignment.center,
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
                child: new DropdownButton(
                    value: _valuedisward,
                    items: new List.generate(
                        response_ward.wardList.length, (int index) {
                      return new DropdownMenuItem(
                        child: new Container(
                            child: new Text(
                                "${response_ward.wardList[index].wardName}"),
                            width: size.width - 60),
                        value: index,
                      );
                    }),
                    onChanged: (int value) {
                      setState(() {
                        _valuedisward = value;
                        idward =
                            response_ward.wardList
                                .elementAt(_valuedisward)
                                .wardName;
                        StringWard=
                            response_ward.wardList
                                .elementAt(_valuedisward)
                                .wardId;
                      });
                    })),
            SizedBox(
              height: 20,
            ),

            ///địa chỉ
            Container(
              height: 30,
              child: Text(
                'Địa Chỉ(*)',
                style: TextStyle(
                    color: mauden,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
                height: 30,
                alignment: Alignment.center,
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
                child: TextField(
                  controller: idadresss,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 8),
                      hintText: showerro2 == 1 ? 'nhập địa chỉ' : '',
                      errorText: showerro2 == 1 ? '' : 'Không Được Bỏ Trống'
                  ),
                )),
            SizedBox(
              height: 20,
            ),

            ///địa chỉ nhận hàng
            Container(
              height: 30,
              child: Text(
                'Địa Chỉ Nhận Hàng(*)',
                style: TextStyle(
                    color: mauden,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
                height: 40,
                alignment: Alignment.centerLeft,
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
                child: Text(
                    '${idadresss.text},${idward},${iddistric},${idcity}',)),
            SizedBox(
              height: 20,
            ),

            /// địa chỉ mặc định
            Container(
              height: 30,
              child: Row(
                children: [
                  Checkbox(
                      activeColor: maucam,
                      hoverColor: maucam,
                      value: valueredio,
                      onChanged: (value) {
                        setState(() {
                          valueredio = value;
                        });
                      }),
                  Text(
                    'Đặt Làm Địa Chỉ Mặc Định',
                    style: TextStyle(
                        color: mauden,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomsheet(Size size) {
    void addnewadress(AddAddressBookRequest addNewAdressRequest) async {
      addNewAdressResponse = await AdnewAdress(addNewAdressRequest);
      if (addNewAdressResponse.statusId == 1) {
        print('ok nè');
      }
    }
    return Container(
      height: 60,
      width: size.width,
      child: Card(
        child: Container(
          width: size.width / 2,
          height: 60,
          child: TextButton(
            onPressed: () {
              if (iduser.text.isEmpty == true) {
                setState(() {
                  showerro = 2;
                });
              }
              else {
                setState(() {
                  showerro = 1;
                });
              }
              if (idsdt.text.isEmpty == true) {
                setState(() {
                  showerro1 = 2;
                });
              }
              else {
                setState(() {
                  showerro1 = 1;
                });
              }
              if (idadresss.text.isEmpty == true) {
                setState(() {
                  showerro2 = 2;
                });
              }
              else {
                setState(() {
                  showerro2 = 1;
                });
              }
              if (iduser.text.isEmpty == false && idsdt.text.isEmpty == false &&
                  idadresss.text.isEmpty == false) {
                // request1.addressBook = new AddressBook();
                try {
                  request1.addressBook.isDefault = valueredio;
                  request1.addressBook.fullAddress =
                      idadresss.text + ',' + idward + ',' + iddistric + ',' +
                          idcity;
                  request1.addressBook.cellPhone = idsdt.text;
                  request1.addressBook.fullName = iduser.text;
                  request1.addressBook.address = idadresss.text;
                  request1.addressBook.objectType = '1';
                  request1.addressBook.countryID = '1';
                  request1.addressBook.cityID = StringCity;
                  request1.addressBook.districtID = StringDistric;
                  request1.addressBook.wardID = StringWard;
                  request1.addressBook.sortOrder = '1';
                  request1.addressBook.objectID = goBal.UserID;
                  request1.addressBook.addressID = '';
                  addnewadress(request1);
                }catch(e){
                  print('${e}');
                }
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                alignment: Alignment.center,
                color: maucam,
                width: size.width / 2,
                height: 60,
                child: (Text(
                  'Lưu Địa Chỉ',
                  style: TextStyle(
                      color: mautrang,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: maucam,
      elevation: 0,
      toolbarHeight: 50,
      title: Text(
        "Cập Nhật Địa Chỉ",
        style: TextStyle(color: mautrang),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          // By default our  icon color is white
          color: mautrang,
        ),
        onPressed: () {
          Model.backsrceen(context);
        },
      ),
    );
  }
}
