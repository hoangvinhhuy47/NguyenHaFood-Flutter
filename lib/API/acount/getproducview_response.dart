// To parse this JSON data, do
//
//     final getProductViewResponse = getProductViewResponseFromJson(jsonString);

import 'dart:convert';

GetProductViewResponse getProductViewResponseFromJson(String str) => GetProductViewResponse.fromJson(json.decode(str));

String getProductViewResponseToJson(GetProductViewResponse data) => json.encode(data.toJson());

class GetProductViewResponse {
  GetProductViewResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.productViewList,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  List<ProductViewList> productViewList;

  factory GetProductViewResponse.fromJson(Map<String, dynamic> json) => GetProductViewResponse(
    statusId: json["StatusID"],
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
    productViewList: List<ProductViewList>.from(json["ProductViewList"].map((x) => ProductViewList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "StatusID": statusId,
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
    "ProductViewList": List<dynamic>.from(productViewList.map((x) => x.toJson())),
  };
}

class ProductViewList {
  ProductViewList({
    this.siteId,
    this.storeId,
    this.favoriteId,
    this.userId,
    this.itemId,
    this.code,
    this.itemName,
    this.skuId,
    this.createdDate,
    this.favoriteType,
    this.price,
    this.salePrice,
    this.specialPrice,
    this.image,
    this.reviewCount,
    this.reviewValue,
  });

  int siteId;
  String storeId;
  String favoriteId;
  String userId;
  String itemId;
  String code;
  String itemName;
  String skuId;
  DateTime createdDate;
  int favoriteType;
  double price;
  double salePrice;
  double specialPrice;
  String image;
  int reviewCount;
  double reviewValue;

  factory ProductViewList.fromJson(Map<String, dynamic> json) => ProductViewList(
    siteId: json["SiteID"],
    storeId: json["StoreID"],
    favoriteId: json["FavoriteID"],
    userId: json["UserID"],
    itemId: json["ItemID"],
    code: json["Code"],
    itemName: json["ItemName"],
    skuId: json["SkuID"],
    createdDate: DateTime.parse(json["CreatedDate"]),
    favoriteType: json["FavoriteType"],
    price: json["Price"],
    salePrice: json["SalePrice"],
    specialPrice: json["SpecialPrice"],
    image: json["Image"],
    reviewCount: json["ReviewCount"],
    reviewValue: json["ReviewValue"],
  );

  Map<String, dynamic> toJson() => {
    "SiteID": siteId,
    "StoreID": storeId,
    "FavoriteID": favoriteId,
    "UserID": userId,
    "ItemID": itemId,
    "Code": code,
    "ItemName": itemName,
    "SkuID": skuId,
    "CreatedDate": createdDate.toIso8601String(),
    "FavoriteType": favoriteType,
    "Price": price,
    "SalePrice": salePrice,
    "SpecialPrice": specialPrice,
    "Image": image,
    "ReviewCount": reviewCount,
    "ReviewValue": reviewValue,
  };
}
