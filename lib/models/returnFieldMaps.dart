class ReturnFieldMaps{
 String activityid;
 String projectname;
 String activityname;
 String projectid;
 String subprojectid;
 String subprojectname;

 ReturnFieldMaps(this.activityid, this.projectname, this.activityname,
      this.projectid, this.subprojectid, this.subprojectname);

 ReturnFieldMaps.fromJson(Map<String,dynamic>json)
     :activityid=json['activityid'],

       projectname=json['projectname'],
       activityname=json['activityname'],
       projectid=json['projectid'],
       subprojectid=json['subprojectid'],
       subprojectname=json['subprojectname'];


 Map<String, dynamic> toJson() {
    return {
      "activityid": this.activityid,
      "projectname": this.projectname,
      "activityname": this.activityname,
      "projectid": this.projectid,
      "subprojectid": this.subprojectid,
      "subprojectname": this.subprojectname,
    };

  }

 @override
  String toString() {
    return 'ReturnFieldMaps{activityid: $activityid, projectname: $projectname, activityname: $activityname, projectid: $projectid, subprojectid: $subprojectid, subprojectname: $subprojectname}';
  }
}