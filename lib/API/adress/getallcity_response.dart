// To parse this JSON data, do
//
//     final getAllCityResponse = getAllCityResponseFromJson(jsonString);

import 'dart:convert';

GetAllCityResponse getAllCityResponseFromJson(String str) => GetAllCityResponse.fromJson(json.decode(str));

String getAllCityResponseToJson(GetAllCityResponse data) => json.encode(data.toJson());

class GetAllCityResponse {
  GetAllCityResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.cityList,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  List<CityList> cityList;

  factory GetAllCityResponse.fromJson(Map<String, dynamic> json) => GetAllCityResponse(
    statusId: json["StatusID"],
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
    cityList: List<CityList>.from(json["CityList"].map((x) => CityList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "StatusID": statusId,
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
    "CityList": List<dynamic>.from(cityList.map((x) => x.toJson())),
  };
}

class CityList {
  CityList({
    this.cityId,
    this.cityName,
    this.countryId,
    this.sortOrder,
  });

  String cityId;
  String cityName;
  String countryId;
  int sortOrder;

  factory CityList.fromJson(Map<String, dynamic> json) => CityList(
    cityId: json["CityID"],
    cityName: json["CityName"],
    countryId: json["CountryID"],
    sortOrder: json["SortOrder"],
  );

  Map<String, dynamic> toJson() => {
    "CityID": cityId,
    "CityName": cityName,
    "CountryID": countryId,
    "SortOrder": sortOrder,
  };
}
