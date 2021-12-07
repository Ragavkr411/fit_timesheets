class DeleteProj {
  String screenName;
  String language;
  String mode;
  ScreenObject screenObject;
  String headerMode;
  HeaderFieldMap headerFieldMap;
  bool respondWithSummary;

  DeleteProj({this.screenName, this.language, this.mode, this.screenObject, this.headerMode, this.headerFieldMap, this.respondWithSummary});

  DeleteProj.fromJson(Map<String, dynamic> json) {
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
  int id;
  String name;
  String userid;

  ScreenObject({this.id, this.name, this.userid});

  ScreenObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userid = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['userid'] = this.userid;
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