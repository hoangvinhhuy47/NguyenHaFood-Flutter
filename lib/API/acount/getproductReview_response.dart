// To parse this JSON data, do
//
//     final getProductReViewResponse = getProductReViewResponseFromJson(jsonString);

import 'dart:convert';

GetProductReViewResponse getProductReViewResponseFromJson(String str) => GetProductReViewResponse.fromJson(json.decode(str));

String getProductReViewResponseToJson(GetProductReViewResponse data) => json.encode(data.toJson());

class GetProductReViewResponse {
  GetProductReViewResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.productReviewList,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  List<ProductReviewList> productReviewList;

  factory GetProductReViewResponse.fromJson(Map<String, dynamic> json) => GetProductReViewResponse(
    statusId: json["StatusID"],
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
    productReviewList: List<ProductReviewList>.from(json["ProductReviewList"].map((x) => ProductReviewList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "StatusID": statusId,
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
    "ProductReviewList": List<dynamic>.from(productReviewList.map((x) => x.toJson())),
  };
}

class ProductReviewList {
  ProductReviewList({
    this.reviewId,
    this.reviewDate,
    this.customerId,
    this.itemId,
    this.code,
    this.itemName,
    this.skuId,
    this.price,
    this.salePrice,
    this.specialPrice,
    this.image,
    this.reviewCount,
    this.reviewValue,
  });

  String reviewId;
  DateTime reviewDate;
  String customerId;
  String itemId;
  String code;
  String itemName;
  String skuId;
  double price;
  double salePrice;
  double specialPrice;
  String image;
  int reviewCount;
  double reviewValue;

  factory ProductReviewList.fromJson(Map<String, dynamic> json) => ProductReviewList(
    reviewId: json["ReviewID"],
    reviewDate: DateTime.parse(json["ReviewDate"]),
    customerId: json["CustomerID"],
    itemId: json["ItemID"],
    code: json["Code"],
    itemName: json["ItemName"],
    skuId: json["SkuID"],
    price: json["Price"],
    salePrice: json["SalePrice"],
    specialPrice: json["SpecialPrice"],
    image: json["Image"],
    reviewCount: json["ReviewCount"],
    reviewValue: json["ReviewValue"],
  );

  Map<String, dynamic> toJson() => {
    "ReviewID": reviewId,
    "ReviewDate": reviewDate.toIso8601String(),
    "CustomerID": customerId,
    "ItemID": itemId,
    "Code": code,
    "ItemName": itemName,
    "SkuID": skuId,
    "Price": price,
    "SalePrice": salePrice,
    "SpecialPrice": specialPrice,
    "Image": image,
    "ReviewCount": reviewCount,
    "ReviewValue": reviewValue,
  };
}
