// To parse this JSON data, do
//
//     final reBuyResponse = reBuyResponseFromJson(jsonString);

import 'dart:convert';

ReBuyResponse reBuyResponseFromJson(String str) => ReBuyResponse.fromJson(json.decode(str));

String reBuyResponseToJson(ReBuyResponse data) => json.encode(data.toJson());

class ReBuyResponse {
  ReBuyResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
  });

  int statusId;
  String errorCode;
  String errorDescription;

  factory ReBuyResponse.fromJson(Map<String, dynamic> json) => ReBuyResponse(
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
