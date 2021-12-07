import '../body,dart.dart';
import 'bodie.dart';


class GetTimeSheet{
  String status;
  Boody body;

  GetTimeSheet({this.status, this.body});

  GetTimeSheet.fromJson(Map<String,dynamic>json)
      :status=json['status'],
  body= json["body"] == null ? null : Boody.fromJson(json["body"])  ;


  Map<String, dynamic> toJson() {
    return {
      "status": this.status,
      "body": this.body,
    };
  }

  @override
  String toString() {
    return 'GetTimeSheet{status: $status, body: $body}';
  }

//

}