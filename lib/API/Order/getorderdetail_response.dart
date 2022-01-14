// To parse this JSON data, do
//
//     final getOrderDeTailResponse = getOrderDeTailResponseFromJson(jsonString);

import 'dart:convert';

GetOrderDeTailResponse getOrderDeTailResponseFromJson(String str) => GetOrderDeTailResponse.fromJson(json.decode(str));

String getOrderDeTailResponseToJson(GetOrderDeTailResponse data) => json.encode(data.toJson());

class GetOrderDeTailResponse {
  GetOrderDeTailResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.order,
    this.detailList,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  Order order;
  List<DetailList> detailList;

  factory GetOrderDeTailResponse.fromJson(Map<String, dynamic> json) => GetOrderDeTailResponse(
    statusId: json["StatusID"],
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
    order: Order.fromJson(json["Order"]),
    detailList: List<DetailList>.from(json["DetailList"].map((x) => DetailList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "StatusID": statusId,
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
    "Order": order.toJson(),
    "DetailList": List<dynamic>.from(detailList.map((x) => x.toJson())),
  };
}

class DetailList {
  DetailList({
    this.orderId,
    this.productId,
    this.productCode,
    this.productName,
    this.quantity,
    this.price,
    this.amount,
    this.skuId,
    this.skuProductId,
    this.skuProductCode,
    this.skuProductName,
    this.skuProductPrice,
    this.skuSortOrder,
    this.itemId,
    this.code,
    this.itemName,
    this.salePrice,
    this.image,
  });

  String orderId;
  String productId;
  String productCode;
  String productName;
  double quantity;
  double price;
  double amount;
  String skuId;
  String skuProductId;
  String skuProductCode;
  String skuProductName;
  double skuProductPrice;
  int skuSortOrder;
  String itemId;
  String code;
  String itemName;
  double salePrice;
  String image;

  factory DetailList.fromJson(Map<String, dynamic> json) => DetailList(
    orderId: json["OrderID"],
    productId: json["ProductID"],
    productCode: json["ProductCode"],
    productName: json["ProductName"],
    quantity: json["Quantity"],
    price: json["Price"],
    amount: json["Amount"],
    skuId: json["SkuID"],
    skuProductId: json["SkuProductID"],
    skuProductCode: json["SkuProductCode"],
    skuProductName: json["SkuProductName"],
    skuProductPrice: json["SkuProductPrice"],
    skuSortOrder: json["SkuSortOrder"],
    itemId: json["ItemID"],
    code: json["Code"],
    itemName: json["ItemName"],
    salePrice: json["SalePrice"],
    image: json["Image"],
  );

  Map<String, dynamic> toJson() => {
    "OrderID": orderId,
    "ProductID": productId,
    "ProductCode": productCode,
    "ProductName": productName,
    "Quantity": quantity,
    "Price": price,
    "Amount": amount,
    "SkuID": skuId,
    "SkuProductID": skuProductId,
    "SkuProductCode": skuProductCode,
    "SkuProductName": skuProductName,
    "SkuProductPrice": skuProductPrice,
    "SkuSortOrder": skuSortOrder,
    "ItemID": itemId,
    "Code": code,
    "ItemName": itemName,
    "SalePrice": salePrice,
    "Image": image,
  };
}

class Order {
  Order({
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
  String storeId;
  int appId;
  String orderCode;
  String createdBy;
  DateTime createdDate;
  dynamic refId;
  DateTime accountingDate;
  DateTime voucherDate;
  int sourceType;
  String currencyId;
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
  String customerName;
  String customerPhone;
  String fiscalId;
  dynamic referenceCode;
  String notes;
  String saleInvoiceId;
  String shipAddress;
  dynamic saleRef;
  double taxAmount;
  dynamic referenceId;
  dynamic cancelReason;
  String searchString;
  dynamic printBy;
  dynamic printDate;
  int printCount;
  String stockId;
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
  String taxCompanyEmail;
  String taxNotes;
  int transportTypeId;
  dynamic addressId;
  dynamic updatedDate;
  dynamic updatedBy;
  int orderType;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["OrderID"],
    siteId: json["SiteID"],
    storeId: json["StoreID"],
    appId: json["AppID"],
    orderCode: json["OrderCode"],
    createdBy: json["CreatedBy"],
    createdDate: DateTime.parse(json["CreatedDate"]),
    refId: json["RefID"],
    accountingDate: DateTime.parse(json["AccountingDate"]),
    voucherDate: DateTime.parse(json["VoucherDate"]),
    sourceType: json["SourceType"],
    currencyId: json["CurrencyID"],
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
    customerName: json["CustomerName"],
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
    stockId: json["StockID"],
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
    taxCompanyEmail: json["TaxCompanyEmail"],
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
    "StoreID": storeId,
    "AppID": appId,
    "OrderCode": orderCode,
    "CreatedBy": createdBy,
    "CreatedDate": createdDate.toIso8601String(),
    "RefID": refId,
    "AccountingDate": accountingDate.toIso8601String(),
    "VoucherDate": voucherDate.toIso8601String(),
    "SourceType": sourceType,
    "CurrencyID": currencyId,
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
    "CustomerName": customerName,
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
    "StockID": stockId,
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
    "TaxCompanyEmail": taxCompanyEmail,
    "TaxNotes": taxNotes,
    "TransportTypeID": transportTypeId,
    "AddressID": addressId,
    "UpdatedDate": updatedDate,
    "UpdatedBy": updatedBy,
    "OrderType": orderType,
  };
}
