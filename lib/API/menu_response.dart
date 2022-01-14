// To parse this JSON data, do
//
//     final menuResponse = menuResponseFromJson(jsonString);

import 'dart:convert';

MenuResponse menuResponseFromJson(String str) => MenuResponse.fromJson(json.decode(str));

String menuResponseToJson(MenuResponse data) => json.encode(data.toJson());

class MenuResponse {
  MenuResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.homeData,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  HomeData homeData;

  factory MenuResponse.fromJson(Map<String, dynamic> json) => MenuResponse(
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
    this.albumList,
    this.albumPhotoList,
    this.newsList,
    this.videoList,
    this.productList,
    this.textData,
    this.productNewList,
    this.promotionList,
    this.favoritelist,
    this.webItem,
    this.webItemRelation,
    this.webItemPhotoList,
    this.webItemSkuList,
    this.productRelationList,
    this.webItemPromotionDtoList,
    this.news,
    this.newsRelationList,
    this.collectionList,
    this.collectionPhotoList,
    this.collection,
    this.collectionDetailList,
    this.itemPromotonList,
    this.itemDtoList,
    this.productViewList,
    this.addressBook,
    this.reviewTotalList,
    this.store,
    this.slideDetailList,
    this.productcategoryList,
  });

  dynamic albumList;
  dynamic albumPhotoList;
  dynamic newsList;
  dynamic videoList;
  dynamic productList;
  dynamic textData;
  dynamic productNewList;
  dynamic promotionList;
  List<Favoritelist> favoritelist;
  dynamic webItem;
  dynamic webItemRelation;
  dynamic webItemPhotoList;
  dynamic webItemSkuList;
  dynamic productRelationList;
  dynamic webItemPromotionDtoList;
  dynamic news;
  dynamic newsRelationList;
  dynamic collectionList;
  dynamic collectionPhotoList;
  dynamic collection;
  dynamic collectionDetailList;
  dynamic itemPromotonList;
  List<ItemDtoList> itemDtoList;
  dynamic productViewList;
  dynamic addressBook;
  dynamic reviewTotalList;
  Store store;
  List<SlideDetailList> slideDetailList;
  dynamic productcategoryList;

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
    albumList: json["albumList"],
    albumPhotoList: json["albumPhotoList"],
    newsList: json["NewsList"],
    videoList: json["VideoList"],
    productList: json["ProductList"],
    textData: json["TextData"],
    productNewList: json["ProductNewList"],
    promotionList: json["PromotionList"],
    favoritelist: List<Favoritelist>.from(json["Favoritelist"].map((x) => Favoritelist.fromJson(x))),
    webItem: json["WebItem"],
    webItemRelation: json["WebItemRelation"],
    webItemPhotoList: json["WebItemPhotoList"],
    webItemSkuList: json["WebItemSkuList"],
    productRelationList: json["ProductRelationList"],
    webItemPromotionDtoList: json["WebItemPromotionDTOList"],
    news: json["News"],
    newsRelationList: json["NewsRelationList"],
    collectionList: json["CollectionList"],
    collectionPhotoList: json["CollectionPhotoList"],
    collection: json["Collection"],
    collectionDetailList: json["CollectionDetailList"],
    itemPromotonList: json["ItemPromotonList"],
    itemDtoList: List<ItemDtoList>.from(json["ItemDTOList"].map((x) => ItemDtoList.fromJson(x))),
    productViewList: json["ProductViewList"],
    addressBook: json["AddressBook"],
    reviewTotalList: json["ReviewTotalList"],
    store: Store.fromJson(json["Store"]),
    slideDetailList: List<SlideDetailList>.from(json["SlideDetailList"].map((x) => SlideDetailList.fromJson(x))),
    productcategoryList: json["ProductcategoryList"],
  );

  Map<String, dynamic> toJson() => {
    "albumList": albumList,
    "albumPhotoList": albumPhotoList,
    "NewsList": newsList,
    "VideoList": videoList,
    "ProductList": productList,
    "TextData": textData,
    "ProductNewList": productNewList,
    "PromotionList": promotionList,
    "Favoritelist": List<dynamic>.from(favoritelist.map((x) => x.toJson())),
    "WebItem": webItem,
    "WebItemRelation": webItemRelation,
    "WebItemPhotoList": webItemPhotoList,
    "WebItemSkuList": webItemSkuList,
    "ProductRelationList": productRelationList,
    "WebItemPromotionDTOList": webItemPromotionDtoList,
    "News": news,
    "NewsRelationList": newsRelationList,
    "CollectionList": collectionList,
    "CollectionPhotoList": collectionPhotoList,
    "Collection": collection,
    "CollectionDetailList": collectionDetailList,
    "ItemPromotonList": itemPromotonList,
    "ItemDTOList": List<dynamic>.from(itemDtoList.map((x) => x.toJson())),
    "ProductViewList": productViewList,
    "AddressBook": addressBook,
    "ReviewTotalList": reviewTotalList,
    "Store": store.toJson(),
    "SlideDetailList": List<dynamic>.from(slideDetailList.map((x) => x.toJson())),
    "ProductcategoryList": productcategoryList,
  };
}

class Favoritelist {
  Favoritelist({
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
  Code storeId;
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

  factory Favoritelist.fromJson(Map<String, dynamic> json) => Favoritelist(
    siteId: json["SiteID"],
    storeId: codeValues.map[json["StoreID"]],
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
    reviewValue: json["ReviewValue"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "SiteID": siteId,
    "StoreID": codeValues.reverse[storeId],
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

enum Code { KBL_24 }

final codeValues = EnumValues({
  "KBL_24": Code.KBL_24
});

class ItemDtoList {
  ItemDtoList({
    this.categoryRoot,
    this.itemList,
    this.relationList,
    this.suggestList,
  });

  Category categoryRoot;
  List<ItemList> itemList;
  dynamic relationList;
  dynamic suggestList;

  factory ItemDtoList.fromJson(Map<String, dynamic> json) => ItemDtoList(
    categoryRoot: Category.fromJson(json["CategoryRoot"]),
    itemList: List<ItemList>.from(json["ItemList"].map((x) => ItemList.fromJson(x))),
    relationList: json["RelationList"],
    suggestList: json["SuggestList"],
  );

  Map<String, dynamic> toJson() => {
    "CategoryRoot": categoryRoot.toJson(),
    "ItemList": List<dynamic>.from(itemList.map((x) => x.toJson())),
    "RelationList": relationList,
    "SuggestList": suggestList,
  };
}

class Category {
  Category({
    this.productCategoryId,
    this.categoryName,
    this.description,
    this.siteId,
    this.storeId,
    this.appId,
    this.isActive,
    this.sortOrder,
    this.searchString,
    this.parentId,
    this.photo,
    this.isNew,
    this.iconApp,
    this.iconWeb,
  });

  String productCategoryId;
  String categoryName;
  String description;
  int siteId;
  Code storeId;
  int appId;
  bool isActive;
  double sortOrder;
  String searchString;
  String parentId;
  String photo;
  bool isNew;
  String iconApp;
  String iconWeb;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    productCategoryId: json["ProductCategoryID"],
    categoryName: json["CategoryName"],
    description: json["Description"] == null ? null : json["Description"],
    siteId: json["SiteID"],
    storeId: codeValues.map[json["StoreID"]],
    appId: json["AppID"],
    isActive: json["IsActive"],
    sortOrder: json["SortOrder"].toDouble(),
    searchString: json["SearchString"],
    parentId: json["ParentID"] == null ? null : json["ParentID"],
    photo: json["Photo"] == null ? null : json["Photo"],
    isNew: json["IsNew"],
    iconApp: json["IconApp"],
    iconWeb: json["IconWeb"],
  );

  Map<String, dynamic> toJson() => {
    "ProductCategoryID": productCategoryId,
    "CategoryName": categoryName,
    "Description": description == null ? null : description,
    "SiteID": siteId,
    "StoreID": codeValues.reverse[storeId],
    "AppID": appId,
    "IsActive": isActive,
    "SortOrder": sortOrder,
    "SearchString": searchString,
    "ParentID": parentId == null ? null : parentId,
    "Photo": photo == null ? null : photo,
    "IsNew": isNew,
    "IconApp": iconApp,
    "IconWeb": iconWeb,
  };
}

class ItemList {
  ItemList({
    this.category,
    this.productList,
  });

  Category category;
  List<ProductList> productList;

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
    category: Category.fromJson(json["Category"]),
    productList: json["ProductList"] == null ? null : List<ProductList>.from(json["ProductList"].map((x) => ProductList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Category": category.toJson(),
    "ProductList": productList == null ? null : List<dynamic>.from(productList.map((x) => x.toJson())),
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
  Code storeId;
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
    storeId: codeValues.map[json["StoreID"]],
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
    reviewValue: json["ReviewValue"],
  );

  Map<String, dynamic> toJson() => {
    "ItemID": itemId,
    "Name": name,
    "Price": price,
    "SpecialPrice": specialPrice,
    "Code": code,
    "SiteID": siteId,
    "StoreID": codeValues.reverse[storeId],
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

class SlideDetailList {
  SlideDetailList({
    this.slideId,
    this.siteId,
    this.storeId,
    this.slideType,
    this.link,
    this.comment,
    this.isActive,
    this.title,
    this.image,
    this.sortOrder,
  });

  int slideId;
  int siteId;
  Code storeId;
  String slideType;
  dynamic link;
  dynamic comment;
  bool isActive;
  String title;
  String image;
  int sortOrder;

  factory SlideDetailList.fromJson(Map<String, dynamic> json) => SlideDetailList(
    slideId: json["SlideID"],
    siteId: json["SiteID"],
    storeId: codeValues.map[json["StoreID"]],
    slideType: json["SlideType"],
    link: json["Link"],
    comment: json["Comment"],
    isActive: json["IsActive"],
    title: json["Title"],
    image: json["Image"],
    sortOrder: json["SortOrder"],
  );

  Map<String, dynamic> toJson() => {
    "SlideID": slideId,
    "SiteID": siteId,
    "StoreID": codeValues.reverse[storeId],
    "SlideType": slideType,
    "Link": link,
    "Comment": comment,
    "IsActive": isActive,
    "Title": title,
    "Image": image,
    "SortOrder": sortOrder,
  };
}

class Store {
  Store({
    this.storeId,
    this.code,
    this.siteId,
    this.name,
    this.address,
    this.city,
    this.provinceName,
    this.phoneNumber,
    this.faxNumber,
    this.taxNumber,
    this.email,
    this.posNumber,
    this.retailNumber,
    this.regionId,
    this.logo,
    this.createdDate,
    this.createdBy,
    this.notes,
    this.prefix,
    this.isMain,
    this.isActive,
    this.ownerId,
    this.storeNumber,
    this.sortOrder,
    this.storeType,
    this.appId,
    this.guiid,
    this.linkFacebook,
    this.linkYoutube,
    this.linkTwitter,
    this.linkInstagram,
    this.linkZalo,
    this.email2,
    this.logan,
    this.latitue,
    this.longitue,
    this.copyright,
    this.salePhone,
    this.saleEmail,
    this.purchasePhone,
    this.purchaseEmail,
    this.accountantPhone,
    this.accountantEmail,
    this.facebookPageId,
    this.facebookGreetingIn,
    this.facebookGreetingOut,
    this.zaloShopId,
    this.qrCode,
    this.saleInvoices,
  });

  Code storeId;
  Code code;
  int siteId;
  String name;
  String address;
  dynamic city;
  dynamic provinceName;
  String phoneNumber;
  dynamic faxNumber;
  dynamic taxNumber;
  String email;
  int posNumber;
  int retailNumber;
  dynamic regionId;
  String logo;
  DateTime createdDate;
  dynamic createdBy;
  dynamic notes;
  String prefix;
  bool isMain;
  bool isActive;
  dynamic ownerId;
  int storeNumber;
  dynamic sortOrder;
  int storeType;
  String appId;
  String guiid;
  dynamic linkFacebook;
  dynamic linkYoutube;
  dynamic linkTwitter;
  dynamic linkInstagram;
  dynamic linkZalo;
  dynamic email2;
  dynamic logan;
  dynamic latitue;
  dynamic longitue;
  dynamic copyright;
  dynamic salePhone;
  dynamic saleEmail;
  String purchasePhone;
  String purchaseEmail;
  dynamic accountantPhone;
  dynamic accountantEmail;
  dynamic facebookPageId;
  dynamic facebookGreetingIn;
  dynamic facebookGreetingOut;
  dynamic zaloShopId;
  String qrCode;
  List<dynamic> saleInvoices;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    storeId: codeValues.map[json["StoreID"]],
    code: codeValues.map[json["Code"]],
    siteId: json["SiteID"],
    name: json["Name"],
    address: json["Address"],
    city: json["City"],
    provinceName: json["ProvinceName"],
    phoneNumber: json["PhoneNumber"],
    faxNumber: json["FaxNumber"],
    taxNumber: json["TaxNumber"],
    email: json["Email"],
    posNumber: json["PosNumber"],
    retailNumber: json["RetailNumber"],
    regionId: json["RegionID"],
    logo: json["Logo"],
    createdDate: DateTime.parse(json["CreatedDate"]),
    createdBy: json["CreatedBy"],
    notes: json["Notes"],
    prefix: json["Prefix"],
    isMain: json["IsMain"],
    isActive: json["IsActive"],
    ownerId: json["OwnerID"],
    storeNumber: json["StoreNumber"],
    sortOrder: json["SortOrder"],
    storeType: json["StoreType"],
    appId: json["AppID"],
    guiid: json["GUIID"],
    linkFacebook: json["LinkFacebook"],
    linkYoutube: json["LinkYoutube"],
    linkTwitter: json["LinkTwitter"],
    linkInstagram: json["LinkInstagram"],
    linkZalo: json["LinkZalo"],
    email2: json["Email2"],
    logan: json["Logan"],
    latitue: json["Latitue"],
    longitue: json["Longitue"],
    copyright: json["Copyright"],
    salePhone: json["SalePhone"],
    saleEmail: json["SaleEmail"],
    purchasePhone: json["PurchasePhone"],
    purchaseEmail: json["PurchaseEmail"],
    accountantPhone: json["AccountantPhone"],
    accountantEmail: json["AccountantEmail"],
    facebookPageId: json["FacebookPageID"],
    facebookGreetingIn: json["FacebookGreetingIn"],
    facebookGreetingOut: json["FacebookGreetingOut"],
    zaloShopId: json["ZaloShopID"],
    qrCode: json["QRCode"],
    saleInvoices: List<dynamic>.from(json["SaleInvoices"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "StoreID": codeValues.reverse[storeId],
    "Code": codeValues.reverse[code],
    "SiteID": siteId,
    "Name": name,
    "Address": address,
    "City": city,
    "ProvinceName": provinceName,
    "PhoneNumber": phoneNumber,
    "FaxNumber": faxNumber,
    "TaxNumber": taxNumber,
    "Email": email,
    "PosNumber": posNumber,
    "RetailNumber": retailNumber,
    "RegionID": regionId,
    "Logo": logo,
    "CreatedDate": createdDate.toIso8601String(),
    "CreatedBy": createdBy,
    "Notes": notes,
    "Prefix": prefix,
    "IsMain": isMain,
    "IsActive": isActive,
    "OwnerID": ownerId,
    "StoreNumber": storeNumber,
    "SortOrder": sortOrder,
    "StoreType": storeType,
    "AppID": appId,
    "GUIID": guiid,
    "LinkFacebook": linkFacebook,
    "LinkYoutube": linkYoutube,
    "LinkTwitter": linkTwitter,
    "LinkInstagram": linkInstagram,
    "LinkZalo": linkZalo,
    "Email2": email2,
    "Logan": logan,
    "Latitue": latitue,
    "Longitue": longitue,
    "Copyright": copyright,
    "SalePhone": salePhone,
    "SaleEmail": saleEmail,
    "PurchasePhone": purchasePhone,
    "PurchaseEmail": purchaseEmail,
    "AccountantPhone": accountantPhone,
    "AccountantEmail": accountantEmail,
    "FacebookPageID": facebookPageId,
    "FacebookGreetingIn": facebookGreetingIn,
    "FacebookGreetingOut": facebookGreetingOut,
    "ZaloShopID": zaloShopId,
    "QRCode": qrCode,
    "SaleInvoices": List<dynamic>.from(saleInvoices.map((x) => x)),
  };
}

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
