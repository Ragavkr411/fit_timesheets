class ActivitiesRetrieve {
  String status;
  Body body;

  ActivitiesRetrieve({this.status, this.body});

  ActivitiesRetrieve.fromJson(Map<String, dynamic> json) {
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
  String activityid;
  String name;
  String description;
  String startdate;
  String enddate;

  ScreenData(
      {this.activityid,
        this.name,
        this.description,
        this.startdate,
        this.enddate});

  ScreenData.fromJson(Map<String, dynamic> json) {
    activityid = json['activityid'];
    name = json['name'];
    description = json['description'];
    startdate = json['startdate'];
    enddate = json['enddate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityid'] = this.activityid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;
    return data;
  }
}

class ScreenFieldAttr {
  Activityid activityid;
  Enddate enddate;
  Activityid name;
  Activityid description;
  Enddate startdate;

  ScreenFieldAttr(
      {this.activityid,
        this.enddate,
        this.name,
        this.description,
        this.startdate});

  ScreenFieldAttr.fromJson(Map<String, dynamic> json) {
    activityid = json['activityid'] != null
        ? new Activityid.fromJson(json['activityid'])
        : null;
    enddate =
    json['enddate'] != null ? new Enddate.fromJson(json['enddate']) : null;
    name = json['name'] != null ? new Activityid.fromJson(json['name']) : null;
    description = json['description'] != null
        ? new Activityid.fromJson(json['description'])
        : null;
    startdate = json['startdate'] != null
        ? new Enddate.fromJson(json['startdate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activityid != null) {
      data['activityid'] = this.activityid.toJson();
    }
    if (this.enddate != null) {
      data['enddate'] = this.enddate.toJson();
    }
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description.toJson();
    }
    if (this.startdate != null) {
      data['startdate'] = this.startdate.toJson();
    }
    return data;
  }
}

class Activityid {
  bool isFormfield;
  bool isDisabled;

  Activityid({this.isFormfield, this.isDisabled});

  Activityid.fromJson(Map<String, dynamic> json) {
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

class Enddate {
  bool isFormfield;
  String dataType;
  bool isDisabled;

  Enddate({this.isFormfield, this.dataType, this.isDisabled});

  Enddate.fromJson(Map<String, dynamic> json) {
    isFormfield = json['isFormfield'];
    dataType = json['dataType'];
    isDisabled = json['isDisabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFormfield'] = this.isFormfield;
    data['dataType'] = this.dataType;
    data['isDisabled'] = this.isDisabled;
    return data;
  }
}