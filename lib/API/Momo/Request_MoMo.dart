class Request_Momo {
  String _orderID;
  String _orderInfo;
  int _amount;
  String _redirectUrl;

  Request_Momo(
      {String orderID, String orderInfo, int amount, String redirectUrl}) {
    this._orderID = orderID;
    this._orderInfo = orderInfo;
    this._amount = amount;
    this._redirectUrl = redirectUrl;
  }

  String get orderID => _orderID;
  set orderID(String orderID) => _orderID = orderID;
  String get orderInfo => _orderInfo;
  set orderInfo(String orderInfo) => _orderInfo = orderInfo;
  int get amount => _amount;
  set amount(int amount) => _amount = amount;
  String get redirectUrl => _redirectUrl;
  set redirectUrl(String redirectUrl) => _redirectUrl = redirectUrl;

  Request_Momo.fromJson(Map<String, dynamic> json) {
    _orderID = json['OrderID'];
    _orderInfo = json['OrderInfo'];
    _amount = json['Amount'];
    _redirectUrl = json['RedirectUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrderID'] = this._orderID;
    data['OrderInfo'] = this._orderInfo;
    data['Amount'] = this._amount;
    data['RedirectUrl'] = this._redirectUrl;
    return data;
  }
}
