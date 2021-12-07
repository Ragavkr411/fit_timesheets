import 'package:fit_timesheets/models/getTimeSheet/screenFieldAttribute.dart';
import 'package:fit_timesheets/models/screenData.dart';

class Boody{
  String screenName;
  ScreenData screenData;
  int optionalSwitches;
  int nextScreen;
  int headerFieldAttribute;

  Boody(
      {this.screenName,
      this.screenData,
      this.optionalSwitches,
      this.nextScreen,
      this.headerFieldAttribute});

  factory Boody.fromJson(Map<String, dynamic> json) {
    return Boody(
      screenName: json["screenName"],
      screenData: ScreenData.fromJson(json["screenData"]),
      optionalSwitches: json["optionalSwitches"],
      nextScreen: json["nextScreen"],
      headerFieldAttribute:json["headerFieldAttribute"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "screenName": this.screenName,
      "screenData": this.screenData,
      "optionalSwitches": this.optionalSwitches,
      "nextScreen": this.nextScreen,
      "headerFieldAttribute": this.headerFieldAttribute,
    };
  }

  @override
  String toString() {
    return 'Bodie{screenName: $screenName, screenData: $screenData, optionalSwitches: $optionalSwitches, nextScreen: $nextScreen, headerFieldAttribute: $headerFieldAttribute}';
  }

//

}