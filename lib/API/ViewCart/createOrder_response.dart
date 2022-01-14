// To parse this JSON data, do
//
//     final createOrderResponse = createOrderResponseFromJson(jsonString);

import 'dart:convert';

CreateOrderResponse createOrderResponseFromJson(String str) => CreateOrderResponse.fromJson(json.decode(str));

String createOrderResponseToJson(CreateOrderResponse data) => json.encode(data.toJson());

class CreateOrderResponse {
  CreateOrderResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
  });

  int statusId;
  String errorCode;
  String errorDescription;

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) => CreateOrderResponse(
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
