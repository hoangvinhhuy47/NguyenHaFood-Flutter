// To parse this JSON data, do
//
//     final updateQuanlitiCartResponse = updateQuanlitiCartResponseFromJson(jsonString);

import 'dart:convert';

UpdateQuanlitiCartResponse updateQuanlitiCartResponseFromJson(String str) => UpdateQuanlitiCartResponse.fromJson(json.decode(str));

String updateQuanlitiCartResponseToJson(UpdateQuanlitiCartResponse data) => json.encode(data.toJson());

class UpdateQuanlitiCartResponse {
  UpdateQuanlitiCartResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
  });

  int statusId;
  String errorCode;
  String errorDescription;

  factory UpdateQuanlitiCartResponse.fromJson(Map<String, dynamic> json) => UpdateQuanlitiCartResponse(
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
