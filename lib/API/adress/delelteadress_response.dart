// To parse this JSON data, do
//
//     final deleteAdressResponse = deleteAdressResponseFromJson(jsonString);

import 'dart:convert';

DeleteAdressResponse deleteAdressResponseFromJson(String str) => DeleteAdressResponse.fromJson(json.decode(str));

String deleteAdressResponseToJson(DeleteAdressResponse data) => json.encode(data.toJson());

class DeleteAdressResponse {
  DeleteAdressResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
  });

  int statusId;
  String errorCode;
  String errorDescription;

  factory DeleteAdressResponse.fromJson(Map<String, dynamic> json) => DeleteAdressResponse(
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
