// To parse this JSON data, do
//
//     final getNewListResponse = getNewListResponseFromJson(jsonString);

import 'dart:convert';

GetNewListResponse getNewListResponseFromJson(String str) => GetNewListResponse.fromJson(json.decode(str));

String getNewListResponseToJson(GetNewListResponse data) => json.encode(data.toJson());

class GetNewListResponse {
  GetNewListResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.newsList,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  List<NewsList> newsList;

  factory GetNewListResponse.fromJson(Map<String, dynamic> json) => GetNewListResponse(
    statusId: json["StatusID"],
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
    newsList: List<NewsList>.from(json["NewsList"].map((x) => NewsList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "StatusID": statusId,
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
    "NewsList": List<dynamic>.from(newsList.map((x) => x.toJson())),
  };
}

class NewsList {
  NewsList({
    this.newsId,
    this.siteId,
    this.storeId,
    this.newsTitle,
    this.shortDescription,
    this.longDescription,
    this.viewCount,
    this.createdDate,
    this.createdBy,
    this.publishDate,
    this.isActive,
    this.image,
    this.tag,
    this.searchString,
    this.newsType,
  });

  String newsId;
  int siteId;
  String storeId;
  String newsTitle;
  String shortDescription;
  String longDescription;
  int viewCount;
  DateTime createdDate;
  String createdBy;
  DateTime publishDate;
  bool isActive;
  String image;
  String tag;
  String searchString;
  int newsType;

  factory NewsList.fromJson(Map<String, dynamic> json) => NewsList(
    newsId: json["NewsID"],
    siteId: json["SiteID"],
    storeId: json["StoreID"],
    newsTitle: json["NewsTitle"],
    shortDescription: json["ShortDescription"],
    longDescription: json["LongDescription"],
    viewCount: json["ViewCount"],
    createdDate: DateTime.parse(json["CreatedDate"]),
    createdBy: json["CreatedBy"],
    publishDate: DateTime.parse(json["PublishDate"]),
    isActive: json["IsActive"],
    image: json["Image"],
    tag: json["Tag"],
    searchString: json["SearchString"],
    newsType: json["NewsType"],
  );

  Map<String, dynamic> toJson() => {
    "NewsID": newsId,
    "SiteID": siteId,
    "StoreID": storeId,
    "NewsTitle": newsTitle,
    "ShortDescription": shortDescription,
    "LongDescription": longDescription,
    "ViewCount": viewCount,
    "CreatedDate": createdDate.toIso8601String(),
    "CreatedBy": createdBy,
    "PublishDate": publishDate.toIso8601String(),
    "IsActive": isActive,
    "Image": image,
    "Tag": tag,
    "SearchString": searchString,
    "NewsType": newsType,
  };
}
