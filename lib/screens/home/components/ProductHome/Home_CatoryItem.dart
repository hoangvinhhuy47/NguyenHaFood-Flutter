import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/API/home_response.dart';
import '../../../../Model/constants.dart';

class HomeCatoryItem extends StatelessWidget {
  final ItemList catoryItem;
  final bool active;


  const HomeCatoryItem({Key key, this.catoryItem,this.active})
      : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      width: 80,
        child: Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: [
                Positioned.fill(
                  child:active==false?Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFFFCB702),
                          Color(0xFFFCB702),
                          Color(0xFFFCB702),
                        ],
                      ),
                    ),
                  ):Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFFEAEAEA),
                          Color(0xFFFFFFFF),
                          Color(0xFFFFFFFF),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(10.0),
                    primary: active==false?Colors.white:maucam,
                    textStyle: const TextStyle(fontSize: 14,),
                  ),
                  onPressed: () {},
                  child: Text(
                    catoryItem.category.categoryName,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
