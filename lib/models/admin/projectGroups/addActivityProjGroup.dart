class AddActivitiesProjGroup {
  String screenName;
  String language;
  String mode;
  ScreenObject screenObject;
  String headerMode;
  HeaderFieldMap headerFieldMap;
  bool respondWithSummary;

  AddActivitiesProjGroup({this.screenName, this.language, this.mode,  this.headerMode, this.headerFieldMap, this.respondWithSummary}){
    if(screenObject==null){
      screenObject=ScreenObject();
    }
  }

  AddActivitiesProjGroup.fromJson(Map<String, dynamic> json) {
    screenName = json['screenName'];
    language = json['language'];
    mode = json['mode'];
    screenObject = json['screenObject'] != null ? new ScreenObject.fromJson(json['screenObject']) : null;
    headerMode = json['headerMode'];
    headerFieldMap = json['headerFieldMap'] != null ? new HeaderFieldMap.fromJson(json['headerFieldMap']) : null;
    respondWithSummary = json['respondWithSummary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['screenName'] = this.screenName;
    data['language'] = this.language;
    data['mode'] = this.mode;
    if (this.screenObject != null) {
      data['screenObject'] = this.screenObject.toJson();
    }
    data['headerMode'] = this.headerMode;
    if (this.headerFieldMap != null) {
      data['headerFieldMap'] = this.headerFieldMap.toJson();
    }
    data['respondWithSummary'] = this.respondWithSummary;
    return data;
  }
}

class ScreenObject {
  String activityid;
  String projectname;
  String enddate;
  String activityname;
  String startdate;
  String projectid;
  String userid;
  String subprojectid;
  String subprojectname;

  ScreenObject({this.activityid, this.projectname, this.enddate, this.activityname, this.startdate, this.projectid, this.userid, this.subprojectid, this.subprojectname});

  ScreenObject.fromJson(Map<String, dynamic> json) {
    activityid = json['activityid'];
    projectname = json['projectname'];
    enddate = json['enddate'];
    activityname = json['activityname'];
    startdate = json['startdate'];
    projectid = json['projectid'];
    userid = json['userid'];
    subprojectid = json['subprojectid'];
    subprojectname = json['subprojectname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityid'] = this.activityid;
    data['projectname'] = this.projectname;
    data['enddate'] = this.enddate;
    data['activityname'] = this.activityname;
    data['startdate'] = this.startdate;
    data['projectid'] = this.projectid;
    data['userid'] = this.userid;
    data['subprojectid'] = this.subprojectid;
    data['subprojectname'] = this.subprojectname;
    return data;
  }
}

class HeaderFieldMap {


  HeaderFieldMap();

HeaderFieldMap.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}