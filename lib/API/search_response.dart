// To parse this JSON data, do
//
//     final searchProductResponse = searchProductResponseFromJson(jsonString);

import 'dart:convert';

SearchProductResponse searchProductResponseFromJson(String str) => SearchProductResponse.fromJson(json.decode(str));

String searchProductResponseToJson(SearchProductResponse data) => json.encode(data.toJson());

class SearchProductResponse {
  SearchProductResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.homeData,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  HomeData homeData;

  factory SearchProductResponse.fromJson(Map<String, dynamic> json) => SearchProductResponse(
    statusId: json["StatusID"],
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
    homeData: HomeData.fromJson(json["HomeData"]),
  );

  Map<String, dynamic> toJson() => {
    "StatusID": statusId,
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
    "HomeData": homeData.toJson(),
  };
}

class HomeData {
  HomeData({
    this.productList,
    this.slideDetailList,
    this.productcategoryList,
  });

  List<ProductList> productList;
  dynamic slideDetailList;
  dynamic productcategoryList;

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
    productList: List<ProductList>.from(json["ProductList"].map((x) => ProductList.fromJson(x))),
    slideDetailList: json["SlideDetailList"],
    productcategoryList: json["ProductcategoryList"],
  );

  Map<String, dynamic> toJson() => {
    "ProductList": List<dynamic>.from(productList.map((x) => x.toJson())),
    "SlideDetailList": slideDetailList,
    "ProductcategoryList": productcategoryList,
  };
}

class ProductList {
  ProductList({
    this.itemId,
    this.name,
    this.price,
    this.specialPrice,
    this.code,
    this.siteId,
    this.storeId,
    this.brandId,
    this.description,
    this.createdDate,
    this.categoryId,
    this.searchString,
    this.sortOrder,
    this.isNew,
    this.tagName,
    this.image,
    this.secondImage,
    this.skuId,
    this.salePrice,
    this.orgPrice,
    this.isFavorite,
    this.reviewCount,
    this.reviewValue,
  });

  String itemId;
  String name;
  double price;
  double specialPrice;
  String code;
  int siteId;
  StoreId storeId;
  int brandId;
  String description;
  DateTime createdDate;
  String categoryId;
  String searchString;
  int sortOrder;
  bool isNew;
  String tagName;
  String image;
  String secondImage;
  String skuId;
  double salePrice;
  double orgPrice;
  bool isFavorite;
  int reviewCount;
  double reviewValue;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    itemId: json["ItemID"],
    name: json["Name"],
    price: json["Price"],
    specialPrice: json["SpecialPrice"],
    code: json["Code"],
    siteId: json["SiteID"],
    storeId: storeIdValues.map[json["StoreID"]],
    brandId: json["BrandID"],
    description: json["Description"],
    createdDate: DateTime.parse(json["CreatedDate"]),
    categoryId: json["CategoryID"],
    searchString: json["SearchString"],
    sortOrder: json["SortOrder"],
    isNew: json["IsNew"],
    tagName: json["TagName"],
    image: json["Image"],
    secondImage: json["SecondImage"],
    skuId: json["SkuID"],
    salePrice: json["SalePrice"],
    orgPrice: json["OrgPrice"],
    isFavorite: json["IsFavorite"],
    reviewCount: json["ReviewCount"],
    reviewValue: json["ReviewValue"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "ItemID": itemId,
    "Name": name,
    "Price": price,
    "SpecialPrice": specialPrice,
    "Code": code,
    "SiteID": siteId,
    "StoreID": storeIdValues.reverse[storeId],
    "BrandID": brandId,
    "Description": description,
    "CreatedDate": createdDate.toIso8601String(),
    "CategoryID": categoryId,
    "SearchString": searchString,
    "SortOrder": sortOrder,
    "IsNew": isNew,
    "TagName": tagName,
    "Image": image,
    "SecondImage": secondImage,
    "SkuID": skuId,
    "SalePrice": salePrice,
    "OrgPrice": orgPrice,
    "IsFavorite": isFavorite,
    "ReviewCount": reviewCount,
    "ReviewValue": reviewValue,
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
