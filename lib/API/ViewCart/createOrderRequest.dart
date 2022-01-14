class CreateOrderRequest {
  Order _order;
  String _promotionCode;
  List<OrderDetailList> _orderDetailList;

  CreateOrderRequest(
      {Order order,
        String promotionCode,
        List<OrderDetailList> orderDetailList}) {
    this._order = order;
    this._promotionCode = promotionCode;
    this._orderDetailList = orderDetailList;
  }

  Order get order => _order;
  set order(Order order) => _order = order;
  String get promotionCode => _promotionCode;
  set promotionCode(String promotionCode) => _promotionCode = promotionCode;
  List<OrderDetailList> get orderDetailList => _orderDetailList;
  set orderDetailList(List<OrderDetailList> orderDetailList) =>
      _orderDetailList = orderDetailList;

  CreateOrderRequest.fromJson(Map<String, dynamic> json) {
    _order = json['Order'] != null ? new Order.fromJson(json['Order']) : null;
    _promotionCode = json['PromotionCode'];
    if (json['OrderDetailList'] != null) {
      _orderDetailList = new List<OrderDetailList>();
      json['OrderDetailList'].forEach((v) {
        _orderDetailList.add(new OrderDetailList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._order != null) {
      data['Order'] = this._order.toJson();
    }
    data['PromotionCode'] = this._promotionCode;
    if (this._orderDetailList != null) {
      data['OrderDetailList'] =
          this._orderDetailList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  String _customerID;
  String _customerName;
  String _customerPhone;
  String _orderCode;
  String _orderID;
  int _paymentMethodID;
  String _taxCode;
  String _taxCompanyAddress;
  String _taxCompanyEmail;
  String _taxCompanyName;
  int _transportTypeID;
  String _taxNotes;
  int _vATMethodID;
  String _notes;
  String _shipAddress;

  Order(
      {String customerID,
        String customerName,
        String customerPhone,
        String orderCode,
        String orderID,
        int paymentMethodID,
        String taxCode,
        String taxCompanyAddress,
        String taxCompanyEmail,
        String taxCompanyName,
        int transportTypeID,
        String taxNotes,
        int vATMethodID,
        String notes,
        String shipAddress}) {
    this._customerID = customerID;
    this._customerName = customerName;
    this._customerPhone = customerPhone;
    this._orderCode = orderCode;
    this._orderID = orderID;
    this._paymentMethodID = paymentMethodID;
    this._taxCode = taxCode;
    this._taxCompanyAddress = taxCompanyAddress;
    this._taxCompanyEmail = taxCompanyEmail;
    this._taxCompanyName = taxCompanyName;
    this._transportTypeID = transportTypeID;
    this._taxNotes = taxNotes;
    this._vATMethodID = vATMethodID;
    this._notes = notes;
    this._shipAddress = shipAddress;
  }

  String get customerID => _customerID;
  set customerID(String customerID) => _customerID = customerID;
  String get customerName => _customerName;
  set customerName(String customerName) => _customerName = customerName;
  String get customerPhone => _customerPhone;
  set customerPhone(String customerPhone) => _customerPhone = customerPhone;
  String get orderCode => _orderCode;
  set orderCode(String orderCode) => _orderCode = orderCode;
  String get orderID => _orderID;
  set orderID(String orderID) => _orderID = orderID;
  int get paymentMethodID => _paymentMethodID;
  set paymentMethodID(int paymentMethodID) =>
      _paymentMethodID = paymentMethodID;
  String get taxCode => _taxCode;
  set taxCode(String taxCode) => _taxCode = taxCode;
  String get taxCompanyAddress => _taxCompanyAddress;
  set taxCompanyAddress(String taxCompanyAddress) =>
      _taxCompanyAddress = taxCompanyAddress;
  String get taxCompanyEmail => _taxCompanyEmail;
  set taxCompanyEmail(String taxCompanyEmail) =>
      _taxCompanyEmail = taxCompanyEmail;
  String get taxCompanyName => _taxCompanyName;
  set taxCompanyName(String taxCompanyName) => _taxCompanyName = taxCompanyName;
  int get transportTypeID => _transportTypeID;
  set transportTypeID(int transportTypeID) =>
      _transportTypeID = transportTypeID;
  String get taxNotes => _taxNotes;
  set taxNotes(String taxNotes) => _taxNotes = taxNotes;
  int get vATMethodID => _vATMethodID;
  set vATMethodID(int vATMethodID) => _vATMethodID = vATMethodID;
  String get notes => _notes;
  set notes(String notes) => _notes = notes;
  String get shipAddress => _shipAddress;
  set shipAddress(String shipAddress) => _shipAddress = shipAddress;

  Order.fromJson(Map<String, dynamic> json) {
    _customerID = json['CustomerID'];
    _customerName = json['CustomerName'];
    _customerPhone = json['CustomerPhone'];
    _orderCode = json['OrderCode'];
    _orderID = json['OrderID'];
    _paymentMethodID = json['PaymentMethodID'];
    _taxCode = json['TaxCode'];
    _taxCompanyAddress = json['TaxCompanyAddress'];
    _taxCompanyEmail = json['TaxCompanyEmail'];
    _taxCompanyName = json['TaxCompanyName'];
    _transportTypeID = json['TransportTypeID'];
    _taxNotes = json['TaxNotes'];
    _vATMethodID = json['VATMethodID'];
    _notes = json['Notes'];
    _shipAddress = json['ShipAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CustomerID'] = this._customerID;
    data['CustomerName'] = this._customerName;
    data['CustomerPhone'] = this._customerPhone;
    data['OrderCode'] = this._orderCode;
    data['OrderID'] = this._orderID;
    data['PaymentMethodID'] = this._paymentMethodID;
    data['TaxCode'] = this._taxCode;
    data['TaxCompanyAddress'] = this._taxCompanyAddress;
    data['TaxCompanyEmail'] = this._taxCompanyEmail;
    data['TaxCompanyName'] = this._taxCompanyName;
    data['TransportTypeID'] = this._transportTypeID;
    data['TaxNotes'] = this._taxNotes;
    data['VATMethodID'] = this._vATMethodID;
    data['Notes'] = this._notes;
    data['ShipAddress'] = this._shipAddress;
    return data;
  }
}

class OrderDetailList {
  int _cartID;
  int _detailID;
  String _itemID;
  String _code;
  String _itemName;
  double _quantity;
  double _price;
  double _specialPrice;
  double _orgPrice;
  double _amount;
  String _skuID;
  String _skuProductID;
  String _skuProductCode;
  String _skuProductName;
  double _skuProductPrice;
  int _skuSortOrder;
  String _userName;
  double _totalAmount;
  int _siteID;
  String _storeID;
  Null _attributeID1;
  Null _attributeName1;
  Null _attributeID2;
  Null _attributeName2;
  String _image;
  int _cartType;

  OrderDetailList(
      {int cartID,
        int detailID,
        String itemID,
        String code,
        String itemName,
        double quantity,
        double price,
        double specialPrice,
        double orgPrice,
        double amount,
        String skuID,
        String skuProductID,
        String skuProductCode,
        String skuProductName,
        double skuProductPrice,
        int skuSortOrder,
        String userName,
        double totalAmount,
        int siteID,
        String storeID,
        Null attributeID1,
        Null attributeName1,
        Null attributeID2,
        Null attributeName2,
        String image,
        int cartType}) {
    this._cartID = cartID;
    this._detailID = detailID;
    this._itemID = itemID;
    this._code = code;
    this._itemName = itemName;
    this._quantity = quantity;
    this._price = price;
    this._specialPrice = specialPrice;
    this._orgPrice = orgPrice;
    this._amount = amount;
    this._skuID = skuID;
    this._skuProductID = skuProductID;
    this._skuProductCode = skuProductCode;
    this._skuProductName = skuProductName;
    this._skuProductPrice = skuProductPrice;
    this._skuSortOrder = skuSortOrder;
    this._userName = userName;
    this._totalAmount = totalAmount;
    this._siteID = siteID;
    this._storeID = storeID;
    this._attributeID1 = attributeID1;
    this._attributeName1 = attributeName1;
    this._attributeID2 = attributeID2;
    this._attributeName2 = attributeName2;
    this._image = image;
    this._cartType = cartType;
  }

  int get cartID => _cartID;
  set cartID(int cartID) => _cartID = cartID;
  int get detailID => _detailID;
  set detailID(int detailID) => _detailID = detailID;
  String get itemID => _itemID;
  set itemID(String itemID) => _itemID = itemID;
  String get code => _code;
  set code(String code) => _code = code;
  String get itemName => _itemName;
  set itemName(String itemName) => _itemName = itemName;
  double get quantity => _quantity;
  set quantity(double quantity) => _quantity = quantity;
  double get price => _price;
  set price(double price) => _price = price;
  double get specialPrice => _specialPrice;
  set specialPrice(double specialPrice) => _specialPrice = specialPrice;
  double get orgPrice => _orgPrice;
  set orgPrice(double orgPrice) => _orgPrice = orgPrice;
  double get amount => _amount;
  set amount(double amount) => _amount = amount;
  String get skuID => _skuID;
  set skuID(String skuID) => _skuID = skuID;
  String get skuProductID => _skuProductID;
  set skuProductID(String skuProductID) => _skuProductID = skuProductID;
  String get skuProductCode => _skuProductCode;
  set skuProductCode(String skuProductCode) => _skuProductCode = skuProductCode;
  String get skuProductName => _skuProductName;
  set skuProductName(String skuProductName) => _skuProductName = skuProductName;
  double get skuProductPrice => _skuProductPrice;
  set skuProductPrice(double skuProductPrice) =>
      _skuProductPrice = skuProductPrice;
  int get skuSortOrder => _skuSortOrder;
  set skuSortOrder(int skuSortOrder) => _skuSortOrder = skuSortOrder;
  String get userName => _userName;
  set userName(String userName) => _userName = userName;
  double get totalAmount => _totalAmount;
  set totalAmount(double totalAmount) => _totalAmount = totalAmount;
  int get siteID => _siteID;
  set siteID(int siteID) => _siteID = siteID;
  String get storeID => _storeID;
  set storeID(String storeID) => _storeID = storeID;
  Null get attributeID1 => _attributeID1;
  set attributeID1(Null attributeID1) => _attributeID1 = attributeID1;
  Null get attributeName1 => _attributeName1;
  set attributeName1(Null attributeName1) => _attributeName1 = attributeName1;
  Null get attributeID2 => _attributeID2;
  set attributeID2(Null attributeID2) => _attributeID2 = attributeID2;
  Null get attributeName2 => _attributeName2;
  set attributeName2(Null attributeName2) => _attributeName2 = attributeName2;
  String get image => _image;
  set image(String image) => _image = image;
  int get cartType => _cartType;
  set cartType(int cartType) => _cartType = cartType;

  OrderDetailList.fromJson(Map<String, dynamic> json) {
    _cartID = json['CartID'];
    _detailID = json['DetailID'];
    _itemID = json['ItemID'];
    _code = json['Code'];
    _itemName = json['ItemName'];
    _quantity = json['Quantity'];
    _price = json['Price'];
    _specialPrice = json['SpecialPrice'];
    _orgPrice = json['OrgPrice'];
    _amount = json['Amount'];
    _skuID = json['SkuID'];
    _skuProductID = json['SkuProductID'];
    _skuProductCode = json['SkuProductCode'];
    _skuProductName = json['SkuProductName'];
    _skuProductPrice = json['SkuProductPrice'];
    _skuSortOrder = json['SkuSortOrder'];
    _userName = json['UserName'];
    _totalAmount = json['TotalAmount'];
    _siteID = json['SiteID'];
    _storeID = json['StoreID'];
    _attributeID1 = json['AttributeID1'];
    _attributeName1 = json['AttributeName1'];
    _attributeID2 = json['AttributeID2'];
    _attributeName2 = json['AttributeName2'];
    _image = json['Image'];
    _cartType = json['CartType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CartID'] = this._cartID;
    data['DetailID'] = this._detailID;
    data['ItemID'] = this._itemID;
    data['Code'] = this._code;
    data['ItemName'] = this._itemName;
    data['Quantity'] = this._quantity;
    data['Price'] = this._price;
    data['SpecialPrice'] = this._specialPrice;
    data['OrgPrice'] = this._orgPrice;
    data['Amount'] = this._amount;
    data['SkuID'] = this._skuID;
    data['SkuProductID'] = this._skuProductID;
    data['SkuProductCode'] = this._skuProductCode;
    data['SkuProductName'] = this._skuProductName;
    data['SkuProductPrice'] = this._skuProductPrice;
    data['SkuSortOrder'] = this._skuSortOrder;
    data['UserName'] = this._userName;
    data['TotalAmount'] = this._totalAmount;
    data['SiteID'] = this._siteID;
    data['StoreID'] = this._storeID;
    data['AttributeID1'] = this._attributeID1;
    data['AttributeName1'] = this._attributeName1;
    data['AttributeID2'] = this._attributeID2;
    data['AttributeName2'] = this._attributeName2;
    data['Image'] = this._image;
    data['CartType'] = this._cartType;
    return data;
  }
}
