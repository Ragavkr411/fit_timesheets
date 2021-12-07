import 'package:fit_timesheets/models/clone/screenData.dart';
import 'package:fit_timesheets/models/getTimeSheet/screenFieldAttribute.dart';
import 'package:fit_timesheets/models/screenData.dart';

class CloneBoody{
  String screenName;
  CloneScreenData screenData;
  int optionalSwitches;
  int nextScreen;
  int headerFieldAttribute;

  CloneBoody(
      {this.screenName,
      this.screenData,
      this.optionalSwitches,
      this.nextScreen,
      this.headerFieldAttribute});

  factory CloneBoody.fromJson(Map<String, dynamic> json) {
    return CloneBoody(
      screenName: json["screenName"],
      screenData: CloneScreenData.fromJson(json["screenData"]),
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
    return 'CloneBoody{screenName: $screenName, screenData: $screenData, optionalSwitches: $optionalSwitches, nextScreen: $nextScreen, headerFieldAttribute: $headerFieldAttribute}';
  }

//

}