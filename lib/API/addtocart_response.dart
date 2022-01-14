// To parse this JSON data, do
//
//     final addToCartResponse = addToCartResponseFromJson(jsonString);

import 'dart:convert';

AddToCartResponse addToCartResponseFromJson(String str) => AddToCartResponse.fromJson(json.decode(str));

String addToCartResponseToJson(AddToCartResponse data) => json.encode(data.toJson());

class AddToCartResponse {
  AddToCartResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.homeData,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  int homeData;

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) => AddToCartResponse(
    statusId: json["StatusID"],
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
    homeData: json["HomeData"],
  );

  Map<String, dynamic> toJson() => {
    "StatusID": statusId,
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
    "HomeData": homeData,
  };
}
