class DeleteActivityProjGroup {
  String screenName;
  String language;
  String mode;
  ScreenObject screenObject;
  String headerMode;
  HeaderFieldMap headerFieldMap;
  bool respondWithSummary;

  DeleteActivityProjGroup({this.screenName, this.language, this.mode,  this.headerMode, this.headerFieldMap, this.respondWithSummary}){
    if(screenObject==null){
      screenObject=ScreenObject();
    }
  }

  DeleteActivityProjGroup.fromJson(Map<String, dynamic> json) {
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
  String projectid;
  String userid;
  String subprojectid;
  String activityid;
  String projectname;
  String subprojectname;
  String activityname;
  String startdate;
  String enddate;

  ScreenObject({this.projectid, this.userid, this.subprojectid, this.activityid, this.projectname, this.subprojectname, this.activityname, this.startdate, this.enddate});

  ScreenObject.fromJson(Map<String, dynamic> json) {
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

class HeaderFieldMap {


  HeaderFieldMap();

HeaderFieldMap.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}