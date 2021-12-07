class Detail0 {
  bool isFormfield;
  bool isDisabled;

  Detail0({this.isFormfield, this.isDisabled});

  Detail0.fromJson(Map<String, dynamic> json) {
    isFormfield = json['isFormfield'];
    isDisabled = json['isDisabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFormfield'] = this.isFormfield;
    data['isDisabled'] = this.isDisabled;
    return data;
  }

  @override
  String toString() {
    return 'Detail0{isFormfield: $isFormfield, isDisabled: $isDisabled}';
  }
}
