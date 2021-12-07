class ActivitiesEntry {
  String screenName;
  String language;
  String mode;
  ScreenObject screenObject;

  ActivitiesEntry({this.screenName, this.language, this.mode, this.screenObject}) {
    if(screenObject==null){
  screenObject=ScreenObject();
  }}

  ActivitiesEntry.fromJson(Map<String, dynamic> json) {
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
  String activityid;
  String name;
  String description;
  String startdate;
  String enddate;

  ScreenObject(
      {this.activityid,
        this.name,
        this.description,
        this.startdate,
        this.enddate});

  ScreenObject.fromJson(Map<String, dynamic> json) {
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