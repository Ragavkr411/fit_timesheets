class Update {
  String screenName;
  String language;
  String mode;
  ScreenObject screenObject;
  String headerMode;
  HeaderFieldMap headerFieldMap;
  bool respondWithSummary;

  Update(
      {this.screenName,
        this.language,
        this.mode,
        this.headerMode,
        this.respondWithSummary}){
  if(headerFieldMap==null){
  headerFieldMap=HeaderFieldMap();
  }
  if(screenObject==null){
  screenObject=ScreenObject();
  }}

  Update.fromJson(Map<String, dynamic> json) {
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
  String rimbtypedesc;
  String examount;
  bool inlineActionDisabled;
  Null image;
  bool proofDocumentExist;

  ScreenObject(
      {this.rimbtypeid,
        this.rimbtypedesc,
        this.examount,
        this.inlineActionDisabled,
        this.image,
        this.proofDocumentExist});

  ScreenObject.fromJson(Map<String, dynamic> json) {
    rimbtypeid = json['rimbtypeid'];
    rimbtypedesc = json['rimbtypedesc'];
    examount = json['examount'];
    inlineActionDisabled = json['inlineActionDisabled'];
    image = json['image'];
    proofDocumentExist = json['proofDocumentExist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rimbtypeid'] = this.rimbtypeid;
    data['rimbtypedesc'] = this.rimbtypedesc;
    data['examount'] = this.examount;
    data['inlineActionDisabled'] = this.inlineActionDisabled;
    data['image'] = this.image;
    data['proofDocumentExist'] = this.proofDocumentExist;
    return data;
  }
}

class HeaderFieldMap {
  String month;
  String year;
  String monthdesc;
  String userid;
  String status;

  HeaderFieldMap(
      {this.month, this.year, this.monthdesc, this.userid, this.status});

  HeaderFieldMap.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    year = json['year'];
    monthdesc = json['monthdesc'];
    userid = json['userid'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['year'] = this.year;
    data['monthdesc'] = this.monthdesc;
    data['userid'] = this.userid;
    data['status'] = this.status;
    return data;
  }
}