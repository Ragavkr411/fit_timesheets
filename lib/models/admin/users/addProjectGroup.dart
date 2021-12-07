class AddProjGroupDrop {
  String screenName;
  String language;
  String mode;
  ScreenObject screenObject;
  String headerMode;
  bool respondWithSummary;

  AddProjGroupDrop({this.screenName, this.language, this.mode, this.headerMode, this.respondWithSummary}){
    if(screenObject==null){
      screenObject=ScreenObject();
    }
  }

  AddProjGroupDrop.fromJson(Map<String, dynamic> json) {
    screenName = json['screenName'];
    language = json['language'];
    mode = json['mode'];
    screenObject = json['screenObject'] != null ? new ScreenObject.fromJson(json['screenObject']) : null;
    headerMode = json['headerMode'];
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

    data['respondWithSummary'] = this.respondWithSummary;
    return data;
  }
}

class ScreenObject {
  String name;
  int id;
  String userid;

  ScreenObject({this.name, this.id, this.userid});

  ScreenObject.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    userid = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['userid'] = this.userid;
    return data;
  }
}

