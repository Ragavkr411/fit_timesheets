class ActivitiesListData {
  String status;
  Body body;

  ActivitiesListData({this.status, this.body});

  ActivitiesListData.fromJson(Map<String, dynamic> json) {
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
        this.optionalSwitches,
        this.nextScreen,
        this.screenFieldAttr,
        this.headerFieldAttribute}){
  if(screenData==null){
  screenData=ScreenData();
  }}

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
  List<MultiOccDataActivity> multiOccData;

  ScreenData(
      {this.recordsTotal,
        this.recordsFiltered,
        this.searchFields}){
    if(multiOccData==null){
      multiOccData=MultiOccDataActivity() as List<MultiOccDataActivity>;
    }}

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
      multiOccData = new List<MultiOccDataActivity>();
      json['multiOccData'].forEach((v) {
        multiOccData.add(new MultiOccDataActivity.fromJson(v));
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

class MultiOccDataActivity {
  String activityid;
  String name;
  String enddate;
  String startdate;
  List<Actions> actions;

  MultiOccDataActivity(
      {this.activityid, this.name, this.enddate, this.startdate, this.actions});

  MultiOccDataActivity.fromJson(Map<String, dynamic> json) {
    activityid = json['activityid'];
    name = json['name'];
    enddate = json['enddate'];
    startdate = json['startdate'];
    if (json['actions'] != null) {
      actions = new List<Actions>();
      json['actions'].forEach((v) {
        actions.add(new Actions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityid'] = this.activityid;
    data['name'] = this.name;
    data['enddate'] = this.enddate;
    data['startdate'] = this.startdate;
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