class Actions{

  String displayName;
  String screenName;
  String switchType;
  String hint;
  String mode;
  bool hasData;

  Actions(this.displayName, this.screenName, this.switchType, this.hint,
      this.mode, this.hasData);

  Actions.fromJson(Map<String, dynamic> json) {
    displayName= json["displayName"];
    screenName= json["screenName"];
    switchType= json["switchType"];
    hint= json["hint"];
    mode= json["mode"];
    hasData= json["hasData"];

  }

  Map<String, dynamic> toJson() {
    return {
      "displayName": this.displayName,
      "screenName": this.screenName,
      "switchType": this.switchType,
      "hint": this.hint,
      "mode": this.mode,
      "hasData": this.hasData,
      };
  }

}