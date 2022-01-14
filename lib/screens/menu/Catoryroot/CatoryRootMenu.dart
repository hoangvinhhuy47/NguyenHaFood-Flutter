import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/API/menu_response.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/constants.dart';

class catoryRootMenu extends StatefulWidget {
  const catoryRootMenu({Key key, this.itemDtoList,this.active}) : super(key: key);

  State<catoryRootMenu> createState() => _catoryRootMenu();
  final ItemDtoList itemDtoList;
  final bool active;
}

class _catoryRootMenu extends State<catoryRootMenu> {
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: widget.active==false?mautrang:maucam,
        child: TextButton(
            onPressed: () {},
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: 30,
                      width: 40,
                      child: Image.network(
                        goBal.URL_image + widget.itemDtoList.categoryRoot.iconApp,
                        fit: BoxFit.cover,
                      ),
                    )),
                Container(
                  width: 85,
                  height: 25,
                  alignment: Alignment.topCenter,
                  child: Text(
                    '${widget.itemDtoList.categoryRoot.categoryName}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: mauden,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
