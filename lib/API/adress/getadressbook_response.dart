// To parse this JSON data, do
//
//     final getAdressBookResponse = getAdressBookResponseFromJson(jsonString);

import 'dart:convert';

GetAdressBookResponse getAdressBookResponseFromJson(String str) => GetAdressBookResponse.fromJson(json.decode(str));

String getAdressBookResponseToJson(GetAdressBookResponse data) => json.encode(data.toJson());

class GetAdressBookResponse {
  GetAdressBookResponse({
    this.statusId,
    this.errorCode,
    this.errorDescription,
    this.addressBook,
  });

  int statusId;
  String errorCode;
  String errorDescription;
  List<AddressBook> addressBook;

  factory GetAdressBookResponse.fromJson(Map<String, dynamic> json) => GetAdressBookResponse(
    statusId: json["StatusID"],
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
    addressBook: List<AddressBook>.from(json["AddressBook"].map((x) => AddressBook.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "StatusID": statusId,
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
    "AddressBook": List<dynamic>.from(addressBook.map((x) => x.toJson())),
  };
}

class AddressBook {
  AddressBook({
    this.addressId,
    this.objectId,
    this.objectType,
    this.fullName,
    this.cellPhone,
    this.fullAddress,
    this.countryId,
    this.cityId,
    this.districtId,
    this.address,
    this.isDefault,
    this.sortOrder,
    this.locationNameFrom,
    this.locationAddressFrom,
    this.locationCellPhoneFrom,
    this.locationNoteFrom,
    this.locationNameTo,
    this.locationAddressTo,
    this.locationCellPhoneTo,
    this.locationNoteTo,
    this.notes,
    this.paymentNote,
    this.shipCost,
    this.entranceFee,
    this.shipToHomeFee,
    this.wardId,
  });

  String addressId;
  String objectId;
  int objectType;
  String fullName;
  String cellPhone;
  String fullAddress;
  String countryId;
  String cityId;
  String districtId;
  String address;
  bool isDefault;
  double sortOrder;
  dynamic locationNameFrom;
  dynamic locationAddressFrom;
  dynamic locationCellPhoneFrom;
  dynamic locationNoteFrom;
  dynamic locationNameTo;
  dynamic locationAddressTo;
  dynamic locationCellPhoneTo;
  dynamic locationNoteTo;
  dynamic notes;
  dynamic paymentNote;
  double shipCost;
  double entranceFee;
  double shipToHomeFee;
  String wardId;

  factory AddressBook.fromJson(Map<String, dynamic> json) => AddressBook(
    addressId: json["AddressID"],
    objectId: json["ObjectID"],
    objectType: json["ObjectType"],
    fullName: json["FullName"],
    cellPhone: json["CellPhone"],
    fullAddress: json["FullAddress"],
    countryId: json["CountryID"],
    cityId: json["CityID"],
    districtId: json["DistrictID"],
    address: json["Address"],
    isDefault: json["IsDefault"],
    sortOrder: json["SortOrder"].toDouble(),
    locationNameFrom: json["LocationNameFrom"],
    locationAddressFrom: json["LocationAddressFrom"],
    locationCellPhoneFrom: json["LocationCellPhoneFrom"],
    locationNoteFrom: json["LocationNoteFrom"],
    locationNameTo: json["LocationNameTo"],
    locationAddressTo: json["LocationAddressTo"],
    locationCellPhoneTo: json["LocationCellPhoneTo"],
    locationNoteTo: json["LocationNoteTo"],
    notes: json["Notes"],
    paymentNote: json["PaymentNote"],
    shipCost: json["ShipCost"],
    entranceFee: json["EntranceFee"],
    shipToHomeFee: json["ShipToHomeFee"],
    wardId: json["WardID"],
  );

  Map<String, dynamic> toJson() => {
    "AddressID": addressId,
    "ObjectID": objectId,
    "ObjectType": objectType,
    "FullName": fullName,
    "CellPhone": cellPhone,
    "FullAddress": fullAddress,
    "CountryID": countryId,
    "CityID": cityId,
    "DistrictID": districtId,
    "Address": address,
    "IsDefault": isDefault,
    "SortOrder": sortOrder,
    "LocationNameFrom": locationNameFrom,
    "LocationAddressFrom": locationAddressFrom,
    "LocationCellPhoneFrom": locationCellPhoneFrom,
    "LocationNoteFrom": locationNoteFrom,
    "LocationNameTo": locationNameTo,
    "LocationAddressTo": locationAddressTo,
    "LocationCellPhoneTo": locationCellPhoneTo,
    "LocationNoteTo": locationNoteTo,
    "Notes": notes,
    "PaymentNote": paymentNote,
    "ShipCost": shipCost,
    "EntranceFee": entranceFee,
    "ShipToHomeFee": shipToHomeFee,
    "WardID": wardId,
  };
}
