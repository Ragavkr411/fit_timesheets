import 'package:fit_timesheets/models/screenData.dart';
import 'package:fit_timesheets/models/screenFieldAttr.dart';

class Bodie {
 // String screenName;
  ScreenData screenData;
  Null optionalSwitches;
  Null nextScreen;
  SearchFields screenFieldAttr;
  Null headerFieldAttribute;

  Bodie(
      {//this.screenName,
        this.screenData,
        this.optionalSwitches,
        this.nextScreen,
        this.screenFieldAttr,
        this.headerFieldAttribute});

  Bodie.fromJson(Map<String, dynamic> json) {
    //screenName = json['screenName'];
    screenData = json['screenData'] != null
        ? new ScreenData.fromJson(json['screenData'])
        : null;
    optionalSwitches = json['optionalSwitches'];
    nextScreen = json['nextScreen'];
    screenFieldAttr = json['screenFieldAttr'] != null
        ? new SearchFields.fromJson(json['screenFieldAttr'])
        : null;
    headerFieldAttribute = json['headerFieldAttribute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
  //  data['screenName'] = this.screenName;
    if (this.screenData != null) {
      data['screenData'] = this.screenData.toJson();
    }
    data['optionalSwitches'] = this.optionalSwitches;
    data['nextScreen'] = this.nextScreen;
    if (this.screenFieldAttr != null) {
      data['screenFieldAttr'] = this.screenFieldAttr.toJson();
    }
    data['headerFieldAttribute'] = this.headerFieldAttribute;
    return data;
  }
}

