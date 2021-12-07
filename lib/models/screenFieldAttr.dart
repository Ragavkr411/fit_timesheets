

class SearchFields{


String displayName;
String fieldName;

  SearchFields(
      this.displayName,
      this.fieldName,
    );

SearchFields.fromJson(Map<String, dynamic>json){
  displayName=json['displayName'];
  fieldName=json['fieldName'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['displayName'] = this.displayName;
  data['fieldName'] = this.fieldName;

  return data;
}

@override
  String toString() {
    return 'ScreenFields{displayName: $displayName, fieldName: $fieldName}';
  }
}
