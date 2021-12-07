class DeleteProject {
  String screenName;
  String language;
  String mode;
  ScreenObject screenObject;

  DeleteProject({this.screenName, this.language, this.mode, this.screenObject}){
    if(screenObject==null){
      screenObject=ScreenObject();
    }
  }

  DeleteProject.fromJson(Map<String, dynamic> json) {
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
  String projectid;
  String name;
  String description;
  String projectsponsor;
  String startdate;
  String enddate;

  ScreenObject(
      {this.projectid,
        this.name,
        this.description,
        this.projectsponsor,
        this.startdate,
        this.enddate});

  ScreenObject.fromJson(Map<String, dynamic> json) {
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