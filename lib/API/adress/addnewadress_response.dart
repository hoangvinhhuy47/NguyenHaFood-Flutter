// To parse this JSON data, do
//
//     final addNewAdressResponse = addNewAdressResponseFromJson(jsonString);

import 'dart:convert';

AddNewAdressResponse addNewAdressResponseFromJson(String str) => AddNewAdressResponse.fromJson(json.decode(str));

String addNewAdressResponseToJson(AddNewAdressResponse data) => json.encode(data.toJson());

class AddNewAdressResponse {
  AddNewAdressResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
  });

  int statusId;
  String errorCode;
  String errorDescription;

  factory AddNewAdressResponse.fromJson(Map<String, dynamic> json) => AddNewAdressResponse(
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
