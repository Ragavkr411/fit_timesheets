class Delete {
  String screenName;
  String language;
  String mode;
  ScreenObject screenObject;
  String headerMode;
  HeaderFieldMap headerFieldMap;
  bool respondWithSummary;

  Delete(
      {this.screenName,
        this.language,
        this.mode,
        this.screenObject,
        this.headerMode,
        this.headerFieldMap,
        this.respondWithSummary}){
    if(headerFieldMap==null){
      headerFieldMap=HeaderFieldMap();
    }
    if(screenObject==null){
      screenObject=ScreenObject();
    }

  }

  Delete.fromJson(Map<String, dynamic> json) {
    screenName = json['screenName'];
    language = json['language'];
    mode = json['mode'];
    screenObject = json['screenObject'] != null
        ? new ScreenObject.fromJson(json['screenObject'])
        : null;
    headerMode = json['headerMode'];
    headerFieldMap = json['headerFieldMap'] != null
        ? new HeaderFieldMap.fromJson(json['headerFieldMap'])
        : null;
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
  String rimbtypeid;
  String examount;

  ScreenObject({this.rimbtypeid, this.examount});

  ScreenObject.fromJson(Map<String, dynamic> json) {
    rimbtypeid = json['rimbtypeid'];
    examount = json['examount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rimbtypeid'] = this.rimbtypeid;
    data['examount'] = this.examount;
    return data;
  }
}

class HeaderFieldMap {
  String month;
  String year;

  HeaderFieldMap({this.month, this.year});

  HeaderFieldMap.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['year'] = this.year;
    return data;
  }
}