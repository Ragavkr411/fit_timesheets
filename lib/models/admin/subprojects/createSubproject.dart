class CreateSubProject {
  String screenName;
  String language;
  String mode;
  ScreenObject screenObject;

  CreateSubProject({this.screenName, this.language, this.mode, this.screenObject}){
    if(screenObject==null){
      screenObject=ScreenObject();
    }
  }

  CreateSubProject.fromJson(Map<String, dynamic> json) {
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
  String subprojectid;
  String name;
  String description;
  String startdate;
  String enddate;

  ScreenObject(
      {this.subprojectid,
        this.name,
        this.description,
        this.startdate,
        this.enddate});

  ScreenObject.fromJson(Map<String, dynamic> json) {
    subprojectid = json['subprojectid'];
    name = json['name'];
    description = json['description'];
    startdate = json['startdate'];
    enddate = json['enddate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subprojectid'] = this.subprojectid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;
    return data;
  }
}