// To parse this JSON data, do
//
//     final getAllDistricResponse = getAllDistricResponseFromJson(jsonString);

import 'dart:convert';

GetAllDistricResponse getAllDistricResponseFromJson(String str) => GetAllDistricResponse.fromJson(json.decode(str));

String getAllDistricResponseToJson(GetAllDistricResponse data) => json.encode(data.toJson());

class GetAllDistricResponse {
  GetAllDistricResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.districtList,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  List<DistrictList> districtList;

  factory GetAllDistricResponse.fromJson(Map<String, dynamic> json) => GetAllDistricResponse(
    statusId: json["StatusID"],
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
    districtList: List<DistrictList>.from(json["DistrictList"].map((x) => DistrictList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "StatusID": statusId,
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
    "DistrictList": List<dynamic>.from(districtList.map((x) => x.toJson())),
  };
}

class DistrictList {
  DistrictList({
    this.districtId,
    this.districtName,
    this.cityId,
    this.sortOrder,
  });

  String districtId;
  String districtName;
  String cityId;
  int sortOrder;

  factory DistrictList.fromJson(Map<String, dynamic> json) => DistrictList(
    districtId: json["DistrictID"],
    districtName: json["DistrictName"],
    cityId: json["CityID"],
    sortOrder: json["SortOrder"],
  );

  Map<String, dynamic> toJson() => {
    "DistrictID": districtId,
    "DistrictName": districtName,
    "CityID": cityId,
    "SortOrder": sortOrder,
  };
}
