class GetErrorList {
  String status;
  Body body;

  GetErrorList({this.status, this.body});

  GetErrorList.fromJson(Map<String, dynamic> json) {
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
        this.headerFieldAttribute}){ if(screenData==null){
  screenData=ScreenData();
  }}

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
  int recordsTotal;
  int recordsFiltered;
  List<SearchFields> searchFields;
  List<ErrorMultiOccData> multiOccData;
  Null erorpfx;
  Null erorlang;

  ScreenData(
      {this.recordsTotal,
        this.recordsFiltered,
        this.searchFields,
        this.multiOccData,
        this.erorpfx,
        this.erorlang});

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
      multiOccData = new List<ErrorMultiOccData>();
      json['multiOccData'].forEach((v) {
        multiOccData.add(new ErrorMultiOccData.fromJson(v));
      });
    }
    erorpfx = json['erorpfx'];
    erorlang = json['erorlang'];
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
    data['erorpfx'] = this.erorpfx;
    data['erorlang'] = this.erorlang;
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

class ErrorMultiOccData {
  String eroreror;
  String erordesc;
  List<Actions> actions;

  ErrorMultiOccData({this.eroreror, this.erordesc, this.actions});

  ErrorMultiOccData.fromJson(Map<String, dynamic> json) {
    eroreror = json['eroreror'];
    erordesc = json['erordesc'];
    if (json['actions'] != null) {
      actions = new List<Actions>();
      json['actions'].forEach((v) {
        actions.add(new Actions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eroreror'] = this.eroreror;
    data['erordesc'] = this.erordesc;
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

class ScreenFieldAttr {
  Eroreror eroreror;
  Eroreror erordesc;

  ScreenFieldAttr({this.eroreror, this.erordesc});

  ScreenFieldAttr.fromJson(Map<String, dynamic> json) {
    eroreror = json['eroreror'] != null
        ? new Eroreror.fromJson(json['eroreror'])
        : null;
    erordesc = json['erordesc'] != null
        ? new Eroreror.fromJson(json['erordesc'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eroreror != null) {
      data['eroreror'] = this.eroreror.toJson();
    }
    if (this.erordesc != null) {
      data['erordesc'] = this.erordesc.toJson();
    }
    return data;
  }
}

class Eroreror {
  bool isFormfield;
  bool isDisabled;

  Eroreror({this.isFormfield, this.isDisabled});

  Eroreror.fromJson(Map<String, dynamic> json) {
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