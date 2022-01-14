// To parse this JSON data, do
//
//     final removeProductOnCartResponse = removeProductOnCartResponseFromJson(jsonString);

import 'dart:convert';

RemoveProductOnCartResponse removeProductOnCartResponseFromJson(String str) => RemoveProductOnCartResponse.fromJson(json.decode(str));

String removeProductOnCartResponseToJson(RemoveProductOnCartResponse data) => json.encode(data.toJson());

class RemoveProductOnCartResponse {
  RemoveProductOnCartResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
  });

  int statusId;
  String errorCode;
  String errorDescription;

  factory RemoveProductOnCartResponse.fromJson(Map<String, dynamic> json) => RemoveProductOnCartResponse(
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
