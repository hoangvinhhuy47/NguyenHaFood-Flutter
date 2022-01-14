import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/API/adress/getadressbook_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/InterFace/abc.dart';
import 'package:shop_app/Model/Model.dart';
import 'package:shop_app/Model/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/screens/Acount/Adress/item_adress.dart';
import 'package:shop_app/screens/Acount/Adress/updateadress_activity.dart';
import 'package:shop_app/screens/ViewCart/viewcart_acitivty.dart';

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

class adressbook extends StatefulWidget {
  const adressbook({Key key, this.reload}) : super(key: key);

  State<adressbook> createState() => _adressbook();
  final int reload;
}

class _adressbook extends State<adressbook> {
  GetAdressBookResponse response;
  int show = 1;

  void getApi() async {
    if (show == 1) {
      response = await GetAdress();
      if (response.statusId == 1 && response.addressBook.length != null) {
        setState(() {
          show = 2;
        });
      }
    }
  }

  void delete_Adress(int index) {
    setState(() {
      response.addressBook.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    getApi();
    return Scaffold(
      appBar: buildAppBar(context),
      bottomSheet: Container(
        width: size.width,
        height: 60,
        child: TextButton(
          onPressed: () {
            Model.goToNewScreen(context, updateadress_activity());
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: size.width / 2,
              color: maucam,
              alignment: Alignment.center,
              child: Text(
                'Thêm Địa Chỉ',
                style: TextStyle(
                    color: mautrang, fontWeight: FontWeight.w400, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: size.height - 150,
        child: show != 1
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GridView.builder(
                        shrinkWrap: true,
                        primary: true,
                        scrollDirection: Axis.vertical,
                        itemCount: response.addressBook.length,
                        // physics: NeverScrollableScrollPhysics(),
                        // physics: ScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                          childAspectRatio: 2,
                        ),
                        itemBuilder: (context, index) => item_adress(
                              addressBook: response.addressBook[index],
                              delete_adress: delete_Adress,
                              index: index,
                            )),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: maucam,
      elevation: 0,
      toolbarHeight: 50,
      title: Text(
        "Sổ Địa Chỉ",
        style: TextStyle(color: mautrang),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          // By default our  icon color is white
          color: mautrang,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: mautrang,
          ),
          onPressed: () {
            Model.goToNewScreen(context, viewcart_activity());
          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }

  @override
  int ChangeToUpdate(int a) {
    show = 1;
    getApi();
  }
}
