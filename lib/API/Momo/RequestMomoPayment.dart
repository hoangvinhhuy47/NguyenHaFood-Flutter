// To parse this JSON data, do
//
//     final requestMomoPayment = requestMomoPaymentFromJson(jsonString);

import 'dart:convert';

RequestMomoPayment requestMomoPaymentFromJson(String str) => RequestMomoPayment.fromJson(json.decode(str));

String requestMomoPaymentToJson(RequestMomoPayment data) => json.encode(data.toJson());

class RequestMomoPayment {
  RequestMomoPayment({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.data,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  Data data;

  factory RequestMomoPayment.fromJson(Map<String, dynamic> json) => RequestMomoPayment(
    statusId: json["StatusID"],
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
    data: Data.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "StatusID": statusId,
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
    "Data": data.toJson(),
  };
}

class Data {
  Data({
    this.requestId,
    this.errorCode,
    this.orderId,
    this.message,
    this.localMessage,
    this.requestType,
    this.payUrl,
    this.signature,
    this.deeplink,
  });

  String requestId;
  int errorCode;
  String orderId;
  String message;
  String localMessage;
  String requestType;
  String payUrl;
  String signature;
  String deeplink;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    requestId: json["requestId"],
    errorCode: json["errorCode"],
    orderId: json["orderId"],
    message: json["message"],
    localMessage: json["localMessage"],
    requestType: json["requestType"],
    payUrl: json["payUrl"],
    signature: json["signature"],
    deeplink: json["deeplink"],
  );

  Map<String, dynamic> toJson() => {
    "requestId": requestId,
    "errorCode": errorCode,
    "orderId": orderId,
    "message": message,
    "localMessage": localMessage,
    "requestType": requestType,
    "payUrl": payUrl,
    "signature": signature,
    "deeplink": deeplink,
  };
}
