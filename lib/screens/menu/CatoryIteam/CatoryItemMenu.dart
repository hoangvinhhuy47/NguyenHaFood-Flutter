import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/API/menu_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/constants.dart';

class catoryrootItemMenu extends StatefulWidget {
  const catoryrootItemMenu({Key key, this.iteamcatoymenu,this.active}) : super(key: key);

  State<catoryrootItemMenu> createState() => _catoryItemMenu();
  final ItemList iteamcatoymenu;
  final bool active;
}

class _catoryItemMenu extends State<catoryrootItemMenu> {
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: widget.active==false?mautrang:maucam,
        child: TextButton(
          onPressed: () {},
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    goBal.URL_image + widget.iteamcatoymenu.category.iconApp,
                    height: 30,
                    width: 30,
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 5),
                  height: 20,
                  alignment: Alignment.topCenter,
                  child: Text(
                    '${widget.iteamcatoymenu.category.categoryName}',
                    style: TextStyle(fontSize: 12, color: mauden),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
