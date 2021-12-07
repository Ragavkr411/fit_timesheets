class CreateProjGroup {
  String screenName;
  String language;
  String mode;
  ScreenObject screenObject;

  CreateProjGroup(
      {this.screenName, this.language, this.mode, this.screenObject}){
    if(screenObject==null){
      screenObject=ScreenObject();
    }
  }

  CreateProjGroup.fromJson(Map<String, dynamic> json) {
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
  int id;
  String name;

  ScreenObject({this.id, this.name});

  ScreenObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}