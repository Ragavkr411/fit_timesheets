class ActivateUser {
  String screenName;
  String language;
  String mode;
  ScreenObject screenObject;

  ActivateUser({this.screenName, this.language, this.mode, this.screenObject}){
    if(screenObject==null){
      screenObject=ScreenObject();
    }
  }

  ActivateUser.fromJson(Map<String, dynamic> json) {
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

class ScreenObject {int id;
  String phone;

  ScreenObject({this.id, this.phone});

  ScreenObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    return data;
  }
}