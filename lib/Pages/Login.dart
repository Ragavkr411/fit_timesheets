import 'package:animated_splash/animated_splash.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fit_timesheets/Pages/Admin/adminDashboard.dart';
import 'package:fit_timesheets/Pages/TimeSheet/TimeSheetList.dart';
import 'package:fit_timesheets/locale/app_localization.dart';
import 'package:fit_timesheets/models/User.dart';
import 'package:fit_timesheets/models/login.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import 'Background.dart';
import 'TimeSheet/timesheetMainPage.dart';

void main() {
  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };

   Map<int, Widget> op = {1: TimeSheetList()};
  // Map<int, Widget> op = {1: AdminDashBoard()};
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimatedSplash(
      imagePath: 'assets/images/fitlogo.jpg',
       home: AdminDashBoard(),
      // home: TimeSheetList(),
      customFunction: duringSplash,
      duration: 2500,
      type: AnimatedSplashType.BackgroundProcess,
      outputAndHome: op,
    ),
  ));
}

class LoginIn extends StatefulWidget {
  LoginIn({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginIn> {

  Widget _title() {
    return DefaultTextStyle(
      style: const TextStyle(
        fontFamily: "DancingScript-VariableFont_wght",
        fontSize: 20.0,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText('FuturaInsTech',
            textStyle: const TextStyle(
                fontFamily: "DancingScript-VariableFont_wght",
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.red
            ),),
          WavyAnimatedText('FuturaInsTech',
            textStyle: const TextStyle(
                fontFamily: "DancingScript-VariableFont_wght",
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.green
            ),),
          WavyAnimatedText('FuturaInsTech',
            textStyle: const TextStyle(
                fontFamily: "DancingScript-VariableFont_wght",
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.red
            ),),
        ],

        isRepeatingAnimation: true,
        onTap: () {
          print("Tap Event");
        },
      ),
    );
  }

  Login log = Login();
  bool enable = false;
  bool enabl;
  String lang;
  bool checked = true;

  _LoginPageState() {
    //log.imeinumber = "45872bfe-9f7f-4c8b-b38d-906bb85f6340";
    log.imeinumber = "dabea336-bcc6-4241-ab86-98134dbb2412";
    //log.otp = "123456";
  }

  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
            child: Builder(
                builder: (context) => Container(
                  height: height,
                  child: Stack(
                    children: <Widget>[
                      Background(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: height * .2),
                              _title(),
                              SizedBox(height: 50),
                              Image(
                                image:
                                AssetImage('assets/images/fitlogo.jpg'),
                                height: 200,
                                width: 300,
                              ),
                              SizedBox(
                                height: 20,
                              ),



                              Padding(
                                padding: EdgeInsets.only(
                                    top: 8, left: 16, right: 16, bottom: 8),
                                child: Theme(
                                  child: TextFormField(
                                    enabled: checked,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    //cursorColor: mainColor,
                                    onChanged: (v) {
                                      log.username = v;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Username',
                                      hintText: 'Enter UserName',
                                      labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght",)
                                    ),

                                    //controller: fieldText,
                                  ),
                                  data: Theme.of(context).copyWith(
                                    primaryColor: Colors.redAccent,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 8, left: 16, right: 16, bottom: 8),
                                child: Theme(
                                  child: TextField(
                                    //  cursorColor: mainColor,
                                    enabled: checked,
                                    onChanged: (v) {
                                      log.password = v;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                      hintText: 'Enter Password',
                                      labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght",),
                                      suffixIcon: GestureDetector(
                                        onLongPress: () {
                                          setState(() {
                                            _passwordVisible = false;
                                          });
                                        },
                                        onLongPressUp: () {
                                          setState(() {
                                            _passwordVisible = true;
                                          });
                                        },
                                        child: Icon(_passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                      ),
                                    ),
                                    autofocus: false,
                                    obscureText: _passwordVisible,
                                    //controller: fieldText,
                                  ),
                                  data: Theme.of(context).copyWith(
                                    primaryColor: Colors.redAccent,
                                  ),
                                ),
                              ),
                              if (enable == false)
                                ProgressButton(
                                  // color: Colors.purple[900],
                                  defaultWidget: const Text('SendOtp',
                                      style:
                                      TextStyle(fontFamily: "DancingScript-VariableFont_wght",color: Colors.black)),
                                  progressWidget:
                                  const CircularProgressIndicator(
                                      backgroundColor: Colors.red,
                                      valueColor:
                                      AlwaysStoppedAnimation<Color>(
                                          Colors.purple)),
                                  width: 114,

                                  onPressed: () async {
                                    await Future.delayed(
                                        const Duration(milliseconds: 200),
                                            () {


                                          getHttp2(
                                              'timesheetapiuat/auth/generateOTP?username=${log.username}&imeinumber=${log.imeinumber}&password=${log.password}')
                                              .then((otp) {
                                            print(otp);
                                            if (otp['status'] == 'SUCCESS') {
                                              setState(() {
                                                enable = true;
                                                checked = false;
                                              });
                                            } else if (otp['status'] ==
                                                'ERROR') {
                                              Scaffold.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                  "Invalid Credentials",
                                                  style: TextStyle(
                                                      fontFamily: "DancingScript-VariableFont_wght",
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.redAccent),
                                                ),
                                              ));
                                            }
                                          });
                                        });
                                  },
                                ),
                              if (enable == true)
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 8,
                                      left: 16,
                                      right: 16,
                                      bottom: 8),
                                  child: Theme(
                                    child: TextFormField(
                                      //cursorColor: mainColor,
                                      onChanged: (v) {
                                        log.otp = v;
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Otp',
                                        hintText: 'Enter Otp',
                                         labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght",fontSize: 12)
                                      ),

                                      //controller: fieldText,
                                    ),
                                    data: Theme.of(context).copyWith(
                                      primaryColor: Colors.redAccent,
                                    ),
                                  ),
                                ),


                              if (enable == true)
                                ProgressButton(
                                  color: Colors.purple[900],
                                  defaultWidget: const Text('SignIn',
                                      style:
                                      TextStyle(fontFamily: "DancingScript-VariableFont_wght",color: Colors.black)),
                                  progressWidget:
                                  const CircularProgressIndicator(
                                      valueColor:
                                      AlwaysStoppedAnimation<Color>(
                                          Colors.purple)),
                                  width: 114,
                                  type: ProgressButtonType.Outline,
                                  onPressed: () async {
                                    await Future.delayed(
                                        const Duration(milliseconds: 1),
                                            () {
                                          http://103.14.123.116:8080/timesheetapiuat/auth/signin
                                          postHttp('timesheetapiuat/auth/signin', log)
                                              .then((signinvalue) {
                                            if (signinvalue['status'] !=
                                                'ERROR') {
                                              print('dai$signinvalue');

                                              Map results = signinvalue;

                                              user = User.fromJson(results);

                                              setUser(user);
                                              main();
                                            }
                                            else if(signinvalue['status'] ==
                                                'ERROR'){

                                              print('dai$signinvalue');
                                              Scaffold.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                  "Invalid OTP",
                                                  style: TextStyle(fontFamily: "DancingScript-VariableFont_wght",
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.redAccent),
                                                ),
                                              ));
                                            }
                                          });
                                        });
                                  },
                                ),
                              Text(
                                '\n© FuturaInsTech',
                                style: TextStyle(
                                    fontFamily: "DancingScript-VariableFont_wght",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                '2.0',
                                style: TextStyle(
                                    fontFamily: "DancingScript-VariableFont_wght",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }

}

class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height - 60);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
