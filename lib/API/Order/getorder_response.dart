// To parse this JSON data, do
//
//     final getOrderResponse = getOrderResponseFromJson(jsonString);

import 'dart:convert';

GetOrderResponse getOrderResponseFromJson(String str) => GetOrderResponse.fromJson(json.decode(str));

String getOrderResponseToJson(GetOrderResponse data) => json.encode(data.toJson());

class GetOrderResponse {
  GetOrderResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.orderList,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  List<OrderList> orderList;

  factory GetOrderResponse.fromJson(Map<String, dynamic> json) => GetOrderResponse(
    statusId: json["StatusID"],
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
    orderList: List<OrderList>.from(json["OrderList"].map((x) => OrderList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "StatusID": statusId,
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
    "OrderList": List<dynamic>.from(orderList.map((x) => x.toJson())),
  };
}

class OrderList {
  OrderList({
    this.orderId,
    this.siteId,
    this.storeId,
    this.appId,
    this.orderCode,
    this.createdBy,
    this.createdDate,
    this.refId,
    this.accountingDate,
    this.voucherDate,
    this.sourceType,
    this.currencyId,
    this.exchangeRate,
    this.amount,
    this.fcAmount,
    this.isDiscountPercent,
    this.discountPercent,
    this.discountAmount,
    this.totalAmount,
    this.fcTotalAmount,
    this.status,
    this.customerId,
    this.customerName,
    this.customerPhone,
    this.fiscalId,
    this.referenceCode,
    this.notes,
    this.saleInvoiceId,
    this.shipAddress,
    this.saleRef,
    this.taxAmount,
    this.referenceId,
    this.cancelReason,
    this.searchString,
    this.printBy,
    this.printDate,
    this.printCount,
    this.stockId,
    this.paymentMethodId,
    this.paymentTermId,
    this.vatMethodId,
    this.shipperId,
    this.accountantId,
    this.customerEmail,
    this.quantity,
    this.customerNameAlias,
    this.isCustomerRetail,
    this.taxCode,
    this.taxCompanyName,
    this.taxCompanyAddress,
    this.taxCompanyEmail,
    this.taxNotes,
    this.transportTypeId,
    this.addressId,
    this.updatedDate,
    this.updatedBy,
    this.orderType,
  });

  String orderId;
  int siteId;
  StoreId storeId;
  int appId;
  String orderCode;
  String createdBy;
  DateTime createdDate;
  String refId;
  DateTime accountingDate;
  DateTime voucherDate;
  int sourceType;
  CurrencyId currencyId;
  double exchangeRate;
  double amount;
  double fcAmount;
  bool isDiscountPercent;
  double discountPercent;
  double discountAmount;
  double totalAmount;
  double fcTotalAmount;
  int status;
  String customerId;
  CustomerName customerName;
  String customerPhone;
  String fiscalId;
  dynamic referenceCode;
  String notes;
  dynamic saleInvoiceId;
  String shipAddress;
  dynamic saleRef;
  double taxAmount;
  dynamic referenceId;
  dynamic cancelReason;
  String searchString;
  dynamic printBy;
  dynamic printDate;
  int printCount;
  StockId stockId;
  int paymentMethodId;
  int paymentTermId;
  int vatMethodId;
  dynamic shipperId;
  dynamic accountantId;
  dynamic customerEmail;
  int quantity;
  dynamic customerNameAlias;
  bool isCustomerRetail;
  String taxCode;
  String taxCompanyName;
  String taxCompanyAddress;
  TaxCompanyEmail taxCompanyEmail;
  String taxNotes;
  int transportTypeId;
  dynamic addressId;
  dynamic updatedDate;
  dynamic updatedBy;
  int orderType;

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
    orderId: json["OrderID"],
    siteId: json["SiteID"],
    storeId: storeIdValues.map[json["StoreID"]],
    appId: json["AppID"],
    orderCode: json["OrderCode"],
    createdBy: json["CreatedBy"],
    createdDate: DateTime.parse(json["CreatedDate"]),
    refId: json["RefID"] == null ? null : json["RefID"],
    accountingDate: DateTime.parse(json["AccountingDate"]),
    voucherDate: DateTime.parse(json["VoucherDate"]),
    sourceType: json["SourceType"],
    currencyId: currencyIdValues.map[json["CurrencyID"]],
    exchangeRate: json["ExchangeRate"],
    amount: json["Amount"],
    fcAmount: json["FCAmount"],
    isDiscountPercent: json["IsDiscountPercent"],
    discountPercent: json["DiscountPercent"],
    discountAmount: json["DiscountAmount"],
    totalAmount: json["TotalAmount"],
    fcTotalAmount: json["FCTotalAmount"],
    status: json["Status"],
    customerId: json["CustomerID"],
    customerName: customerNameValues.map[json["CustomerName"]],
    customerPhone: json["CustomerPhone"],
    fiscalId: json["FiscalID"],
    referenceCode: json["ReferenceCode"],
    notes: json["Notes"],
    saleInvoiceId: json["SaleInvoiceID"],
    shipAddress: json["ShipAddress"],
    saleRef: json["SaleRef"],
    taxAmount: json["TaxAmount"],
    referenceId: json["ReferenceID"],
    cancelReason: json["CancelReason"],
    searchString: json["SearchString"],
    printBy: json["PrintBy"],
    printDate: json["PrintDate"],
    printCount: json["PrintCount"],
    stockId: stockIdValues.map[json["StockID"]],
    paymentMethodId: json["PaymentMethodID"],
    paymentTermId: json["PaymentTermID"],
    vatMethodId: json["VATMethodID"],
    shipperId: json["ShipperID"],
    accountantId: json["AccountantID"],
    customerEmail: json["CustomerEmail"],
    quantity: json["Quantity"],
    customerNameAlias: json["CustomerNameAlias"],
    isCustomerRetail: json["IsCustomerRetail"],
    taxCode: json["TaxCode"],
    taxCompanyName: json["TaxCompanyName"],
    taxCompanyAddress: json["TaxCompanyAddress"],
    taxCompanyEmail: taxCompanyEmailValues.map[json["TaxCompanyEmail"]],
    taxNotes: json["TaxNotes"],
    transportTypeId: json["TransportTypeID"],
    addressId: json["AddressID"],
    updatedDate: json["UpdatedDate"],
    updatedBy: json["UpdatedBy"],
    orderType: json["OrderType"],
  );

  Map<String, dynamic> toJson() => {
    "OrderID": orderId,
    "SiteID": siteId,
    "StoreID": storeIdValues.reverse[storeId],
    "AppID": appId,
    "OrderCode": orderCode,
    "CreatedBy": createdBy,
    "CreatedDate": createdDate.toIso8601String(),
    "RefID": refId == null ? null : refId,
    "AccountingDate": accountingDate.toIso8601String(),
    "VoucherDate": voucherDate.toIso8601String(),
    "SourceType": sourceType,
    "CurrencyID": currencyIdValues.reverse[currencyId],
    "ExchangeRate": exchangeRate,
    "Amount": amount,
    "FCAmount": fcAmount,
    "IsDiscountPercent": isDiscountPercent,
    "DiscountPercent": discountPercent,
    "DiscountAmount": discountAmount,
    "TotalAmount": totalAmount,
    "FCTotalAmount": fcTotalAmount,
    "Status": status,
    "CustomerID": customerId,
    "CustomerName": customerNameValues.reverse[customerName],
    "CustomerPhone": customerPhone,
    "FiscalID": fiscalId,
    "ReferenceCode": referenceCode,
    "Notes": notes,
    "SaleInvoiceID": saleInvoiceId,
    "ShipAddress": shipAddress,
    "SaleRef": saleRef,
    "TaxAmount": taxAmount,
    "ReferenceID": referenceId,
    "CancelReason": cancelReason,
    "SearchString": searchString,
    "PrintBy": printBy,
    "PrintDate": printDate,
    "PrintCount": printCount,
    "StockID": stockIdValues.reverse[stockId],
    "PaymentMethodID": paymentMethodId,
    "PaymentTermID": paymentTermId,
    "VATMethodID": vatMethodId,
    "ShipperID": shipperId,
    "AccountantID": accountantId,
    "CustomerEmail": customerEmail,
    "Quantity": quantity,
    "CustomerNameAlias": customerNameAlias,
    "IsCustomerRetail": isCustomerRetail,
    "TaxCode": taxCode,
    "TaxCompanyName": taxCompanyName,
    "TaxCompanyAddress": taxCompanyAddress,
    "TaxCompanyEmail": taxCompanyEmailValues.reverse[taxCompanyEmail],
    "TaxNotes": taxNotes,
    "TransportTypeID": transportTypeId,
    "AddressID": addressId,
    "UpdatedDate": updatedDate,
    "UpdatedBy": updatedBy,
    "OrderType": orderType,
  };
}

enum CurrencyId { VND }

final currencyIdValues = EnumValues({
  "VND": CurrencyId.VND
});

enum CustomerName { T_DNG }

final customerNameValues = EnumValues({
  "Tô Dũng": CustomerName.T_DNG
});

enum StockId { KHOCAPDONG_241 }

final stockIdValues = EnumValues({
  "KHOCAPDONG_24_1": StockId.KHOCAPDONG_241
});

enum StoreId { KBL_24 }

final storeIdValues = EnumValues({
  "KBL_24": StoreId.KBL_24
});

enum TaxCompanyEmail { EMPTY, TODUNG_GMAIL_COM }

final taxCompanyEmailValues = EnumValues({
  "": TaxCompanyEmail.EMPTY,
  "todung@gmail.com": TaxCompanyEmail.TODUNG_GMAIL_COM
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
