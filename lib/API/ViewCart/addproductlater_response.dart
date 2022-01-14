// To parse this JSON data, do
//
//     final addProductLaterBuyResponse = addProductLaterBuyResponseFromJson(jsonString);

import 'dart:convert';

AddProductLaterBuyResponse addProductLaterBuyResponseFromJson(String str) => AddProductLaterBuyResponse.fromJson(json.decode(str));

String addProductLaterBuyResponseToJson(AddProductLaterBuyResponse data) => json.encode(data.toJson());

class AddProductLaterBuyResponse {
  AddProductLaterBuyResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
  });

  int statusId;
  String errorCode;
  String errorDescription;

  factory AddProductLaterBuyResponse.fromJson(Map<String, dynamic> json) => AddProductLaterBuyResponse(
    statusId: json["StatusID"],
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
  );

  Map<String, dynamic> toJson() => {
    "StatusID": statusId,
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
  };
}
