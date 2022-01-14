// To parse this JSON data, do
//
//     final getProductByCategoryResponse = getProductByCategoryResponseFromJson(jsonString);

import 'dart:convert';

GetProductByCategoryResponse getProductByCategoryResponseFromJson(String str) => GetProductByCategoryResponse.fromJson(json.decode(str));

String getProductByCategoryResponseToJson(GetProductByCategoryResponse data) => json.encode(data.toJson());

class GetProductByCategoryResponse {
  GetProductByCategoryResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.homeData,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  HomeData homeData;

  factory GetProductByCategoryResponse.fromJson(Map<String, dynamic> json) => GetProductByCategoryResponse(
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
  });

  List<ProductListMenu> productList;

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
    productList: List<ProductListMenu>.from(json["ProductList"].map((x) => ProductListMenu.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ProductList": List<dynamic>.from(productList.map((x) => x.toJson())),
  };
}

class ProductListMenu {
  ProductListMenu({
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
  String storeId;
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

  factory ProductListMenu.fromJson(Map<String, dynamic> json) => ProductListMenu(
    itemId: json["ItemID"],
    name: json["Name"],
    price: json["Price"],
    specialPrice: json["SpecialPrice"],
    code: json["Code"],
    siteId: json["SiteID"],
    storeId: json["StoreID"],
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
    "StoreID": storeId,
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
