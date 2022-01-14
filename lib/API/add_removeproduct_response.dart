// To parse this JSON data, do
//
//     final addRemoveFavoriteResponse = addRemoveFavoriteResponseFromJson(jsonString);

import 'dart:convert';

AddRemoveFavoriteResponse addRemoveFavoriteResponseFromJson(String str) => AddRemoveFavoriteResponse.fromJson(json.decode(str));

String addRemoveFavoriteResponseToJson(AddRemoveFavoriteResponse data) => json.encode(data.toJson());

class AddRemoveFavoriteResponse {
  AddRemoveFavoriteResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
  });

  int statusId;
  String errorCode;
  String errorDescription;

  factory AddRemoveFavoriteResponse.fromJson(Map<String, dynamic> json) => AddRemoveFavoriteResponse(
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
