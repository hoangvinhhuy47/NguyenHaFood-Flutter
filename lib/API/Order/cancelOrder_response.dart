// To parse this JSON data, do
//
//     final cancelOderResponse = cancelOderResponseFromJson(jsonString);

import 'dart:convert';

CancelOderResponse cancelOderResponseFromJson(String str) => CancelOderResponse.fromJson(json.decode(str));

String cancelOderResponseToJson(CancelOderResponse data) => json.encode(data.toJson());

class CancelOderResponse {
  CancelOderResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
  });

  int statusId;
  String errorCode;
  String errorDescription;

  factory CancelOderResponse.fromJson(Map<String, dynamic> json) => CancelOderResponse(
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
