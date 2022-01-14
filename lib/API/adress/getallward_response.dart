// To parse this JSON data, do
//
//     final getAllWardResponse = getAllWardResponseFromJson(jsonString);

import 'dart:convert';

GetAllWardResponse getAllWardResponseFromJson(String str) => GetAllWardResponse.fromJson(json.decode(str));

String getAllWardResponseToJson(GetAllWardResponse data) => json.encode(data.toJson());

class GetAllWardResponse {
  GetAllWardResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.wardList,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  List<WardList> wardList;

  factory GetAllWardResponse.fromJson(Map<String, dynamic> json) => GetAllWardResponse(
    statusId: json["StatusID"],
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
    wardList: List<WardList>.from(json["WardList"].map((x) => WardList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "StatusID": statusId,
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
    "WardList": List<dynamic>.from(wardList.map((x) => x.toJson())),
  };
}

class WardList {
  WardList({
    this.wardId,
    this.wardName,
    this.districtId,
    this.sortOrder,
  });

  String wardId;
  String wardName;
  String districtId;
  int sortOrder;

  factory WardList.fromJson(Map<String, dynamic> json) => WardList(
    wardId: json["WardID"],
    wardName: json["WardName"],
    districtId: json["DistrictID"],
    sortOrder: json["SortOrder"],
  );

  Map<String, dynamic> toJson() => {
    "WardID": wardId,
    "WardName": wardName,
    "DistrictID": districtId,
    "SortOrder": sortOrder,
  };
}
