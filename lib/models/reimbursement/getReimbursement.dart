import 'getReimbursementBody.dart';

class GetReimbursement {
  String status;
  ReimbBody body;

  GetReimbursement({this.status, this.body});
  GetReimbursement.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    body= json["body"] == null ? null : ReimbBody.fromJson(json["body"]);


  }

  Map<String,dynamic> toJson()=>
      {
        'status':status,
        'body': body == null ? null : body.toJson(),
        //'screenFieldAttr': screenFieldAttr == null ? null : screenFieldAttr.toJson(),

      };

  @override
  String toString() {
    return 'GetReimbursement{status: $status, body: $body}';
  }
}




