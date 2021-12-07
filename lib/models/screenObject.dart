
class ScreenObjectModel{

  String manHours0;
  String manHours1;
  String manHours2;
  String manHours3;
  String manHours4;
  String manHours5;
  String manHours6;

  String detail0;
  String detail1;
  String detail2;
  String detail3;
  String detail4;
  String detail5;
  String detail6;

  String activityid;
  String projectname;
  String activityname;
  String projectid;
  String subprojectid;
  String subprojectname;
  String enddate;
  String status;
  String statusdesc;
  String userid;

  ScreenObjectModel({
      this.detail0,
      this.detail1,
      this.detail2,
      this.detail3,
    this.userid,
      this.detail4,
      this.detail5,
      this.detail6,
      this.manHours0,
      this.manHours1,
      this.manHours2,
      this.manHours3,
      this.manHours4,
      this.manHours5,
      this.manHours6,
      this.activityid,
      this.projectname,
      this.activityname,
      this.projectid,
      this.subprojectid,
      this.subprojectname,
    this.status,
    this.statusdesc,
      this.enddate});


  factory ScreenObjectModel.fromJson(Map<String, dynamic> json) {
    return ScreenObjectModel(
      manHours0: (json["manHours0"]),
      manHours1: (json["manHours1"]),
      manHours2: (json["manHours2"]),
      manHours3: (json["manHours3"]),
      manHours4: (json["manHours4"]),
      manHours5: (json["manHours5"]),
      manHours6: (json["manHours6"]),
      userid: json["userid"],
      detail0: json["detail0"],
      detail1: json["detail1"],
      detail2: json["detail2"],
      detail3: json["detail3"],
      detail4: json["detail4"],
      detail5: json["detail5"],
      detail6: json["detail6"],
      status: json["status"],
      statusdesc: json["statusdesc"],
      activityid: json["activityid"],
      projectname: json["projectname"],
      activityname: json["activityname"],
      projectid: json["projectid"],
      subprojectid: json["subprojectid"],
      subprojectname: json["subprojectname"],
      enddate: json["enddate"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail0'] = this.detail0;
    data['manHours0'] = this.manHours0;
    data['manHours3'] = this.manHours3;
    data['manHours4'] = this.manHours4;
    data['manHours1'] = this.manHours1;
    data['manHours2'] = this.manHours2;
    data['activityid'] = this.activityid;
    data['manHours5'] = this.manHours5;
    data['status'] = this.status;
    data['userid'] = this.userid;
    data['statusdesc'] = this.statusdesc;
    data['manHours6'] = this.manHours6;
    data['detail1'] = this.detail1;
    data['detail2'] = this.detail2;
    data['detail3'] = this.detail3;
    data['detail4'] = this.detail4;
    data['detail5'] = this.detail5;
    data['detail6'] = this.detail6;
    data['projectname'] = this.projectname;
    data['activityname'] = this.activityname;
    data['projectid'] = this.projectid;
    data['subprojectid'] = this.subprojectid;
    data['subprojectname'] = this.subprojectname;
    data['enddate'] = this.enddate;
    return data;
  }

  @override
  String toString() {
    return 'ScreenObjectModel{manHours0: $manHours0, manHours1: $manHours1, manHours2: $manHours2, manHours3: $manHours3, manHours4: $manHours4, manHours5: $manHours5, manHours6: $manHours6, detail0: $detail0, detail1: $detail1, detail2: $detail2, detail3: $detail3, detail4: $detail4, detail5: $detail5, detail6: $detail6, activityid: $activityid, projectname: $projectname, activityname: $activityname, projectid: $projectid, subprojectid: $subprojectid, subprojectname: $subprojectname, enddate: $enddate, status: $status, statusdesc: $statusdesc}';
  }
}