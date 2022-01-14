// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.customer,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  Customer customer;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    statusId: json["StatusID"],
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
    customer:  json["StatusID"]==1?Customer.fromJson(json["Customer"]!=null?json["Customer"]:null):null,
  );

  Map<String, dynamic> toJson() => {
    "StatusID": statusId,
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
    "Customer": customer.toJson(),
  };
}

class Customer {
  Customer({
    this.customerId,
    this.siteId,
    this.storeId,
    this.code,
    this.membershipCode,
    this.title,
    this.firstName,
    this.middleName,
    this.lastName,
    this.fullName,
    this.birthDay,
    this.gender,
    this.maritalStatus,
    this.cellPhone,
    this.homePhone,
    this.officePhone,
    this.email,
    this.address,
    this.customerTypeId,
    this.shipMethodId,
    this.membershipTypeId,
    this.currencyId,
    this.cityId,
    this.districtId,
    this.wardId,
    this.searchString,
    this.notes,
    this.isSystem,
    this.isActive,
    this.taxCode,
    this.representativeName,
    this.representativePhone,
    this.representativeAddress,
    this.representativeTransactionName,
    this.representativeTransactionPhone,
    this.representativeTransactionAddress,
    this.debitAmountMax,
    this.paymentTermId,
    this.chargeNotes,
    this.discountNotes,
    this.supportNotes,
    this.paymentNotes,
    this.type,
    this.shipAddress,
    this.createdDate,
    this.createdBy,
    this.inputType,
    this.taxCompanyName,
    this.taxCompanyAddress,
    this.sourceType,
    this.referenceId,
    this.userName,
    this.password,
    this.codeReference,
    this.isChangePass,
    this.vatMethodId,
    this.paymentMethodId,
    this.saleRefId,
    this.shipperId,
    this.accountantId,
    this.balanceAmount,
    this.isCustomerRetail,
    this.isVendor,
    this.vendorId,
    this.isCompany,
    this.shortAddress,
  });

  String customerId;
  int siteId;
  String storeId;
  String code;
  String membershipCode;
  dynamic title;
  dynamic firstName;
  dynamic middleName;
  dynamic lastName;
  String fullName;
  DateTime birthDay;
  int gender;
  int maritalStatus;
  String cellPhone;
  dynamic homePhone;
  dynamic officePhone;
  String email;
  String address;
  String customerTypeId;
  dynamic shipMethodId;
  dynamic membershipTypeId;
  dynamic currencyId;
  dynamic cityId;
  dynamic districtId;
  dynamic wardId;
  String searchString;
  dynamic notes;
  bool isSystem;
  bool isActive;
  dynamic taxCode;
  dynamic representativeName;
  dynamic representativePhone;
  dynamic representativeAddress;
  dynamic representativeTransactionName;
  dynamic representativeTransactionPhone;
  dynamic representativeTransactionAddress;
  double debitAmountMax;
  int paymentTermId;
  dynamic chargeNotes;
  dynamic discountNotes;
  dynamic supportNotes;
  dynamic paymentNotes;
  int type;
  String shipAddress;
  DateTime createdDate;
  String createdBy;
  int inputType;
  dynamic taxCompanyName;
  dynamic taxCompanyAddress;
  int sourceType;
  dynamic referenceId;
  String userName;
  String password;
  String codeReference;
  bool isChangePass;
  int vatMethodId;
  int paymentMethodId;
  dynamic saleRefId;
  dynamic shipperId;
  dynamic accountantId;
  double balanceAmount;
  bool isCustomerRetail;
  bool isVendor;
  dynamic vendorId;
  bool isCompany;
  dynamic shortAddress;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customerId: json["CustomerID"],
    siteId: json["SiteID"],
    storeId: json["StoreID"],
    code: json["Code"],
    membershipCode: json["MembershipCode"],
    title: json["Title"],
    firstName: json["FirstName"],
    middleName: json["MiddleName"],
    lastName: json["LastName"],
    fullName: json["FullName"],
    birthDay: DateTime.parse(json["BirthDay"]),
    gender: json["Gender"],
    maritalStatus: json["MaritalStatus"],
    cellPhone: json["CellPhone"],
    homePhone: json["HomePhone"],
    officePhone: json["OfficePhone"],
    email: json["Email"],
    address: json["Address"],
    customerTypeId: json["CustomerTypeID"],
    shipMethodId: json["ShipMethodID"],
    membershipTypeId: json["MembershipTypeID"],
    currencyId: json["CurrencyID"],
    cityId: json["CityID"],
    districtId: json["DistrictID"],
    wardId: json["WardID"],
    searchString: json["SearchString"],
    notes: json["Notes"],
    isSystem: json["IsSystem"],
    isActive: json["IsActive"],
    taxCode: json["TaxCode"],
    representativeName: json["RepresentativeName"],
    representativePhone: json["RepresentativePhone"],
    representativeAddress: json["RepresentativeAddress"],
    representativeTransactionName: json["RepresentativeTransactionName"],
    representativeTransactionPhone: json["RepresentativeTransactionPhone"],
    representativeTransactionAddress: json["RepresentativeTransactionAddress"],
    debitAmountMax: json["DebitAmountMax"],
    paymentTermId: json["PaymentTermID"],
    chargeNotes: json["ChargeNotes"],
    discountNotes: json["DiscountNotes"],
    supportNotes: json["SupportNotes"],
    paymentNotes: json["PaymentNotes"],
    type: json["Type"],
    shipAddress: json["ShipAddress"],
    createdDate: DateTime.parse(json["CreatedDate"]),
    createdBy: json["CreatedBy"],
    inputType: json["InputType"],
    taxCompanyName: json["TaxCompanyName"],
    taxCompanyAddress: json["TaxCompanyAddress"],
    sourceType: json["SourceType"],
    referenceId: json["ReferenceID"],
    userName: json["UserName"],
    password: json["Password"],
    codeReference: json["CodeReference"],
    isChangePass: json["IsChangePass"],
    vatMethodId: json["VATMethodID"],
    paymentMethodId: json["PaymentMethodID"],
    saleRefId: json["SaleRefID"],
    shipperId: json["ShipperID"],
    accountantId: json["AccountantID"],
    balanceAmount: json["BalanceAmount"],
    isCustomerRetail: json["IsCustomerRetail"],
    isVendor: json["IsVendor"],
    vendorId: json["VendorID"],
    isCompany: json["IsCompany"],
    shortAddress: json["ShortAddress"],
  );

  Map<String, dynamic> toJson() => {
    "CustomerID": customerId,
    "SiteID": siteId,
    "StoreID": storeId,
    "Code": code,
    "MembershipCode": membershipCode,
    "Title": title,
    "FirstName": firstName,
    "MiddleName": middleName,
    "LastName": lastName,
    "FullName": fullName,
    "BirthDay": birthDay.toIso8601String(),
    "Gender": gender,
    "MaritalStatus": maritalStatus,
    "CellPhone": cellPhone,
    "HomePhone": homePhone,
    "OfficePhone": officePhone,
    "Email": email,
    "Address": address,
    "CustomerTypeID": customerTypeId,
    "ShipMethodID": shipMethodId,
    "MembershipTypeID": membershipTypeId,
    "CurrencyID": currencyId,
    "CityID": cityId,
    "DistrictID": districtId,
    "WardID": wardId,
    "SearchString": searchString,
    "Notes": notes,
    "IsSystem": isSystem,
    "IsActive": isActive,
    "TaxCode": taxCode,
    "RepresentativeName": representativeName,
    "RepresentativePhone": representativePhone,
    "RepresentativeAddress": representativeAddress,
    "RepresentativeTransactionName": representativeTransactionName,
    "RepresentativeTransactionPhone": representativeTransactionPhone,
    "RepresentativeTransactionAddress": representativeTransactionAddress,
    "DebitAmountMax": debitAmountMax,
    "PaymentTermID": paymentTermId,
    "ChargeNotes": chargeNotes,
    "DiscountNotes": discountNotes,
    "SupportNotes": supportNotes,
    "PaymentNotes": paymentNotes,
    "Type": type,
    "ShipAddress": shipAddress,
    "CreatedDate": createdDate.toIso8601String(),
    "CreatedBy": createdBy,
    "InputType": inputType,
    "TaxCompanyName": taxCompanyName,
    "TaxCompanyAddress": taxCompanyAddress,
    "SourceType": sourceType,
    "ReferenceID": referenceId,
    "UserName": userName,
    "Password": password,
    "CodeReference": codeReference,
    "IsChangePass": isChangePass,
    "VATMethodID": vatMethodId,
    "PaymentMethodID": paymentMethodId,
    "SaleRefID": saleRefId,
    "ShipperID": shipperId,
    "AccountantID": accountantId,
    "BalanceAmount": balanceAmount,
    "IsCustomerRetail": isCustomerRetail,
    "IsVendor": isVendor,
    "VendorID": vendorId,
    "IsCompany": isCompany,
    "ShortAddress": shortAddress,
  };
}
