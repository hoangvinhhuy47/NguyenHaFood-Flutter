// ignore_for_file: missing_return

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/API/GetAPI.dart';
import 'package:shop_app/API/home_response.dart';
import 'package:shop_app/screens/ImfomationProduct/ImfomationProduct.dart';

import 'package:shop_app/screens/home/components/ProductHome/Home_CatoryItem.dart';
import 'package:shop_app/screens/home/components/ProductHome/product.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import '../../../../Model/constants.dart';

class CatoryActivity extends StatefulWidget {
  final int index = 1;
  final int select = 0;
  final ItemDtoList categories;

  const CatoryActivity({Key key, this.categories}) : super(key: key);

  State<CatoryActivity> createState() => Catory();
}

class Catory extends State<CatoryActivity> {
  int index = 1;
  int select = 0;
  int selectcatoryitem=0;
  final ItemDtoList categories;

  Catory({this.categories});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(2),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 45,
                padding:
                    const EdgeInsets.only(bottom: 8, left: 8, top: 5, right: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.categories.categoryRoot.categoryName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print(
                            '${widget.categories.categoryRoot.productCategoryId}');
                      },
                      child: Text(
                        "Xem Thêm",
                        style: TextStyle(
                            fontSize: 14,
                            color: maucam,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                )),
            // image
            Container(
              height: 150,
              width: size.width-10,
              padding:
                  const EdgeInsets.only(bottom: 8, left: 2, top: 5, right: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  goBal.URL_image + widget.categories.categoryRoot.photo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
                height: 45,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: GridView.builder(
                      itemCount: widget.categories.itemList.length,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: (size.width-10)/(2*(size.width-10)),
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) => Stack(
                            children: [
                              HomeCatoryItem(
                                catoryItem: widget.categories.itemList[index],
                                active: index==select?true:false,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    select = index;
                                    print('${index}');
                                  });
                                },
                              )
                            ],
                          )),
                )),

            Container(
              height: 440,

              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: GridView.builder(
                    itemCount: widget.categories.itemList
                        .elementAt(select)
                        .productList
                        .length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 5.0,
                    ),
                    itemBuilder: (context, index) => Stack(
                          children: [
                            ProductHome(
                              product: widget.categories.itemList
                                  .elementAt(select)
                                  .productList[index],
                            ),

                          ],
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _changeCatory(int index) async {
    setState(() {
      select = index;
    });
  }
}
