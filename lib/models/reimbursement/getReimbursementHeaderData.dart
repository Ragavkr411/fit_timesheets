class HeaderFieldMap {
  String month;
  String year;
  String monthdesc;
  String userid;
  String status;

  HeaderFieldMap(
      {this.month, this.year, this.monthdesc, this.userid, this.status});

  HeaderFieldMap.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    year = json['year'];
    monthdesc = json['monthdesc'];
    userid = json['userid'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['year'] = this.year;
    data['monthdesc'] = this.monthdesc;
    data['userid'] = this.userid;
    data['status'] = this.status;
    return data;
  }
}
