// To parse this JSON data, do
//
//     final getProductBuyResponse = getProductBuyResponseFromJson(jsonString);

import 'dart:convert';

GetProductBuyResponse getProductBuyResponseFromJson(String str) => GetProductBuyResponse.fromJson(json.decode(str));

String getProductBuyResponseToJson(GetProductBuyResponse data) => json.encode(data.toJson());

class GetProductBuyResponse {
  GetProductBuyResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.productBuyList,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  List<ProductBuyList> productBuyList;

  factory GetProductBuyResponse.fromJson(Map<String, dynamic> json) => GetProductBuyResponse(
    statusId: json["StatusID"],
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
    productBuyList: List<ProductBuyList>.from(json["ProductBuyList"].map((x) => ProductBuyList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "StatusID": statusId,
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
    "ProductBuyList": List<dynamic>.from(productBuyList.map((x) => x.toJson())),
  };
}

class ProductBuyList {
  ProductBuyList({
    this.customerId,
    this.productId,
    this.code,
    this.itemName,
    this.skuId,
    this.price,
    this.salePrice,
    this.specialPrice,
    this.image,
    this.reviewCount,
    this.reviewValue,
    this.itemId,
  });

  String customerId;
  String productId;
  String code;
  String itemName;
  String skuId;
  double price;
  double salePrice;
  double specialPrice;
  String image;
  int reviewCount;
  double reviewValue;
  String itemId;

  factory ProductBuyList.fromJson(Map<String, dynamic> json) => ProductBuyList(
    customerId: json["CustomerID"],
    productId: json["ProductID"],
    code: json["Code"],
    itemName: json["ItemName"],
    skuId: json["SkuID"],
    price: json["Price"],
    salePrice: json["SalePrice"],
    specialPrice: json["SpecialPrice"],
    image: json["Image"],
    reviewCount: json["ReviewCount"],
    reviewValue: json["ReviewValue"].toDouble(),
    itemId: json["ItemID"],
  );

  Map<String, dynamic> toJson() => {
    "CustomerID": customerId,
    "ProductID": productId,
    "Code": code,
    "ItemName": itemName,
    "SkuID": skuId,
    "Price": price,
    "SalePrice": salePrice,
    "SpecialPrice": specialPrice,
    "Image": image,
    "ReviewCount": reviewCount,
    "ReviewValue": reviewValue,
    "ItemID": itemId,
  };
}
