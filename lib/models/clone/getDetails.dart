import '../body,dart.dart';
import 'bodie.dart';


class CloneGetTimeSheet{
  String status;
  CloneBoody body;

  CloneGetTimeSheet({this.status, this.body});

  CloneGetTimeSheet.fromJson(Map<String,dynamic>json)
      :status=json['status'],
  body= json["body"] == null ? null : CloneBoody.fromJson(json["body"])  ;


  Map<String, dynamic> toJson() {
    return {
      "status": this.status,
      "body": this.body,
    };
  }

  @override
  String toString() {
    return 'CloneGetTimeSheet{status: $status, body: $body}';
  }

//

}