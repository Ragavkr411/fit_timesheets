class GetUsersList {
  String status;
  Body body;

  GetUsersList({this.status, this.body});

  GetUsersList.fromJson(Map<String, dynamic> json) {
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
  Null screenFieldAttr;
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
    screenFieldAttr = json['screenFieldAttr'];
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
    data['screenFieldAttr'] = this.screenFieldAttr;
    data['headerFieldAttribute'] = this.headerFieldAttribute;
    return data;
  }
}

class ScreenData {
  int recordsTotal;
  int recordsFiltered;
  List<SearchFields> searchFields;
  List<MultiOccDataUser> multiOccData;

  ScreenData(
      {this.recordsTotal,
        this.recordsFiltered,
        this.searchFields,
        this.multiOccData});

  ScreenData.fromJson(Map<String, dynamic> json) {
    recordsTotal = json['recordsTotal'];
    recordsFiltered = json['recordsFiltered'];
    if (json['searchFields'] != null) {
      searchFields = new List<SearchFields>();
      json['searchFields'].forEach((v) {
        searchFields.add(new SearchFields.fromJson(v));
      });
    }
    if (json['multiOccData'] != null) {
      multiOccData = new List<MultiOccDataUser>();
      json['multiOccData'].forEach((v) {
        multiOccData.add(new MultiOccDataUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recordsTotal'] = this.recordsTotal;
    data['recordsFiltered'] = this.recordsFiltered;
    if (this.searchFields != null) {
      data['searchFields'] = this.searchFields.map((v) => v.toJson()).toList();
    }
    if (this.multiOccData != null) {
      data['multiOccData'] = this.multiOccData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchFields {
  String displayName;
  String fieldName;

  SearchFields({this.displayName, this.fieldName});

  SearchFields.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    fieldName = json['fieldName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['fieldName'] = this.fieldName;
    return data;
  }
}

class MultiOccDataUser {
  String id;
  String name;
  String phone;
  String email;
  String userStatus;
  List<Actions> actions;

  MultiOccDataUser(
      {this.id,
        this.name,
        this.phone,
        this.email,
        this.userStatus,
        this.actions});

  MultiOccDataUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    userStatus = json['userStatus'];
    if (json['actions'] != null) {
      actions = new List<Actions>();
      json['actions'].forEach((v) {
        actions.add(new Actions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['userStatus'] = this.userStatus;
    if (this.actions != null) {
      data['actions'] = this.actions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Actions {
  String displayName;
  String screenName;
  String switchType;
  String hint;
  bool hasData;
  String mode;

  Actions(
      {this.displayName,
        this.screenName,
        this.switchType,
        this.hint,
        this.hasData,
        this.mode});

  Actions.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    screenName = json['screenName'];
    switchType = json['switchType'];
    hint = json['hint'];
    hasData = json['hasData'];
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['screenName'] = this.screenName;
    data['switchType'] = this.switchType;
    data['hint'] = this.hint;
    data['hasData'] = this.hasData;
    data['mode'] = this.mode;
    return data;
  }
}