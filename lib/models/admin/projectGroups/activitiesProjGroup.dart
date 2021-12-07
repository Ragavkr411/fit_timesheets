class ActivitiesProjGroupModel {
  String status;
  Body body;

  ActivitiesProjGroupModel({this.status, this.body});

  ActivitiesProjGroupModel.fromJson(Map<String, dynamic> json) {
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

        this.optionalSwitches,
        this.nextScreen,
        this.screenFieldAttr,
        this.headerFieldAttribute}){
    if(ScreenData==null){
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
  int recordsTotal;
  int recordsFiltered;
  List<SearchFields> searchFields;
  List<MultiOccDataRetrieve> multiOccData;
  String groupid;

  ScreenData(
      {this.recordsTotal,
        this.recordsFiltered,
        this.searchFields,
        this.multiOccData,
        this.groupid});

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
      multiOccData = new List<MultiOccDataRetrieve>();
      json['multiOccData'].forEach((v) {
        multiOccData.add(new MultiOccDataRetrieve.fromJson(v));
      });
    }
    groupid = json['groupid'];
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
    data['groupid'] = this.groupid;
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

class MultiOccDataRetrieve {
  String projectid;
  String userid;
  String subprojectid;
  String activityid;
  String projectname;
  String subprojectname;
  String activityname;
  String startdate;
  String enddate;
  List<Null> actions;

  MultiOccDataRetrieve(
      {this.projectid,
        this.userid,
        this.subprojectid,
        this.activityid,
        this.projectname,
        this.subprojectname,
        this.activityname,
        this.startdate,
        this.enddate,
        this.actions});

  MultiOccDataRetrieve.fromJson(Map<String, dynamic> json) {
    projectid = json['projectid'];
    userid = json['userid'];
    subprojectid = json['subprojectid'];
    activityid = json['activityid'];
    projectname = json['projectname'];
    subprojectname = json['subprojectname'];
    activityname = json['activityname'];
    startdate = json['startdate'];
    enddate = json['enddate'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectid'] = this.projectid;
    data['userid'] = this.userid;
    data['subprojectid'] = this.subprojectid;
    data['activityid'] = this.activityid;
    data['projectname'] = this.projectname;
    data['subprojectname'] = this.subprojectname;
    data['activityname'] = this.activityname;
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;

    return data;
  }
}

class ScreenFieldAttr {
  Activityid activityid;
  Projectname projectname;
  Enddate enddate;
  Projectname activityname;
  Enddate startdate;
  Activityid projectid;
  Projectname userid;
  Projectname actions;
  Activityid subprojectid;
  Projectname subprojectname;

  ScreenFieldAttr(
      {this.activityid,
        this.projectname,
        this.enddate,
        this.activityname,
        this.startdate,
        this.projectid,
        this.userid,
        this.actions,
        this.subprojectid,
        this.subprojectname});

  ScreenFieldAttr.fromJson(Map<String, dynamic> json) {
    activityid = json['activityid'] != null
        ? new Activityid.fromJson(json['activityid'])
        : null;
    projectname = json['projectname'] != null
        ? new Projectname.fromJson(json['projectname'])
        : null;
    enddate =
    json['enddate'] != null ? new Enddate.fromJson(json['enddate']) : null;
    activityname = json['activityname'] != null
        ? new Projectname.fromJson(json['activityname'])
        : null;
    startdate = json['startdate'] != null
        ? new Enddate.fromJson(json['startdate'])
        : null;
    projectid = json['projectid'] != null
        ? new Activityid.fromJson(json['projectid'])
        : null;
    userid = json['userid'] != null
        ? new Projectname.fromJson(json['userid'])
        : null;
    actions = json['actions'] != null
        ? new Projectname.fromJson(json['actions'])
        : null;
    subprojectid = json['subprojectid'] != null
        ? new Activityid.fromJson(json['subprojectid'])
        : null;
    subprojectname = json['subprojectname'] != null
        ? new Projectname.fromJson(json['subprojectname'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activityid != null) {
      data['activityid'] = this.activityid.toJson();
    }
    if (this.projectname != null) {
      data['projectname'] = this.projectname.toJson();
    }
    if (this.enddate != null) {
      data['enddate'] = this.enddate.toJson();
    }
    if (this.activityname != null) {
      data['activityname'] = this.activityname.toJson();
    }
    if (this.startdate != null) {
      data['startdate'] = this.startdate.toJson();
    }
    if (this.projectid != null) {
      data['projectid'] = this.projectid.toJson();
    }
    if (this.userid != null) {
      data['userid'] = this.userid.toJson();
    }
    if (this.actions != null) {
      data['actions'] = this.actions.toJson();
    }
    if (this.subprojectid != null) {
      data['subprojectid'] = this.subprojectid.toJson();
    }
    if (this.subprojectname != null) {
      data['subprojectname'] = this.subprojectname.toJson();
    }
    return data;
  }
}

class Activityid {
  bool isFormfield;
  bool isDisabled;
  String promptScreen;
  String promptParams;
  ReturnFieldMap returnFieldMap;

  Activityid(
      {this.isFormfield,
        this.isDisabled,
        this.promptScreen,
        this.promptParams,
        this.returnFieldMap});

  Activityid.fromJson(Map<String, dynamic> json) {
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
  String activityid;
  String name;

  ReturnFieldMap({this.activityid, this.name});

  ReturnFieldMap.fromJson(Map<String, dynamic> json) {
    activityid = json['activityid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityid'] = this.activityid;
    data['name'] = this.name;
    return data;
  }
}

class Projectname {
  bool isFormfield;
  bool isDisabled;

  Projectname({this.isFormfield, this.isDisabled});

  Projectname.fromJson(Map<String, dynamic> json) {
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

class ReturnFieldMaps {
  String name;
  String projectid;

  ReturnFieldMaps({this.name, this.projectid});

  ReturnFieldMaps.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    projectid = json['projectid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['projectid'] = this.projectid;
    return data;
  }
}

class ReturnFieldMapss {
  String name;
  String subprojectid;

  ReturnFieldMapss({this.name, this.subprojectid});

  ReturnFieldMapss.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    subprojectid = json['subprojectid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['subprojectid'] = this.subprojectid;
    return data;
  }
}