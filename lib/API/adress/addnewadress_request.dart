class AddAddressBookRequest {
  AddressBook _addressBook;

  AddAddressBookRequest({AddressBook addressBook}) {
    this._addressBook = addressBook;
  }

  AddressBook get addressBook => _addressBook;
  set addressBook(AddressBook addressBook) => _addressBook = addressBook;

  AddAddressBookRequest.fromJson(Map<String, dynamic> json) {
    _addressBook = json['AddressBook'] != null
        ? new AddressBook.fromJson(json['AddressBook'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._addressBook != null) {
      data['AddressBook'] = this._addressBook.toJson();
    }
    return data;
  }
}

class AddressBook {
  String _addressID;
  String _objectID;
  String _objectType;
  String _fullAddress;
  String _wardID;
  String _sortOrder;
  String _countryID;
  String _fullName;
  String _address;
  String _cellPhone;
  String _cityID;
  String _districtID;
  bool _isDefault;

  AddressBook(
      {String addressID,
        String objectID,
        String objectType,
        String fullAddress,
        String wardID,
        String sortOrder,
        String countryID,
        String fullName,
        String address,
        String cellPhone,
        String cityID,
        String districtID,
        bool isDefault}) {
    this._addressID = addressID;
    this._objectID = objectID;
    this._objectType = objectType;
    this._fullAddress = fullAddress;
    this._wardID = wardID;
    this._sortOrder = sortOrder;
    this._countryID = countryID;
    this._fullName = fullName;
    this._address = address;
    this._cellPhone = cellPhone;
    this._cityID = cityID;
    this._districtID = districtID;
    this._isDefault = isDefault;
  }

  String get addressID => _addressID;
  set addressID(String addressID) => _addressID = addressID;
  String get objectID => _objectID;
  set objectID(String objectID) => _objectID = objectID;
  String get objectType => _objectType;
  set objectType(String objectType) => _objectType = objectType;
  String get fullAddress => _fullAddress;
  set fullAddress(String fullAddress) => _fullAddress = fullAddress;
  String get wardID => _wardID;
  set wardID(String wardID) => _wardID = wardID;
  String get sortOrder => _sortOrder;
  set sortOrder(String sortOrder) => _sortOrder = sortOrder;
  String get countryID => _countryID;
  set countryID(String countryID) => _countryID = countryID;
  String get fullName => _fullName;
  set fullName(String fullName) => _fullName = fullName;
  String get address => _address;
  set address(String address) => _address = address;
  String get cellPhone => _cellPhone;
  set cellPhone(String cellPhone) => _cellPhone = cellPhone;
  String get cityID => _cityID;
  set cityID(String cityID) => _cityID = cityID;
  String get districtID => _districtID;
  set districtID(String districtID) => _districtID = districtID;
  bool get isDefault => _isDefault;
  set isDefault(bool isDefault) => _isDefault = isDefault;

  AddressBook.fromJson(Map<String, dynamic> json) {
    _addressID = json['AddressID'];
    _objectID = json['ObjectID'];
    _objectType = json['ObjectType'];
    _fullAddress = json['FullAddress'];
    _wardID = json['WardID'];
    _sortOrder = json['SortOrder'];
    _countryID = json['CountryID'];
    _fullName = json['FullName'];
    _address = json['Address'];
    _cellPhone = json['CellPhone'];
    _cityID = json['CityID'];
    _districtID = json['DistrictID'];
    _isDefault = json['IsDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AddressID'] = this._addressID;
    data['ObjectID'] = this._objectID;
    data['ObjectType'] = this._objectType;
    data['FullAddress'] = this._fullAddress;
    data['WardID'] = this._wardID;
    data['SortOrder'] = this._sortOrder;
    data['CountryID'] = this._countryID;
    data['FullName'] = this._fullName;
    data['Address'] = this._address;
    data['CellPhone'] = this._cellPhone;
    data['CityID'] = this._cityID;
    data['DistrictID'] = this._districtID;
    data['IsDefault'] = this._isDefault;
    return data;
  }
}
