import 'package:fit_timesheets/models/getTimeSheet/returnFieldMap.dart';

class Activityid {
  bool isFormfield;
  bool isDisabled;
  String promptScreen;
  String promptParams;
  ReturnFieldMap returnFieldMap;

  Activityid(
      {this.isFormfield,
        this.isDisabled,
        this.promptScreen,
        this.promptParams,
        this.returnFieldMap});

  Activityid.fromJson(Map<String, dynamic> json) {
    isFormfield = json['isFormfield'];
    isDisabled = json['isDisabled'];
    promptScreen = json['promptScreen'];
    promptParams = json['promptParams'];
    returnFieldMap = json['returnFieldMap'] != null
        ? new ReturnFieldMap.fromJson(json['returnFieldMap'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFormfield'] = this.isFormfield;
    data['isDisabled'] = this.isDisabled;
    data['promptScreen'] = this.promptScreen;
    data['promptParams'] = this.promptParams;
    if (this.returnFieldMap != null) {
      data['returnFieldMap'] = this.returnFieldMap.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Activityid{isFormfield: $isFormfield, isDisabled: $isDisabled, promptScreen: $promptScreen, promptParams: $promptParams, returnFieldMap: $returnFieldMap}';
  }
}