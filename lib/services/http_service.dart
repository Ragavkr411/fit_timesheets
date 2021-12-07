import 'dart:convert';
import 'dart:io';
import 'package:fit_timesheets/models/User.dart';
import 'package:http/http.dart' as http;

String l='http://192.168.1.6:9191/';
String c='http://103.14.123.116:8080/timesheetapi/';
String uat='http://103.14.123.116:8080/';
String BACKEND_URL =uat;

User user=User();



void setUser(User arg){
  user = arg;
}

String token='Bearer';
Future<Map<String, dynamic>> image(String url, Object model,File file) async {
  final response = await http.post('${BACKEND_URL}$url', headers:  {
    "fit-screen":"ALL",
    "Content-Type": "application/json",
    "Authorization": "$token ${user.accessToken}",
  },      body:
    jsonEncode(model)
  );
  Map<String, dynamic> m = jsonDecode(response.body );


  return m;
}
Future<Map<String, dynamic>> putHttp(String url, Object model) async {
  final response = await http.post('${BACKEND_URL}$url', headers:  {
    "fit-screen":"ALL",
    "Content-Type": "application/json",
    "Authorization": "$token ${user.accessToken}",
  },
      body: jsonEncode(model)
  );
  Map<String, dynamic> m = jsonDecode(response.body );


  return m;
}

Future<Map<String, dynamic>> postHttp(String url, Object model) async {
  final response = await http.post('${BACKEND_URL}$url', headers:  {
    "fit-screen":"ALL",
    "Content-Type": "application/json",
    "Authorization": "$token ${user.accessToken}",
  },
      body: jsonEncode(model)
  );
  Map<String, dynamic> m = jsonDecode(response.body );


  return m;
}
Future<String> postHttpClearResponse(String url, Object model) async {
  final response = await http.post('${BACKEND_URL}$url', headers:  {
    "fit-screen":"ALL",
    "Content-Type": "application/json",
    "Authorization": "Bearer ${user.accessToken}",
  },      body: jsonEncode(model));
 return response.body;
}

Future<Map<String, dynamic>> postHttpClear(String url, Object model) async {
  final response = await http.post('${BACKEND_URL}$url', headers:  {
    "fit-screen":"ALL",
    "Content-Type": "application/json",
    "Authorization": "Bearer ${user.accessToken}",
  },      body: jsonEncode(model));


}

Future<dynamic> getHttp(String url) async {
  final response = await http.get('${BACKEND_URL}$url', headers: {
    "fit-screen":"ALL",
    "Content-Type": "application/json",
    "Authorization": 'Bearer ${user.accessToken}'
  }
  );
  return (response.body );

}

Future<dynamic> getHttp2(String url) async {
  final response = await http.get('${BACKEND_URL}$url', headers: {
    "fit-screen":"ALL",
    "Content-Type": "application/json",
    "Authorization":  'Bearer ${user.accessToken}'
  }
  );

  return jsonDecode(response.body );

}