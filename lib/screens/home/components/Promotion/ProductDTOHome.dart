import 'package:flutter/cupertino.dart';
import 'package:shop_app/API/home_response.dart';
import 'package:shop_app/screens/home/components/ProductHome/Home_Catory.dart';

class productDTOHome extends StatefulWidget{
  const productDTOHome({Key key, this.homeResponse}) : super(key: key);

  State<productDTOHome> createState()=> _productDTOHome();
  final HomeResponse homeResponse;
}
 class _productDTOHome extends State<productDTOHome>{
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: GridView.builder(
                  shrinkWrap: true,
                  primary: true,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.homeResponse.homeData.itemDtoList.length,
                 // physics: NeverScrollableScrollPhysics(),
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 0.52,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 4.0,
                  ),
                  itemBuilder: (context, index) =>
                      CatoryActivity(
                        categories:
                        widget.homeResponse.homeData.itemDtoList[index],
                      )),
            ),
          ),

          // Container(
          //   height: 150,
          //   width: 350,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(8),
          //     child: Image.asset(
          //       "assets/icons/background_home.jpg",
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),

          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 3),
          //     child: GridView.builder(
          //         shrinkWrap: true,
          //         primary: true,
          //         physics: NeverScrollableScrollPhysics(),
          //         scrollDirection: Axis.vertical,
          //         itemCount: 1,
          //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 1,
          //           childAspectRatio: 0.51,
          //           mainAxisSpacing: 3.0,
          //           crossAxisSpacing: 4.0,
          //         ),
          //         itemBuilder: (context, index) =>
          //             Catory_Promotion_ProductView( promotion:homeResponse.homeData.webItemPromotionDtoList[index] ,)),
          //   ),
          // ),
        ],
      ),
    );
  }

 }