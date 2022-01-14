import 'dart:convert';
class GetPromotionCodeRequest {
  String _promotionCode;
  List<OrderDetailList> _orderDetailList;

  GetPromotionCodeRequest(
      {String promotionCode, List<OrderDetailList> orderDetailList}) {
    this._promotionCode = promotionCode;
    this._orderDetailList = orderDetailList;
  }

  String get promotionCode => _promotionCode;
  set promotionCode(String promotionCode) => _promotionCode = promotionCode;
  List<OrderDetailList> get orderDetailList => _orderDetailList;
  set orderDetailList(List<OrderDetailList> orderDetailList) =>
      _orderDetailList = orderDetailList;

  GetPromotionCodeRequest.fromJson(Map<String, dynamic> json) {
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
    data['PromotionCode'] = this._promotionCode;
    if (this._orderDetailList != null) {
      data['OrderDetailList'] =
          this._orderDetailList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderDetailList {
  String _skuProductID;
  double _quantity;
  double _price;
  double _amount;

  OrderDetailList({String skuProductID, double quantity, double price, double amount}) {
    this._skuProductID = skuProductID;
    this._quantity = quantity;
    this._price = price;
    this._amount = amount;
  }

  String get skuProductID => _skuProductID;
  set skuProductID(String skuProductID) => _skuProductID = skuProductID;
  double get quantity => _quantity;
  set quantity(double quantity) => _quantity = quantity;
  double get price => _price;
  set price(double price) => _price = price;
  double get amount => _amount;
  set amount(double amount) => _amount = amount;

  OrderDetailList.fromJson(Map<String, dynamic> json) {
    _skuProductID = json['SkuProductID'];
    _quantity = json['Quantity'];
    _price = json['Price'];
    _amount = json['Amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SkuProductID'] = this._skuProductID;
    data['Quantity'] = this._quantity;
    data['Price'] = this._price;
    data['Amount'] = this._amount;
    return data;
  }
}
