
class ReimbSearchFields {
  String displayName;
  String fieldName;

  ReimbSearchFields(this.displayName, this.fieldName);

  ReimbSearchFields.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    fieldName = json['fieldName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['fieldName'] = this.fieldName;
    return data;
  }
}