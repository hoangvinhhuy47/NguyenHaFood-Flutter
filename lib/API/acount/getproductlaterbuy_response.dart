// To parse this JSON data, do
//
//     final getProductLaterBuyResponse = getProductLaterBuyResponseFromJson(jsonString);

import 'dart:convert';

GetProductLaterBuyResponse getProductLaterBuyResponseFromJson(String str) => GetProductLaterBuyResponse.fromJson(json.decode(str));

String getProductLaterBuyResponseToJson(GetProductLaterBuyResponse data) => json.encode(data.toJson());

class GetProductLaterBuyResponse {
  GetProductLaterBuyResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.homeData,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  List<HomeDatum> homeData;

  factory GetProductLaterBuyResponse.fromJson(Map<String, dynamic> json) => GetProductLaterBuyResponse(
    statusId: json["StatusID"],
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
    homeData: List<HomeDatum>.from(json["HomeData"].map((x) => HomeDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "StatusID": statusId,
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
    "HomeData": List<dynamic>.from(homeData.map((x) => x.toJson())),
  };
}

class HomeDatum {
  HomeDatum({
    this.cartId,
    this.detailId,
    this.itemId,
    this.code,
    this.itemName,
    this.quantity,
    this.price,
    this.specialPrice,
    this.orgPrice,
    this.amount,
    this.skuId,
    this.skuProductId,
    this.skuProductCode,
    this.skuProductName,
    this.skuProductPrice,
    this.cartType,
    this.skuSortOrder,
    this.userName,
    this.totalAmount,
    this.siteId,
    this.storeId,
    this.attributeId1,
    this.attributeName1,
    this.attributeId2,
    this.attributeName2,
    this.image,
  });

  int cartId;
  int detailId;
  String itemId;
  String code;
  String itemName;
  double quantity;
  double price;
  double specialPrice;
  double orgPrice;
  double amount;
  String skuId;
  String skuProductId;
  String skuProductCode;
  String skuProductName;
  double skuProductPrice;
  int cartType;
  int skuSortOrder;
  String userName;
  double totalAmount;
  int siteId;
  StoreId storeId;
  dynamic attributeId1;
  dynamic attributeName1;
  dynamic attributeId2;
  dynamic attributeName2;
  String image;

  factory HomeDatum.fromJson(Map<String, dynamic> json) => HomeDatum(
    cartId: json["CartID"],
    detailId: json["DetailID"],
    itemId: json["ItemID"],
    code: json["Code"],
    itemName: json["ItemName"],
    quantity: json["Quantity"],
    price: json["Price"],
    specialPrice: json["SpecialPrice"],
    orgPrice: json["OrgPrice"],
    amount: json["Amount"],
    skuId: json["SkuID"],
    skuProductId: json["SkuProductID"],
    skuProductCode: json["SkuProductCode"],
    skuProductName: json["SkuProductName"],
    skuProductPrice: json["SkuProductPrice"],
    cartType: json["CartType"],
    skuSortOrder: json["SkuSortOrder"],
    userName: json["UserName"],
    totalAmount: json["TotalAmount"],
    siteId: json["SiteID"],
    storeId: storeIdValues.map[json["StoreID"]],
    attributeId1: json["AttributeID1"],
    attributeName1: json["AttributeName1"],
    attributeId2: json["AttributeID2"],
    attributeName2: json["AttributeName2"],
    image: json["Image"],
  );

  Map<String, dynamic> toJson() => {
    "CartID": cartId,
    "DetailID": detailId,
    "ItemID": itemId,
    "Code": code,
    "ItemName": itemName,
    "Quantity": quantity,
    "Price": price,
    "SpecialPrice": specialPrice,
    "OrgPrice": orgPrice,
    "Amount": amount,
    "SkuID": skuId,
    "SkuProductID": skuProductId,
    "SkuProductCode": skuProductCode,
    "SkuProductName": skuProductName,
    "SkuProductPrice": skuProductPrice,
    "CartType": cartType,
    "SkuSortOrder": skuSortOrder,
    "UserName": userName,
    "TotalAmount": totalAmount,
    "SiteID": siteId,
    "StoreID": storeIdValues.reverse[storeId],
    "AttributeID1": attributeId1,
    "AttributeName1": attributeName1,
    "AttributeID2": attributeId2,
    "AttributeName2": attributeName2,
    "Image": image,
  };
}

enum StoreId { KBL_24 }

final storeIdValues = EnumValues({
  "KBL_24": StoreId.KBL_24
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
