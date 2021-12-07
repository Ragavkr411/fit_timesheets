class Login{
  String password;
  String username;
  String imeinumber;
  String otp;

  Login({this.password,this.username,this.imeinumber,this.otp});

  Login.fromJson(Map<String,dynamic>json)
      :password=json['password'],
        username=json['username'],
        imeinumber=json['imeinumber'],
        otp=json['otp'];

  Map<String,dynamic> toJson()=>
      {
        'password':password,
        'username':username,
        'imeinumber': imeinumber,
        'otp':otp,
      };

  @override
  String toString() {
    return 'Login{password: $password, username: $username, imeinumber: $imeinumber, otp: $otp}';
  }
}
