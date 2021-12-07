

import 'body,dart.dart';

class getTimeSheet {
  String status;
  Bodie body;

  getTimeSheet({this.status, this.body});

  getTimeSheet.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    body = json['body'] != null ? new Bodie.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    return data;
  }
}