

import 'package:fit_timesheets/models/activity.dart';

class Activities{
  String status;
  Body body;


  Activities({this.status, this.body});

  Activities.fromJson(Map<String,dynamic>json)
      :status=json['status'],
        body= json["body"] == null ? null : Body.fromJson(json["body"]);

  Map<String,dynamic> toJson()=>
      {
        'status':status,
        'body': body == null ? null : body.toJson(),
        //'screenFieldAttr': screenFieldAttr == null ? null : screenFieldAttr.toJson(),

      };

  @override
  String toString() {
    return 'Activities{status: $status, body: $body}';
  }
}