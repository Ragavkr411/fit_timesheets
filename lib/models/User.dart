

class User {
  int user_id;
  String username;
  String authorities;
  String tokenType;
  String accessToken;
  String phone;
  String email;
  String imeinumber;
  String accountNo;
  String ifsc;
  String nameOnAccount;
  String password;
  bool isValid;


  User(
      {this.user_id,
      this.username,
      this.tokenType,
      this.accessToken,
      this.authorities,
      this.phone,
      this.email,
      this.imeinumber,
      this.accountNo,
      this.ifsc,
      this.nameOnAccount,
      this.password,
      this.isValid,
  });

  User.fromJson(Map<String, dynamic> json) {
    user_id = json['user_id'];
    username = json['username'];
    tokenType = json['tokenType'];
    accessToken = json['accessToken'];
    phone = json['phone'];
    email = json['email'];
    imeinumber = json['imeinumber'];
    accountNo = json['accountNo'];
    ifsc = json['ifsc'];
    nameOnAccount = json['nameOnAccount'];
    password = json['password'];
    isValid = json['isValid'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.user_id;
    data['username'] = this.username;
    data['authorities'] = this.authorities;
    data['tokenType'] = this.tokenType;
    data['accessToken'] = this.accessToken;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['imeinumber'] = this.imeinumber;
    data['accountNo'] = this.accountNo;
    data['ifsc'] = this.ifsc;
    data['nameOnAccount'] = this.nameOnAccount;
    data['password'] = this.password;
    data['isValid'] = this.isValid;

    return data;
  }

  @override
  String toString() {
    return 'User{user_id: $user_id, username: $username, authorities: $authorities, tokenType: $tokenType, accessToken: $accessToken, phone: $phone, email: $email, imeinumber: $imeinumber, accountNo: $accountNo, ifsc: $ifsc, nameOnAccount: $nameOnAccount, password: $password, isValid: $isValid}';
  }
}
