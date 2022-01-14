// To parse this JSON data, do
//
//     final writeReviewResponse = writeReviewResponseFromJson(jsonString);

import 'dart:convert';

WriteReviewResponse writeReviewResponseFromJson(String str) => WriteReviewResponse.fromJson(json.decode(str));

String writeReviewResponseToJson(WriteReviewResponse data) => json.encode(data.toJson());

class WriteReviewResponse {
  WriteReviewResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
  });

  int statusId;
  String errorCode;
  String errorDescription;

  factory WriteReviewResponse.fromJson(Map<String, dynamic> json) => WriteReviewResponse(
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
