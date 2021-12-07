class ReimbMultiOccData {
  String rimbtypeid;
  String rimbtypedesc;
  String examount;
  bool inlineActionDisabled;
  Null image;
  bool proofDocumentExist;
  String status;
  String totalAmt;
  String year;
  String month;
  String statusDate;
  String approvedBy;


  ReimbMultiOccData(
      this.rimbtypeid,
      this.rimbtypedesc,
      this.examount,
      this.inlineActionDisabled,
      this.image,
      this.proofDocumentExist,
      this.status,
      this.totalAmt,
      this.approvedBy,
      this.month,
      this.statusDate,
      this.year);

  ReimbMultiOccData.fromJson(Map<String, dynamic> json) {
    rimbtypeid = json['rimbtypeid'];
    rimbtypedesc = json['rimbtypedesc'];
    examount = json['examount'];
    inlineActionDisabled = json['inlineActionDisabled'];
    image = json['image'];
    proofDocumentExist = json['proofDocumentExist'];
    status = json['status'];
    totalAmt = json['totalAmt'];
    year = json['year'];
    month = json['month'];
    statusDate = json['statusDate'];
    approvedBy = json['approvedBy'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rimbtypeid'] = this.rimbtypeid;
    data['rimbtypedesc'] = this.rimbtypedesc;
    data['examount'] = this.examount;
    data['inlineActionDisabled'] = this.inlineActionDisabled;
    data['image'] = this.image;
    data['proofDocumentExist'] = this.proofDocumentExist;
    data['status'] = this.status;
    data['totalAmt'] = this.totalAmt;
    data['year'] = this.year;
    data['month'] = this.month;
    data['approvedBy'] = this.approvedBy;
    data['statusDate'] = this.statusDate;

    return data;
  }

  @override
  String toString() {
    return 'ReimbMultiOccData{rimbtypeid: $rimbtypeid, rimbtypedesc: $rimbtypedesc, examount: $examount, inlineActionDisabled: $inlineActionDisabled, image: $image, proofDocumentExist: $proofDocumentExist}';
  }
}
