import 'getReimbursementBodyScreenData.dart';

class ReimbBody {
  String screenName;
  ReimbScreenData screenData;
  String optionalSwitches;
  String nextScreen;
  String screenFieldAttr;
  String headerFieldAttribute;

  ReimbBody(
      {this.screenName,
        this.screenData,
        this.optionalSwitches,
        this.nextScreen,
        this.screenFieldAttr,
        this.headerFieldAttribute});

  ReimbBody.fromJson(Map<String, dynamic> json) {
    screenName = json['screenName'];
    screenData = json['screenData'] != null
        ? new ReimbScreenData.fromJson(json['screenData'])
        : null;
    optionalSwitches = json['optionalSwitches'];
    nextScreen = json['nextScreen'];
    screenFieldAttr = json['screenFieldAttr'];
    headerFieldAttribute = json['headerFieldAttribute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['screenName'] = this.screenName;
    if (this.screenData != null) {
      data['screenData'] = this.screenData.toJson();
    }
    data['optionalSwitches'] = this.optionalSwitches;
    data['nextScreen'] = this.nextScreen;
    data['screenFieldAttr'] = this.screenFieldAttr;
    data['headerFieldAttribute'] = this.headerFieldAttribute;
    return data;
  }

  @override
  String toString() {
    return 'ReimbBody{screenName: $screenName, screenData: $screenData, optionalSwitches: $optionalSwitches, nextScreen: $nextScreen, screenFieldAttr: $screenFieldAttr, headerFieldAttribute: $headerFieldAttribute}';
  }
}
