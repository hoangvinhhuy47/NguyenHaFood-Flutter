// To parse this JSON data, do
//
//     final getPromotionCodeResponse = getPromotionCodeResponseFromJson(jsonString);

import 'dart:convert';

GetPromotionCodeResponse getPromotionCodeResponseFromJson(String str) =>
    GetPromotionCodeResponse.fromJson(json.decode(str));

String getPromotionCodeResponseToJson(GetPromotionCodeResponse data) =>
    json.encode(data.toJson());

class GetPromotionCodeResponse {
  GetPromotionCodeResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.promotion,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  GetPromotionCodeResponsePromotion promotion;

  factory GetPromotionCodeResponse.fromJson(Map<String, dynamic> json) =>
      GetPromotionCodeResponse(
        statusId: json["StatusID"],
        errorCode: json["ErrorCode"],
        errorDescription: json["ErrorDescription"],
        promotion: json["StatusID"] == 1
            ? GetPromotionCodeResponsePromotion.fromJson(
            json["Promotion"] != null ? json["Promotion"] : null)
            : null,
      );

  Map<String, dynamic> toJson() =>
      {
        "StatusID": statusId,
        "ErrorCode": errorCode,
        "ErrorDescription": errorDescription,
        "Promotion": promotion.toJson(),
      };
}

class GetPromotionCodeResponsePromotion {
  GetPromotionCodeResponsePromotion({
    this.promotion,
    this.promotionItems,
    this.promotionItemGifs,
    this.promotionType,
  });

  PromotionPromotion promotion;
  List<PromotionItem> promotionItems;
  List<PromotionItemGif> promotionItemGifs;
  int promotionType;

  factory GetPromotionCodeResponsePromotion.fromJson(
      Map<String, dynamic> json) =>
      GetPromotionCodeResponsePromotion(
        promotion: PromotionPromotion.fromJson(
            json["Promotion"] != null ? json["Promotion"] : null),
        promotionItems: List<PromotionItem>.from(
            (json["PromotionItems"] != null ? json["PromotionItems"] : []).map((
                x) => PromotionItem.fromJson(x))),
        promotionItemGifs: List<PromotionItemGif>.from(
            (json["PromotionItemGifs"] != null ? json["PromotionItemGifs"] : [])
                .map((x) => PromotionItemGif.fromJson(x))),
        promotionType: json["PromotionType"],

      );

  Map<String, dynamic> toJson() =>
      {
        "Promotion": promotion.toJson(),
        "PromotionItems": List<dynamic>.from(
            promotionItems.map((x) => x.toJson())),
        "PromotionItemGifs": List<dynamic>.from(
            promotionItemGifs.map((x) => x.toJson())),
        "PromotionType": promotionType,
      };
}

class PromotionPromotion {
  PromotionPromotion({
    this.promotionId,
    this.promotionCode,
    this.discountAmount,
    this.discountPercent,
    this.isRecurrence,
    this.isMembership,
  });

  String promotionId;
  String promotionCode;
  double discountAmount;
  double discountPercent;
  bool isRecurrence;
  bool isMembership;

  factory PromotionPromotion.fromJson(Map<String, dynamic> json) =>
      PromotionPromotion(
        promotionId: json["PromotionID"],
        promotionCode: json["PromotionCode"],
        discountAmount: json["DiscountAmount"],
        discountPercent: json["DiscountPercent"],
        isRecurrence: json["IsRecurrence"],
        isMembership: json["IsMembership"],
      );

  Map<String, dynamic> toJson() =>
      {
        "PromotionID": promotionId,
        "PromotionCode": promotionCode,
        "DiscountAmount": discountAmount,
        "DiscountPercent": discountPercent,
        "IsRecurrence": isRecurrence,
        "IsMembership": isMembership,
      };
}

class PromotionItemGif {
  PromotionItemGif({
    this.promotionBenefitId,
    this.promotionId,
    this.productId,
    this.discountQuantity,
    this.barcode,
    this.productCode,
    this.productName,
    this.storeId,
    this.appId,
    this.itemName,
    this.skuId,
    this.price,
    this.attributeName1,
    this.attributeName2,
    this.image,
  });

  String promotionBenefitId;
  String promotionId;
  String productId;
  double discountQuantity;
  String barcode;
  String productCode;
  String productName;
  String storeId;
  int appId;
  String itemName;
  String skuId;
  double price;
  dynamic attributeName1;
  dynamic attributeName2;
  String image;

  factory PromotionItemGif.fromJson(Map<String, dynamic> json) =>
      PromotionItemGif(
        promotionBenefitId: json["PromotionBenefitID"],
        promotionId: json["PromotionID"],
        productId: json["ProductID"],
        discountQuantity: json["DiscountQuantity"],
        barcode: json["Barcode"],
        productCode: json["ProductCode"],
        productName: json["ProductName"],
        storeId: json["StoreID"],
        appId: json["AppID"],
        itemName: json["ItemName"] == null ? null : json["ItemName"],
        skuId: json["SkuID"] == null ? null : json["SkuID"],
        price: json["Price"] == null ? null : json["Price"],
        attributeName1: json["AttributeName1"],
        attributeName2: json["AttributeName2"],
        image: json["Image"] == null ? null : json["Image"],
      );

  Map<String, dynamic> toJson() =>
      {
        "PromotionBenefitID": promotionBenefitId,
        "PromotionID": promotionId,
        "ProductID": productId,
        "DiscountQuantity": discountQuantity,
        "Barcode": barcode,
        "ProductCode": productCode,
        "ProductName": productName,
        "StoreID": storeId,
        "AppID": appId,
        "ItemName": itemName == null ? null : itemName,
        "SkuID": skuId == null ? null : skuId,
        "Price": price == null ? null : price,
        "AttributeName1": attributeName1,
        "AttributeName2": attributeName2,
        "Image": image == null ? null : image,
      };
}

class PromotionItem {
  PromotionItem({
    this.promotionId,
    this.productId,
    this.quantity,
    this.discountpercent,
    this.discountamount,
  });

  String promotionId;
  String productId;
  double quantity;
  double discountpercent;
  double discountamount;

  factory PromotionItem.fromJson(Map<String, dynamic> json) =>
      PromotionItem(
        promotionId: json["PromotionID"],
        productId: json["ProductID"],
        quantity: json["Quantity"],
        discountpercent: json["DiscountPercent"],
        discountamount: json["DiscountAmount"],
      );

  Map<String, dynamic> toJson() =>
      {
        "PromotionID": promotionId,
        "ProductID": productId,
        "Quantity": quantity,
        "DiscountPercent": discountpercent,
        "DiscountAmount": discountamount,
      };
}
