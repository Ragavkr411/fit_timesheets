class ReturnFieldMap {
  String activityid;
  String projectname;
  String activityname;
  String projectid;
  String subprojectid;
  String subprojectname;

  ReturnFieldMap(
      {this.activityid,
        this.projectname,
        this.activityname,
        this.projectid,
        this.subprojectid,
        this.subprojectname});

  ReturnFieldMap.fromJson(Map<String, dynamic> json) {
    activityid = json['activityid'];
    projectname = json['projectname'];
    activityname = json['activityname'];
    projectid = json['projectid'];
    subprojectid = json['subprojectid'];
    subprojectname = json['subprojectname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityid'] = this.activityid;
    data['projectname'] = this.projectname;
    data['activityname'] = this.activityname;
    data['projectid'] = this.projectid;
    data['subprojectid'] = this.subprojectid;
    data['subprojectname'] = this.subprojectname;
    return data;
  }

  @override
  String toString() {
    return 'ReturnFieldMap{activityid: $activityid, projectname: $projectname, activityname: $activityname, projectid: $projectid, subprojectid: $subprojectid, subprojectname: $subprojectname}';
  }
}