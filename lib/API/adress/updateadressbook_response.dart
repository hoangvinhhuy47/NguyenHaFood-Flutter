// To parse this JSON data, do
//
//     final updateAdressbook = updateAdressbookFromJson(jsonString);

import 'dart:convert';

UpdateAdressbook updateAdressbookFromJson(String str) => UpdateAdressbook.fromJson(json.decode(str));

String updateAdressbookToJson(UpdateAdressbook data) => json.encode(data.toJson());

class UpdateAdressbook {
  UpdateAdressbook({
    this.statusId,
    this.errorCode,
    this.errorDescription,
  });

  int statusId;
  String errorCode;
  String errorDescription;

  factory UpdateAdressbook.fromJson(Map<String, dynamic> json) => UpdateAdressbook(
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
