import 'package:fit_timesheets/models/returnFieldMaps.dart';

class ActivityId{
  String promptScreen;
  bool isFormfield;
  bool isDisabled;
  String promptParams;

  ReturnFieldMaps returnFieldMap;

  ActivityId(this.promptScreen, this.isFormfield, this.isDisabled,
      this.promptParams, this.returnFieldMap);

  ActivityId.fromJson(Map<String,dynamic>json)
      :promptScreen=json['promptScreen'],
        returnFieldMap= json["screenData"] == null ? null : ReturnFieldMaps.fromJson(json["screenData"]),

        isDisabled=json['isDisabled'],
        promptParams=json['promptParams'];

  Map<String, dynamic> toJson() {
    return {
      "promptScreen": this.promptScreen,
      "isFormfield": this.isFormfield,
      "isDisabled": this.isDisabled,
      "promptParams": this.promptParams,
      "returnFieldMap": this.returnFieldMap,
    };
  }

  @override
  String toString() {
    return 'ActivityId{promptScreen: $promptScreen, isFormfield: $isFormfield, isDisabled: $isDisabled, promptParams: $promptParams, returnFieldMap: $returnFieldMap}';
  }
}