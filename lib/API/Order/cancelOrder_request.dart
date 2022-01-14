class CancelOrderRequest {
  String _orderID;
  String _resoan;

  CancelOrderRequest({String orderID, String resoan}) {
    this._orderID = orderID;
    this._resoan = resoan;
  }

  String get orderID => _orderID;
  set orderID(String orderID) => _orderID = orderID;
  String get resoan => _resoan;
  set resoan(String resoan) => _resoan = resoan;

  CancelOrderRequest.fromJson(Map<String, dynamic> json) {
    _orderID = json['OrderID'];
    _resoan = json['Resoan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrderID'] = this._orderID;
    data['Resoan'] = this._resoan;
    return data;
  }
}
