class ProjectRetrieveModel{
  String status;
  Body body;

  ProjectRetrieveModel({this.status, this.body});

  ProjectRetrieveModel.fromJson(Map<String, dynamic> json) {
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
        this.headerFieldAttribute}){
    if(screenData==null){
      screenData=ScreenData();
    }
  }

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
  String projectid;
  String name;
  String description;
  String projectsponsor;
  String startdate;
  String enddate;

  ScreenData(
      {this.projectid,
        this.name,
        this.description,
        this.projectsponsor,
        this.startdate,
        this.enddate});

  ScreenData.fromJson(Map<String, dynamic> json) {
    projectid = json['projectid'];
    name = json['name'];
    description = json['description'];
    projectsponsor = json['projectsponsor'];
    startdate = json['startdate'];
    enddate = json['enddate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectid'] = this.projectid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['projectsponsor'] = this.projectsponsor;
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;
    return data;
  }
}

class ScreenFieldAttr {
  Enddate enddate;
  Name name;
  Name description;
  Enddate startdate;
  Name projectid;
  Name projectsponsor;

  ScreenFieldAttr(
      {this.enddate,
        this.name,
        this.description,
        this.startdate,
        this.projectid,
        this.projectsponsor});

  ScreenFieldAttr.fromJson(Map<String, dynamic> json) {
    enddate =
    json['enddate'] != null ? new Enddate.fromJson(json['enddate']) : null;
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    description = json['description'] != null
        ? new Name.fromJson(json['description'])
        : null;
    startdate = json['startdate'] != null
        ? new Enddate.fromJson(json['startdate'])
        : null;
    projectid =
    json['projectid'] != null ? new Name.fromJson(json['projectid']) : null;
    projectsponsor = json['projectsponsor'] != null
        ? new Name.fromJson(json['projectsponsor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    if (this.projectid != null) {
      data['projectid'] = this.projectid.toJson();
    }
    if (this.projectsponsor != null) {
      data['projectsponsor'] = this.projectsponsor.toJson();
    }
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

class Name {
  bool isFormfield;
  bool isDisabled;

  Name({this.isFormfield, this.isDisabled});

  Name.fromJson(Map<String, dynamic> json) {
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