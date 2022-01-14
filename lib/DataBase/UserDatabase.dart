class User {
  int iD;
  String customerID;
  String userName;
  String fullName;
  String passWordEnCode;
  String passWord;
  String email;

  User(
      {this.iD,
        this.customerID,
        this.userName,
        this.fullName,
        this.passWordEnCode,
        this.passWord,
        this.email});

  User.fromMap(Map<String, dynamic> json) {
    iD = json['iD'];
    customerID = json['customerID'];
    userName = json['userName'];
    fullName = json['fullName'];
    passWordEnCode = json['passWordEnCode'];
    passWord = json['passWord'];
    email = json['email'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CustomerID'] = this.customerID;
    data['UserName'] = this.userName;
    data['FullName'] = this.fullName;
    data['PassWordEnCode'] = this.passWordEnCode;
    data['PassWord'] = this.passWord;
    data['Email'] = this.email;
    return data;
  }
}
