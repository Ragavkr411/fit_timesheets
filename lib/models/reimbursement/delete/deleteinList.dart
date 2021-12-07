class DeleteReimbInList {
  String screenName;
  String language;
  String headerMode;
  HeaderFieldMap headerFieldMap;

  DeleteReimbInList(
      {this.screenName, this.language, this.headerMode}){
  if(headerFieldMap==null){
    headerFieldMap=HeaderFieldMap();
  }
  }

  DeleteReimbInList.fromJson(Map<String, dynamic> json) {
    screenName = json['screenName'];
    language = json['language'];
    headerMode = json['headerMode'];
    headerFieldMap = json['headerFieldMap'] != null
        ? new HeaderFieldMap.fromJson(json['headerFieldMap'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['screenName'] = this.screenName;
    data['language'] = this.language;
    data['headerMode'] = this.headerMode;
    if (this.headerFieldMap != null) {
      data['headerFieldMap'] = this.headerFieldMap.toJson();
    }
    return data;
  }
}

class HeaderFieldMap {
  String year;
  String month;

  HeaderFieldMap({this.year, this.month});

  HeaderFieldMap.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    return data;
  }
}