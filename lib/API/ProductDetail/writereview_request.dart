class WriteReviewRequest {
  Review _review;

  WriteReviewRequest({Review review}) {
    this._review = review;
  }

  Review get review => _review;
  set review(Review review) => _review = review;

  WriteReviewRequest.fromJson(Map<String, dynamic> json) {
    _review =
    json['Review'] != null ? new Review.fromJson(json['Review']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._review != null) {
      data['Review'] = this._review.toJson();
    }
    return data;
  }
}

class Review {
  String _custumerID;
  String _itemID;
  String _reviewContent;
  String _reviewStatus;
  String _reviewTitle;
  String _reviewValue;

  Review(
      {String custumerID,
        String itemID,
        String reviewContent,
        String reviewStatus,
        String reviewTitle,
        String reviewValue}) {
    this._custumerID = custumerID;
    this._itemID = itemID;
    this._reviewContent = reviewContent;
    this._reviewStatus = reviewStatus;
    this._reviewTitle = reviewTitle;
    this._reviewValue = reviewValue;
  }

  String get custumerID => _custumerID;
  set custumerID(String custumerID) => _custumerID = custumerID;
  String get itemID => _itemID;
  set itemID(String itemID) => _itemID = itemID;
  String get reviewContent => _reviewContent;
  set reviewContent(String reviewContent) => _reviewContent = reviewContent;
  String get reviewStatus => _reviewStatus;
  set reviewStatus(String reviewStatus) => _reviewStatus = reviewStatus;
  String get reviewTitle => _reviewTitle;
  set reviewTitle(String reviewTitle) => _reviewTitle = reviewTitle;
  String get reviewValue => _reviewValue;
  set reviewValue(String reviewValue) => _reviewValue = reviewValue;

  Review.fromJson(Map<String, dynamic> json) {
    _custumerID = json['CustumerID'];
    _itemID = json['ItemID'];
    _reviewContent = json['ReviewContent'];
    _reviewStatus = json['ReviewStatus'];
    _reviewTitle = json['ReviewTitle'];
    _reviewValue = json['ReviewValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CustumerID'] = this._custumerID;
    data['ItemID'] = this._itemID;
    data['ReviewContent'] = this._reviewContent;
    data['ReviewStatus'] = this._reviewStatus;
    data['ReviewTitle'] = this._reviewTitle;
    data['ReviewValue'] = this._reviewValue;
    return data;
  }
}
