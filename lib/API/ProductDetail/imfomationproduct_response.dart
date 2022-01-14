// To parse this JSON data, do
//
//     final getProductDetailResponse = getProductDetailResponseFromJson(jsonString);

import 'dart:convert';
import 'package:deep_pick/deep_pick.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/screens/Acount/Adress/adressbook.dart';

GetProductDetailResponse getProductDetailResponseFromJson(String str) => GetProductDetailResponse.fromJson(json.decode(str));

String getProductDetailResponseToJson(GetProductDetailResponse data) => json.encode(data.toJson());

class GetProductDetailResponse {
  GetProductDetailResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.homeData,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  HomeData homeData;

  factory GetProductDetailResponse.fromJson(Map<String, dynamic> json) => GetProductDetailResponse(
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
  dynamic favoritelist;
  WebItem webItem;
  List<WebItemRelation> webItemRelation;
  List<WebItemPhotoList> webItemPhotoList;
  dynamic webItemSkuList;
  List<WebItem> productRelationList;
  dynamic webItemPromotionDtoList;
  dynamic news;
  dynamic newsRelationList;
  dynamic collectionList;
  dynamic collectionPhotoList;
  dynamic collection;
  dynamic collectionDetailList;
  dynamic itemPromotonList;
  dynamic itemDtoList;
  dynamic productViewList;
  AddressBook addressBook;
  List<dynamic> reviewTotalList;
  Store store;
  List<SlideDetailList> slideDetailList;
  List<ProductcategoryList> productcategoryList;

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
    albumList: json["albumList"],
    albumPhotoList: json["albumPhotoList"],
    newsList: json["NewsList"],
    videoList: json["VideoList"],
    productList: json["ProductList"],
    textData: json["TextData"],
    productNewList: json["ProductNewList"],
    promotionList: json["PromotionList"],
    favoritelist: json["Favoritelist"],
    webItem: WebItem.fromJson(json["WebItem"]),
    webItemRelation: List<WebItemRelation>.from(json["WebItemRelation"].map((x) => WebItemRelation.fromJson(x))),
    webItemPhotoList: List<WebItemPhotoList>.from(json["WebItemPhotoList"].map((x) => WebItemPhotoList.fromJson(x))),
    webItemSkuList: json["WebItemSkuList"],
    productRelationList: List<WebItem>.from(json["ProductRelationList"].map((x) => WebItem.fromJson(x))),
    webItemPromotionDtoList: json["WebItemPromotionDTOList"],
    news: json["News"],
    newsRelationList: json["NewsRelationList"],
    collectionList: json["CollectionList"],
    collectionPhotoList: json["CollectionPhotoList"],
    collection: json["Collection"],
    collectionDetailList: json["CollectionDetailList"],
    itemPromotonList: json["ItemPromotonList"],
    itemDtoList: json["ItemDTOList"],
    productViewList: json["ProductViewList"],
    addressBook: AddressBook.fromJson(json["AddressBook"]!=null? json ["AddressBook"] : {}),
    reviewTotalList: List<dynamic>.from(json["ReviewTotalList"].map((x) => x)),
    store: Store.fromJson(json["Store"]),
    slideDetailList: List<SlideDetailList>.from(json["SlideDetailList"].map((x) => SlideDetailList.fromJson(x))),
    productcategoryList: List<ProductcategoryList>.from(json["ProductcategoryList"].map((x) => ProductcategoryList.fromJson(x))),
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
    "Favoritelist": favoritelist,
    "WebItem": webItem.toJson(),
    "WebItemRelation": List<dynamic>.from(webItemRelation.map((x) => x.toJson())),
    "WebItemPhotoList": List<dynamic>.from(webItemPhotoList.map((x) => x.toJson())),
    "WebItemSkuList": webItemSkuList,
    "ProductRelationList": List<dynamic>.from(productRelationList.map((x) => x.toJson())),
    "WebItemPromotionDTOList": webItemPromotionDtoList,
    "News": news,
    "NewsRelationList": newsRelationList,
    "CollectionList": collectionList,
    "CollectionPhotoList": collectionPhotoList,
    "Collection": collection,
    "CollectionDetailList": collectionDetailList,
    "ItemPromotonList": itemPromotonList,
    "ItemDTOList": itemDtoList,
    "ProductViewList": productViewList,
    "AddressBook": addressBook.toJson(),
    "ReviewTotalList": List<dynamic>.from(reviewTotalList.map((x) => x)),
    "Store": store.toJson(),
    "SlideDetailList": List<dynamic>.from(slideDetailList.map((x) => x.toJson())),
    "ProductcategoryList": List<dynamic>.from(productcategoryList.map((x) => x.toJson())),
  };
}

class AddressBook {
  AddressBook({
    this.addressId,
    this.objectId,
    this.objectType,
    this.fullName,
    this.cellPhone,
    this.fullAddress,
    this.countryId,
    this.cityId,
    this.districtId,
    this.address,
    this.isDefault,
    this.sortOrder,
    this.locationNameFrom,
    this.locationAddressFrom,
    this.locationCellPhoneFrom,
    this.locationNoteFrom,
    this.locationNameTo,
    this.locationAddressTo,
    this.locationCellPhoneTo,
    this.locationNoteTo,
    this.notes,
    this.paymentNote,
    this.shipCost,
    this.entranceFee,
    this.shipToHomeFee,
    this.wardId,
  });

  String addressId;
  String objectId;
  int objectType;
  String fullName;
  String cellPhone;
  String fullAddress;
  String countryId;
  String cityId;
  String districtId;
  String address;
  bool isDefault;
  double sortOrder;
  dynamic locationNameFrom;
  dynamic locationAddressFrom;
  dynamic locationCellPhoneFrom;
  dynamic locationNoteFrom;
  dynamic locationNameTo;
  dynamic locationAddressTo;
  dynamic locationCellPhoneTo;
  dynamic locationNoteTo;
  dynamic notes;
  dynamic paymentNote;
  double shipCost;
  double entranceFee;
  double shipToHomeFee;
  String wardId;

  factory AddressBook.fromJson(Map<String, dynamic> json) => AddressBook(
    addressId: json["AddressBook"]==null? null:json["AddressID"],
    objectId: json["AddressBook"]==null? null:json["ObjectID"],
    objectType: json["AddressBook"]==null? null:json["ObjectType"],
    fullName: json["AddressBook"]==null? null:json["FullName"],
    cellPhone:json["AddressBook"]==null? null:json["CellPhone"],
    fullAddress:json["AddressBook"]==null? null: json["FullAddress"],
    countryId:json["AddressBook"]==null? null: json["CountryID"],
    cityId: json["AddressBook"]==null? null:json["CityID"],
    districtId: json["AddressBook"]==null? null:json["DistrictID"],
    address: json["AddressBook"]==null? null:json["Address"],
    isDefault: json["AddressBook"]==null? null:json["IsDefault"],
    sortOrder:json["AddressBook"]==null? null: json["SortOrder"].toDouble(),
    locationNameFrom: json["AddressBook"]==null? null:json["LocationNameFrom"],
    locationAddressFrom: json["AddressBook"]==null? null:json["LocationAddressFrom"],
    locationCellPhoneFrom: json["AddressBook"]==null? null:json["LocationCellPhoneFrom"],
    locationNoteFrom: json["AddressBook"]==null? null:json["LocationNoteFrom"],
    locationNameTo: json["AddressBook"]==null? null:json["LocationNameTo"],
    locationAddressTo:json["AddressBook"]==null? null: json["LocationAddressTo"],
    locationCellPhoneTo:json["AddressBook"]==null? null: json["LocationCellPhoneTo"],
    locationNoteTo:json["AddressBook"]==null? null: json["LocationNoteTo"],
    notes: json["AddressBook"]==null? null:json["Notes"],
    paymentNote:json["AddressBook"]==null? null:json["PaymentNote"],
    shipCost:json["AddressBook"]==null? null: json["ShipCost"],
    entranceFee: json["AddressBook"]==null? null:json["EntranceFee"],
    shipToHomeFee:json["AddressBook"]==null? null: json["ShipToHomeFee"],
    wardId: json["AddressBook"]==null? null:json["WardID"],
  );

  Map<String, dynamic> toJson() => {
    "AddressID": addressId,
    "ObjectID": objectId,
    "ObjectType": objectType,
    "FullName": fullName,
    "CellPhone": cellPhone,
    "FullAddress": fullAddress,
    "CountryID": countryId,
    "CityID": cityId,
    "DistrictID": districtId,
    "Address": address,
    "IsDefault": isDefault,
    "SortOrder": sortOrder,
    "LocationNameFrom": locationNameFrom,
    "LocationAddressFrom": locationAddressFrom,
    "LocationCellPhoneFrom": locationCellPhoneFrom,
    "LocationNoteFrom": locationNoteFrom,
    "LocationNameTo": locationNameTo,
    "LocationAddressTo": locationAddressTo,
    "LocationCellPhoneTo": locationCellPhoneTo,
    "LocationNoteTo": locationNoteTo,
    "Notes": notes,
    "PaymentNote": paymentNote,
    "ShipCost": shipCost,
    "EntranceFee": entranceFee,
    "ShipToHomeFee": shipToHomeFee,
    "WardID": wardId,
  };
}

class WebItem {
  WebItem({
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

  factory WebItem.fromJson(Map<String, dynamic> json) => WebItem(
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

enum Code { KBL_24 }

final codeValues = EnumValues({
  "KBL_24": Code.KBL_24
});

class ProductcategoryList {
  ProductcategoryList({
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

  factory ProductcategoryList.fromJson(Map<String, dynamic> json) => ProductcategoryList(
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

class WebItemPhotoList {
  WebItemPhotoList({
    this.itemPhotoId,
    this.itemId,
    this.image,
    this.sortOrder,
    this.isDeleted,
  });

  String itemPhotoId;
  String itemId;
  String image;
  int sortOrder;
  bool isDeleted;

  factory WebItemPhotoList.fromJson(Map<String, dynamic> json) => WebItemPhotoList(
    itemPhotoId: json["ItemPhotoID"],
    itemId: json["ItemID"],
    image: json["Image"],
    sortOrder: json["SortOrder"],
    isDeleted: json["IsDeleted"],
  );

  Map<String, dynamic> toJson() => {
    "ItemPhotoID": itemPhotoId,
    "ItemID": itemId,
    "Image": image,
    "SortOrder": sortOrder,
    "IsDeleted": isDeleted,
  };
}

class WebItemRelation {
  WebItemRelation({
    this.siteId,
    this.itemId,
    this.itemRelationId,
    this.name,
    this.price,
    this.specialPrice,
    this.code,
    this.skuId,
    this.salePrice,
    this.orgPrice,
    this.sortOrder,
    this.image,
    this.reviewCount,
    this.reviewValue,
  });

  int siteId;
  String itemId;
  String itemRelationId;
  String name;
  double price;
  double specialPrice;
  String code;
  String skuId;
  double salePrice;
  double orgPrice;
  int sortOrder;
  String image;
  int reviewCount;
  double reviewValue;

  factory WebItemRelation.fromJson(Map<String, dynamic> json) => WebItemRelation(
    siteId: json["SiteID"],
    itemId: json["ItemID"],
    itemRelationId: json["ItemRelationID"],
    name: json["Name"],
    price: json["Price"],
    specialPrice: json["SpecialPrice"],
    code: json["Code"],
    skuId: json["SkuID"],
    salePrice: json["SalePrice"],
    orgPrice: json["OrgPrice"],
    sortOrder: json["SortOrder"],
    image: json["Image"],
    reviewCount: json["ReviewCount"],
    reviewValue: json["ReviewValue"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "SiteID": siteId,
    "ItemID": itemId,
    "ItemRelationID": itemRelationId,
    "Name": name,
    "Price": price,
    "SpecialPrice": specialPrice,
    "Code": code,
    "SkuID": skuId,
    "SalePrice": salePrice,
    "OrgPrice": orgPrice,
    "SortOrder": sortOrder,
    "Image": image,
    "ReviewCount": reviewCount,
    "ReviewValue": reviewValue,
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
