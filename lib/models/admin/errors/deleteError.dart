class DeleteError {
  String screenName;
  String language;
  String mode;
  ScreenObject screenObject;
  //HeaderFieldMap headerFieldMap;
  bool respondWithSummary;

  DeleteError({this.screenName, this.language, this.mode, this.screenObject,  this.respondWithSummary}){ if(screenObject==null){
    screenObject=ScreenObject();
  }}

  DeleteError.fromJson(Map<String, dynamic> json) {
    screenName = json['screenName'];
    language = json['language'];
    mode = json['mode'];
    screenObject = json['screenObject'] != null ? new ScreenObject.fromJson(json['screenObject']) : null;
    //headerFieldMap = json['headerFieldMap'] != null ? new HeaderFieldMap.fromJson(json['headerFieldMap']) : null;
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
    // if (this.headerFieldMap != null) {
    //   data['headerFieldMap'] = this.headerFieldMap.toJson();
    // }
    data['respondWithSummary'] = this.respondWithSummary;
    return data;
  }
}

class ScreenObject {
  String eroreror;
  String erordesc;

  ScreenObject({this.eroreror, this.erordesc});

  ScreenObject.fromJson(Map<String, dynamic> json) {
    eroreror = json['eroreror'];
    erordesc = json['erordesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eroreror'] = this.eroreror;
    data['erordesc'] = this.erordesc;
    return data;
  }
}

