class AddItems {
  String screenName;
  String language;
  String mode;
  ScreenObject screenObject;
  String headerMode;
  HeaderFieldMap headerFieldMap;
  bool respondWithSummary;

  AddItems(
      {this.screenName,
        this.language,
        this.mode,
        this.headerMode,
        this.headerFieldMap,
        this.respondWithSummary}){
    if(screenObject==null){
      screenObject=ScreenObject();
    }
    if(headerFieldMap==null){
      headerFieldMap=HeaderFieldMap();
    }}

  AddItems.fromJson(Map<String, dynamic> json) {
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
  String rimbtypedesc;
  String image;
  String examount;
  String rimbtypeid;
  String inlineActionDisabled;
  bool proofDocumentExist;

  ScreenObject(
      {this.rimbtypedesc,
        this.image,
        this.examount,
        this.rimbtypeid,
        this.inlineActionDisabled,
        this.proofDocumentExist});

  ScreenObject.fromJson(Map<String, dynamic> json) {
    rimbtypedesc = json['rimbtypedesc'];
    image = json['image'];
    examount = json['examount'];
    rimbtypeid = json['rimbtypeid'];
    inlineActionDisabled = json['inlineActionDisabled'];
    proofDocumentExist = json['proofDocumentExist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rimbtypedesc'] = this.rimbtypedesc;
    data['image'] = this.image;
    data['examount'] = this.examount;
    data['rimbtypeid'] = this.rimbtypeid;
    data['inlineActionDisabled'] = this.inlineActionDisabled;
    data['proofDocumentExist'] = this.proofDocumentExist;
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