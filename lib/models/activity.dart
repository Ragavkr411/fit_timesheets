import 'package:fit_timesheets/models/screenData.dart';

class Body{
  String screenName;
  String optionalSwitches;
  String nextScreen;
  String headerFieldAttribute;

  ScreenData screenData;
 String screenFieldAttr;
  Body({this.screenName,this.optionalSwitches,this.nextScreen,this.headerFieldAttribute,this.screenFieldAttr,this.screenData});

  Body.fromJson(Map<String,dynamic>json)
      :screenName=json['screenName'],
        screenData= json["screenData"] == null ? null : ScreenData.fromJson(json["screenData"]),
       // screenFieldAttr= json["screenFieldAttr"] == null ? null : ScreenFieldAttr.fromJson(json["screenData"]),

      optionalSwitches=json['optionalSwitches'],
        nextScreen=json['nextScreen'],
        screenFieldAttr=json['screenFieldAttr'],
        headerFieldAttribute=json['headerFieldAttribute'];

  Map<String,dynamic> toJson()=>
      {
        'screenName':screenName,
        'screenData': screenData == null ? null : screenData.toJson(),
        //'screenFieldAttr': screenFieldAttr == null ? null : screenFieldAttr.toJson(),
        'optionalSwitches':optionalSwitches,
        'nextScreen': nextScreen,
        'screenFieldAttr':screenFieldAttr,
        'headerFieldAttribute':headerFieldAttribute,
      };

  @override
  String toString() {
    return 'Activity{screenName: $screenName, optionalSwitches: $optionalSwitches, nextScreen: $nextScreen, headerFieldAttribute: $headerFieldAttribute, screenData: $screenData}';
  }
}
