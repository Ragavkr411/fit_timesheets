class DeleteUser {
  String screenName;
  String language;
  String mode;
  ScreenObject screenObject;

  DeleteUser({this.screenName, this.language, this.mode, this.screenObject}){
    if(screenObject==null){
      screenObject=ScreenObject();
    }
  }

  DeleteUser.fromJson(Map<String, dynamic> json) {
    screenName = json['screenName'];
    language = json['language'];
    mode = json['mode'];
    screenObject = json['screenObject'] != null
        ? new ScreenObject.fromJson(json['screenObject'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['screenName'] = this.screenName;
    data['language'] = this.language;
    data['mode'] = this.mode;
    if (this.screenObject != null) {
      data['screenObject'] = this.screenObject.toJson();
    }
    return data;
  }
}

class ScreenObject {
  int id;
  String name;
  String email;
  String phone;
  bool isAdminApproved;
  bool emailVerified;
  bool isPhoneVerified;
  String dateOfRegistration;
  Null dateOfAdminApproval;
  String userStatus;
  String reportsToId;
  String reportsToName;
  String pannumber;
  String aadharid;
  String bankname;
  String ifsccode;
  String bankAccountNum;
  String password;

  ScreenObject(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.isAdminApproved,
        this.emailVerified,
        this.isPhoneVerified,
        this.dateOfRegistration,
        this.dateOfAdminApproval,
        this.userStatus,
        this.reportsToId,
        this.reportsToName,
        this.pannumber,
        this.aadharid,
        this.bankname,
        this.ifsccode,
        this.bankAccountNum,
        this.password});

  ScreenObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    isAdminApproved = json['isAdminApproved'];
    emailVerified = json['emailVerified'];
    isPhoneVerified = json['isPhoneVerified'];
    dateOfRegistration = json['dateOfRegistration'];
    dateOfAdminApproval = json['dateOfAdminApproval'];
    userStatus = json['userStatus'];
    reportsToId = json['reportsToId'];
    reportsToName = json['reportsToName'];
    pannumber = json['pannumber'];
    aadharid = json['aadharid'];
    bankname = json['bankname'];
    ifsccode = json['ifsccode'];
    bankAccountNum = json['bankAccountNum'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['isAdminApproved'] = this.isAdminApproved;
    data['emailVerified'] = this.emailVerified;
    data['isPhoneVerified'] = this.isPhoneVerified;
    data['dateOfRegistration'] = this.dateOfRegistration;
    data['dateOfAdminApproval'] = this.dateOfAdminApproval;
    data['userStatus'] = this.userStatus;
    data['reportsToId'] = this.reportsToId;
    data['reportsToName'] = this.reportsToName;
    data['pannumber'] = this.pannumber;
    data['aadharid'] = this.aadharid;
    data['bankname'] = this.bankname;
    data['ifsccode'] = this.ifsccode;
    data['bankAccountNum'] = this.bankAccountNum;
    data['password'] = this.password;
    return data;
  }
}