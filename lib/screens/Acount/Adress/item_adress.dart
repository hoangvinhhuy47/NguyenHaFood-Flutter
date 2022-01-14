import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/API/adress/delelteadress_response.dart';
import 'package:shop_app/API/adress/getadressbook_response.dart';
import 'package:shop_app/API/adress/updateadressbook_response.dart';

import 'package:shop_app/InterFace/abc.dart';
import 'package:shop_app/Model/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/screens/Acount/Adress/adressbook.dart';

Future<UpdateAdressbook> updateAdress(AddressBook  addressBook) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/UpdateAddressBook?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:addressBook,
      );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return UpdateAdressbook.fromJson(jsonDecode(response.body));
}
Future<DeleteAdressResponse> DeleteAddress(String AddressID) async {
  final URLAPI = Uri.parse(
      "https://demobanhang.softwareviet.com/api/Retail/DeleteAddressBook?GUIID=MjQ7VHJ1bmd0YW1QaHVjO0tCTF8yNDs2MzcwNzM3NTMxOTYwNzAwMDA%3D");
  final response = await http.post(URLAPI,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body: jsonEncode(<String, String>{
        "AddressID": AddressID,

      }));

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // HomeResponse homeResponse = HomeResponse.fromJson(jsonDecode(response.body));
  return DeleteAdressResponse.fromJson(jsonDecode(response.body));
}


class item_adress extends StatefulWidget {
  const item_adress({Key key, this.addressBook, this.delete_adress, this.index}) : super(key: key);

  State<item_adress> createState() => _item_adress();
final AddressBook addressBook;
  final ValueChanged<int> delete_adress;
  final int index;

}

class _item_adress extends State<item_adress> {
  bool show = false;
  DeleteAdressResponse deleteAdressResponse;

  void _deleteAdress(String AddressID)async{
    deleteAdressResponse = await DeleteAddress(AddressID);
    if(deleteAdressResponse.statusId==1){
      widget.delete_adress(widget.index);
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Card(
        child: TextButton(
          onPressed: () {},
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 150,
                  width: 3 * (size.width - 30) / 4,
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.addressBook.fullName}',
                          style: TextStyle(color: mauden, fontSize: 14),
                        ),
                      ),
                      Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.addressBook.cellPhone}',
                          style: TextStyle(color: mauden, fontSize: 14),
                        ),
                      ),
                      Container(
                        height: 60,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.addressBook.fullAddress}',
                          style: TextStyle(color: mauden, fontSize: 14),
                        ),
                      ),
                      widget.addressBook.isDefault == true
                          ? Container(
                              height: 30,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Địa Chỉ Mặc Định',
                                style: TextStyle(color: maucam, fontSize: 14),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: (size.width - 100) / 4,
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.topRight,
                    child: widget.addressBook.isDefault == false
                        ? PopupMenuButton(
                            color: mautrang,
                            onSelected: (value) {
                              if (value == 1) {
                             ////
                              }
                              if(value==2){}
                              if(value==3){
                                _deleteAdress(widget.addressBook.addressId);

                              }
                            },
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: Text("Đặt Làm Địa Chỉ Mặt Định"),
                                    value: 1,
                                  ),
                                  PopupMenuItem(
                                    child: Text("Chỉnh Sửa"),
                                    value: 2,
                                  ),
                                  PopupMenuItem(
                                    child: Text("Xóa"),
                                    value: 3,
                                  ),
                                ])
                        : PopupMenuButton(
                            color: mautrang,
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: Text("Chỉnh Sửa"),
                                    value: 2,
                                  ),
                                ]),
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
