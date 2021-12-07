import 'package:fit_timesheets/models/screenObject.dart';

class Create {
  String screenName;
  String language;
  String mode;
  ScreenObjectModel screenObject;
  bool respondWithSummary;

  Create({this.screenName, this.language, this.mode, this.screenObject,
      this.respondWithSummary}){
    if(screenObject==null){
      screenObject=ScreenObjectModel();
    }
  }



  factory Create.fromJson(Map<String, dynamic> json) {
    return Create(
      screenName: json["screenName"],
      language: json["language"],
      mode: json["mode"],
      screenObject: ScreenObjectModel.fromJson(json["screenObject"]),
      respondWithSummary: json["respondWithSummary"].toLowerCase() == 'true',
    );

  }

  Map<String, dynamic> toJson() {
    return {
      "screenName": this.screenName,
      "language": this.language,
      "mode": this.mode,
      "screenObject": this.screenObject,
      "respondWithSummary": this.respondWithSummary,
    };
  }

  @override
  String toString() {
    return 'Create{screenName: $screenName, language: $language, mode: $mode, screenObject: $screenObject, respondWithSummary: $respondWithSummary}';
  }
}
