class ViewUser {
  String status;
  Body body;

  ViewUser({this.status, this.body});

  ViewUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    return data;
  }
}

class Body {
  String screenName;
  ScreenData screenData;
  Null optionalSwitches;
  Null nextScreen;
  ScreenFieldAttr screenFieldAttr;
  Null headerFieldAttribute;

  Body(
      {this.screenName,
        this.screenData,
        this.optionalSwitches,
        this.nextScreen,
        this.screenFieldAttr,
        this.headerFieldAttribute});

  Body.fromJson(Map<String, dynamic> json) {
    screenName = json['screenName'];
    screenData = json['screenData'] != null
        ? new ScreenData.fromJson(json['screenData'])
        : null;
    optionalSwitches = json['optionalSwitches'];
    nextScreen = json['nextScreen'];
    screenFieldAttr = json['screenFieldAttr'] != null
        ? new ScreenFieldAttr.fromJson(json['screenFieldAttr'])
        : null;
    headerFieldAttribute = json['headerFieldAttribute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['screenName'] = this.screenName;
    if (this.screenData != null) {
      data['screenData'] = this.screenData.toJson();
    }
    data['optionalSwitches'] = this.optionalSwitches;
    data['nextScreen'] = this.nextScreen;
    if (this.screenFieldAttr != null) {
      data['screenFieldAttr'] = this.screenFieldAttr.toJson();
    }
    data['headerFieldAttribute'] = this.headerFieldAttribute;
    return data;
  }
}

class ScreenData {
  int id;
  String name;
  String email;
  String phone;
  bool isAdminApproved;
  bool emailVerified;
  bool isPhoneVerified;
  String dateOfRegistration;
  String dateOfAdminApproval;
  String userStatus;
  String reportsToId;
  String reportsToName;
  String pannumber;
  String aadharid;
  String bankname;
  String ifsccode;
  String bankAccountNum;
  Null password;

  ScreenData(
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

  ScreenData.fromJson(Map<String, dynamic> json) {
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

class ScreenFieldAttr {
  IsPhoneVerified isPhoneVerified;
  IsPhoneVerified userStatus;
  IsPhoneVerified dateOfRegistration;
  IsPhoneVerified aadharid;
  IsPhoneVerified isAdminApproved;
  ReportsToId reportsToId;
  IsPhoneVerified ifsccode;
  IsPhoneVerified pannumber;
  IsPhoneVerified emailVerified;
  IsPhoneVerified password;
  IsPhoneVerified dateOfAdminApproval;
  IsPhoneVerified phone;
  IsPhoneVerified name;
  IsPhoneVerified id;
  IsPhoneVerified bankname;
  IsPhoneVerified bankAccountNum;
  IsPhoneVerified email;
  IsPhoneVerified reportsToName;

  ScreenFieldAttr(
      {this.isPhoneVerified,
        this.userStatus,
        this.dateOfRegistration,
        this.aadharid,
        this.isAdminApproved,
        this.reportsToId,
        this.ifsccode,
        this.pannumber,
        this.emailVerified,
        this.password,
        this.dateOfAdminApproval,
        this.phone,
        this.name,
        this.id,
        this.bankname,
        this.bankAccountNum,
        this.email,
        this.reportsToName});

  ScreenFieldAttr.fromJson(Map<String, dynamic> json) {
    isPhoneVerified = json['isPhoneVerified'] != null
        ? new IsPhoneVerified.fromJson(json['isPhoneVerified'])
        : null;
    userStatus = json['userStatus'] != null
        ? new IsPhoneVerified.fromJson(json['userStatus'])
        : null;
    dateOfRegistration = json['dateOfRegistration'] != null
        ? new IsPhoneVerified.fromJson(json['dateOfRegistration'])
        : null;
    aadharid = json['aadharid'] != null
        ? new IsPhoneVerified.fromJson(json['aadharid'])
        : null;
    isAdminApproved = json['isAdminApproved'] != null
        ? new IsPhoneVerified.fromJson(json['isAdminApproved'])
        : null;
    reportsToId = json['reportsToId'] != null
        ? new ReportsToId.fromJson(json['reportsToId'])
        : null;
    ifsccode = json['ifsccode'] != null
        ? new IsPhoneVerified.fromJson(json['ifsccode'])
        : null;
    pannumber = json['pannumber'] != null
        ? new IsPhoneVerified.fromJson(json['pannumber'])
        : null;
    emailVerified = json['emailVerified'] != null
        ? new IsPhoneVerified.fromJson(json['emailVerified'])
        : null;
    password = json['password'] != null
        ? new IsPhoneVerified.fromJson(json['password'])
        : null;
    dateOfAdminApproval = json['dateOfAdminApproval'] != null
        ? new IsPhoneVerified.fromJson(json['dateOfAdminApproval'])
        : null;
    phone = json['phone'] != null
        ? new IsPhoneVerified.fromJson(json['phone'])
        : null;
    name = json['name'] != null
        ? new IsPhoneVerified.fromJson(json['name'])
        : null;
    id = json['id'] != null ? new IsPhoneVerified.fromJson(json['id']) : null;
    bankname = json['bankname'] != null
        ? new IsPhoneVerified.fromJson(json['bankname'])
        : null;
    bankAccountNum = json['bankAccountNum'] != null
        ? new IsPhoneVerified.fromJson(json['bankAccountNum'])
        : null;
    email = json['email'] != null
        ? new IsPhoneVerified.fromJson(json['email'])
        : null;
    reportsToName = json['reportsToName'] != null
        ? new IsPhoneVerified.fromJson(json['reportsToName'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.isPhoneVerified != null) {
      data['isPhoneVerified'] = this.isPhoneVerified.toJson();
    }
    if (this.userStatus != null) {
      data['userStatus'] = this.userStatus.toJson();
    }
    if (this.dateOfRegistration != null) {
      data['dateOfRegistration'] = this.dateOfRegistration.toJson();
    }
    if (this.aadharid != null) {
      data['aadharid'] = this.aadharid.toJson();
    }
    if (this.isAdminApproved != null) {
      data['isAdminApproved'] = this.isAdminApproved.toJson();
    }
    if (this.reportsToId != null) {
      data['reportsToId'] = this.reportsToId.toJson();
    }
    if (this.ifsccode != null) {
      data['ifsccode'] = this.ifsccode.toJson();
    }
    if (this.pannumber != null) {
      data['pannumber'] = this.pannumber.toJson();
    }
    if (this.emailVerified != null) {
      data['emailVerified'] = this.emailVerified.toJson();
    }
    if (this.password != null) {
      data['password'] = this.password.toJson();
    }
    if (this.dateOfAdminApproval != null) {
      data['dateOfAdminApproval'] = this.dateOfAdminApproval.toJson();
    }
    if (this.phone != null) {
      data['phone'] = this.phone.toJson();
    }
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    if (this.id != null) {
      data['id'] = this.id.toJson();
    }
    if (this.bankname != null) {
      data['bankname'] = this.bankname.toJson();
    }
    if (this.bankAccountNum != null) {
      data['bankAccountNum'] = this.bankAccountNum.toJson();
    }
    if (this.email != null) {
      data['email'] = this.email.toJson();
    }
    if (this.reportsToName != null) {
      data['reportsToName'] = this.reportsToName.toJson();
    }
    return data;
  }
}

class IsPhoneVerified {
  bool isFormfield;
  bool isDisabled;

  IsPhoneVerified({this.isFormfield, this.isDisabled});

  IsPhoneVerified.fromJson(Map<String, dynamic> json) {
    isFormfield = json['isFormfield'];
    isDisabled = json['isDisabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFormfield'] = this.isFormfield;
    data['isDisabled'] = this.isDisabled;
    return data;
  }
}

class ReportsToId {
  bool isFormfield;
  bool isDisabled;
  String promptScreen;
  String promptParams;
  ReturnFieldMap returnFieldMap;

  ReportsToId(
      {this.isFormfield,
        this.isDisabled,
        this.promptScreen,
        this.promptParams,
        this.returnFieldMap});

  ReportsToId.fromJson(Map<String, dynamic> json) {
    isFormfield = json['isFormfield'];
    isDisabled = json['isDisabled'];
    promptScreen = json['promptScreen'];
    promptParams = json['promptParams'];
    returnFieldMap = json['returnFieldMap'] != null
        ? new ReturnFieldMap.fromJson(json['returnFieldMap'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFormfield'] = this.isFormfield;
    data['isDisabled'] = this.isDisabled;
    data['promptScreen'] = this.promptScreen;
    data['promptParams'] = this.promptParams;
    if (this.returnFieldMap != null) {
      data['returnFieldMap'] = this.returnFieldMap.toJson();
    }
    return data;
  }
}

class ReturnFieldMap {
  String name;
  String id;

  ReturnFieldMap({this.name, this.id});

  ReturnFieldMap.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}