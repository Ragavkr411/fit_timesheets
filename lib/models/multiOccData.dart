import 'dart:convert';

import 'package:fit_timesheets/models/actions.dart';


class MultiOccData{
  String name;
  String activityid;
  String subprojectid;
  String  projectid;
  String activityname;
  String projectname;
  String  userid;
  String subprojectname;
  String enddate;
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
  String status;
  String approvedBy;
  String statusdesc;
  String statusDate;


  List<Actions> actions;

  MultiOccData(
      {this.activityid,
      this.subprojectid,
        this.name,
      this.projectid,
        this.approvedBy,
      this.activityname,
      this.projectname,
      this.userid,
      this.subprojectname,
        this.status,
        this.statusdesc,
      this.enddate,
      this.manHours0,
      this.manHours1,
      this.manHours2,
      this.manHours3,
      this.manHours4,
      this.manHours5,
      this.manHours6,
      this.detail0,
        this.statusDate,
      this.detail1,
      this.detail2,
      this.detail3,
      this.detail4,
      this.detail5,
      this.detail6,
      this.actions});

  MultiOccData.fromJson(Map<String, dynamic> json) {
    activityid= json["activityid"];
    approvedBy= json["approvedBy"];
    subprojectid= json["subprojectid"];
    projectid= json["projectid"];
    activityname= json["activityname"];
    projectname= json["projectname"];
    name= json["name"];
    userid= json["userid"];
    subprojectname= json["subprojectname"];
    enddate= json["enddate"];
    manHours0=json["manHours0"];
    manHours1=json["manHours1"];
    manHours2=json["manHours2"];
    manHours3=json["manHours3"];
    manHours4=json["manHours4"];
    manHours5=json["manHours5"];
    manHours6=json["manHours6"];
    status=json["status"];
    statusdesc=json["statusdesc"];

    detail0=json["detail0"];
    detail1=json["detail1"];
    detail2=json["detail2"];
    detail3=json["detail3"];
    detail4=json["detail4"];
    detail5=json["detail5"];
    statusDate=json["statusDate"];
    detail6=json["detail6"];

    if (json['actions'] != null) {
      actions = new List<Actions>();
      json['actions'].forEach((v) {
        actions.add(new Actions.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    return {
      "activityid": this.activityid,
      "subprojectid": this.subprojectid,
      "projectid": this.projectid,
      "activityname": this.activityname,
      "approvedBy": this.approvedBy,
      "projectname": this.projectname,
      "userid": this.userid,
      "subprojectname": this.subprojectname,
      "enddate": this.enddate,
      "manHours0": this.manHours0,
      "name": this.name,
      "manHours1": this.manHours1,
      "manHours2": this.manHours2,
      "manHours3": this.manHours3,
      "manHours4": this.manHours4,
      "manHours5": this.manHours5,
      "manHours6": this.manHours6,
      "status": this.status,
      "statusDate": this.statusDate,
      "statusdesc": this.statusdesc,
      "detail0": this.detail0,
      "detail1": this.detail1,
      "detail2": this.detail2,
      "detail3": this.detail3,
      "detail4": this.detail4,
      "detail5": this.detail5,
      "detail6": this.detail6,
      "actions": jsonEncode(this.actions),
    };
  }

  @override
  String toString() {
    return 'MultiOccData{activityid: $activityid, subprojectid: $subprojectid, projectid: $projectid, activityname: $activityname, projectname: $projectname, userid: $userid, subprojectname: $subprojectname, enddate: $enddate,approvedBy: $approvedBy,statusDate: $statusDate, name: $name, manHours0: $manHours0, manHours1: $manHours1, manHours2: $manHours2, manHours3: $manHours3, manHours4: $manHours4, manHours5: $manHours5, manHours6: $manHours6, detail0: $detail0, detail1: $detail1, detail2: $detail2, detail3: $detail3, detail4: $detail4, detail5: $detail5, detail6: $detail6, actions: $actions}';
  }

//

}