// To parse this JSON data, do
//
//     final getNewDetailResponse = getNewDetailResponseFromJson(jsonString);

import 'dart:convert';

GetNewDetailResponse getNewDetailResponseFromJson(String str) => GetNewDetailResponse.fromJson(json.decode(str));

String getNewDetailResponseToJson(GetNewDetailResponse data) => json.encode(data.toJson());

class GetNewDetailResponse {
  GetNewDetailResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.news,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  News news;

  factory GetNewDetailResponse.fromJson(Map<String, dynamic> json) => GetNewDetailResponse(
    statusId: json["StatusID"],
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
    news: News.fromJson(json["News"]),
  );

  Map<String, dynamic> toJson() => {
    "StatusID": statusId,
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
    "News": news.toJson(),
  };
}

class News {
  News({
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

  factory News.fromJson(Map<String, dynamic> json) => News(
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
