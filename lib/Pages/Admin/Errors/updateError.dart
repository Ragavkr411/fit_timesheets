import 'dart:async';
import 'dart:ui';
import 'package:fit_timesheets/models/admin/errors/deleteError.dart';
import 'package:fit_timesheets/models/admin/errors/getErrorList.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:toast/toast.dart';
import '../../footer.dart';
import 'errorList.dart';
const Color mainColor = Color(0xFF796A9D);

class UpdateError extends StatefulWidget {
  final ErrorMultiOccData update;

  const UpdateError({Key key, this.update}) : super(key: key);

  @override
  UpdateErrorState createState() => UpdateErrorState(update);
}

class UpdateErrorState extends State<UpdateError> {
  final ErrorMultiOccData update;
  final _screenshotController = ScreenshotController();
  bool screenshot=true;
  GlobalKey scr = GlobalKey();
  GlobalKey scr1 = GlobalKey();




  DeleteError addError =DeleteError();

  UpdateErrorState(this.update);

  @override
  Widget build(BuildContext context) {
    TextEditingController _code = TextEditingController(text: '${update.eroreror}');
    TextEditingController _desc = TextEditingController(text: '${update.erordesc}');

    print(update.erordesc);
    @override
    void initState() {
      super.initState();

    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Error ',
          style: TextStyle(
              fontFamily: "Lobster-Regular",
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[900],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: <Widget>[

              SizedBox(
                height: 10,
              ),
              Theme(
                child: TextField(
                  controller: _code,
                  enabled: false,
                  // keyboardType: TextInputType.number,
                  cursorColor: mainColor,
                  onChanged: (v) {


                  },
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.purple, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.purple, width: 1.5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: 'Error Code',
                    hintText: 'Enter Error Code',
                    prefixIcon: const Icon(
                      Icons.code,
                      color: Colors.black,
                    ),

                  ),


                ),
                data: Theme.of(context).copyWith(
                  primaryColor: Colors.redAccent,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Theme(
                child: TextField(
                  controller: _desc,
                  //keyboardType: TextInputType.number,
                  cursorColor: mainColor,
                  onChanged: (v) {


                  },
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.purple, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.purple, width: 1.5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: 'Error Description',
                    hintText: 'Enter Error Description',
                    prefixIcon: const Icon(
                      Icons.description_outlined,
                      color: Colors.black,
                    ),

                  ),


                ),
                data: Theme.of(context).copyWith(
                  primaryColor: Colors.redAccent,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Theme(
              //   child: TextField(
              //     onTap: (){
              //       setState(() {
              //         DatePicker.showDatePicker(context,
              //             showTitleActions: true,
              //             theme: DatePickerTheme(
              //                 headerColor: Colors.indigoAccent,
              //                 backgroundColor: Colors.purple[900],
              //                 itemStyle: TextStyle(
              //                     color: Colors.white,
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 25),
              //                 cancelStyle: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 20),
              //                 doneStyle: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 20)),
              //             minTime: DateTime(2018, 3, 5),
              //             maxTime: DateTime.now(),
              //             onChanged: (date) {
              //               print('change $date');
              //             }, onConfirm: (date) {
              //               setState(() {
              //                 print(date);
              //                 String formattedDate =
              //                 DateFormat('dd-MM-yyyy').format(date);
              //                 _dateCtl.text=formattedDate;
              //                 date2 = date;
              //
              //
              //               });
              //
              //
              //             },
              //             currentTime: DateTime.now(),
              //             locale: LocaleType.en);
              //       });
              //     },
              //     controller: _dateCtl,
              //     cursorColor: mainColor,
              //     onChanged: (v) {
              //     },
              //     decoration: InputDecoration(
              //       disabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(25.0),
              //         borderSide: BorderSide(color: Colors.purple, width: 1.5),
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(25.0),
              //         borderSide: BorderSide(color: Colors.purple, width: 1.5),
              //       ),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(25.0),
              //       ),
              //       labelText: 'Date',
              //       hintText: 'Enter Date',
              //       prefixIcon: IconButton(
              //         icon: const Icon(Icons.calendar_today_outlined),
              //         color: Colors.black,
              //         onPressed: () {
              //
              //         },
              //       ),
              //
              //     ),
              //
              //
              //   ),
              //   data: Theme.of(context).copyWith(
              //     primaryColor: Colors.redAccent,
              //   ),
              // ),
              //  TextButton(
              //         onPressed: () {
              //
              //
              //         },
              //         child: Text(
              //            '${_dateCtl.text}',
              //
              //           //initialValue: _dateCtl.text,
              //           style: TextStyle(color: Colors.blue),
              //
              //         )),
              // SizedBox(
              //   height: 10,
              // ),
              // Theme(
              //   child: DateTimePickerFormField(
              //     controller: _dateCtl,
              //     inputType: InputType.date,
              //     format: DateFormat("dd-MM-yyyy"),
              //     editable: false,
              //     decoration: InputDecoration(
              //       disabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(25.0),
              //         borderSide: BorderSide(color: Colors.purple, width: 1.5),
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(25.0),
              //         borderSide: BorderSide(color: Colors.purple, width: 1.5),
              //       ),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(25.0),
              //         borderSide: BorderSide(color: Colors.purple, width: 2.0),
              //       ),
              //       labelText: 'Reimbursement Date',
              //       prefixIcon: const Icon(
              //         Icons.calendar_today,
              //         color: Colors.black,
              //       ),
              //     ),
              //     onChanged: (v) {
              //       setState(() {
              //         date2 = v;
              //         models.date = _dateCtl.text;
              //       });
              //     },
              //   ),
              //   data: Theme.of(context).copyWith(
              //     primaryColor: Colors.redAccent,
              //   ),
              // ),

              SizedBox(
                height: 10,
              ),


              SizedBox(
                height: 20,
              ),

              ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonMinWidth: 80,
                children: <Widget>[
                  new SizedBox(
                      width: 120.0,
                      height: 50.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: Colors.purple,
                              style: BorderStyle.solid,
                              width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: FlatButton(
                            color: Colors.grey[350],
                            onPressed: () {



                              setState(() {


                               // _code.text = '';

                                _desc.text = '';

                              });
                            },
                            child: Text(
                              'Undo',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      )),
                  new SizedBox(
                      width: 120.0,
                      height: 50.0,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color: Colors.purple,
                                style: BorderStyle.solid,
                                width: 2),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child:  ProgressButton(


                              // color: Colors.purple[900],
                              defaultWidget:
                              const Text('Submit', style: TextStyle(color: Colors.black)),
                              progressWidget: const CircularProgressIndicator(
                                  backgroundColor: Colors.red,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple)),
                              width: 114,



                              onPressed: () async {
                                addError.screenObject.eroreror=_code.text;
                                addError.screenObject.erordesc=_desc.text;
                                addError.screenName='S0052';
                                addError.mode='modify';
                                addError.language='E';

                                await Future.delayed(
                                    const Duration(milliseconds: 4000), () {
                                  return showDialog<void>(

                                    context: context,
                                    barrierDismissible: false,
                                    // user must tap button!
                                    builder: (BuildContext context) {




                                      return Screenshot(
                                          controller:_screenshotController ,

                                          child: RepaintBoundary(
                                              key: scr1,
                                              child: AlertDialog(

                                                backgroundColor: Colors.grey[350],
                                                title: Text(
                                                    'Confirm Details'),
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: <Widget>[
                                                      Text('Error Code: ${_code.text}'),
                                                      Text('Error Description: ${_desc.text}'),



                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  // if(screenshot=true)
                                                  // IconButton(
                                                  //   icon: const  Image(image: AssetImage('assets/icons/ss.png'),width: 30,height: 30,),
                                                  //
                                                  //   color: Colors.green,
                                                  //   tooltip: 'Take Screenshot',
                                                  //   onPressed: () {
                                                  //     setState(() {
                                                  //
                                                  //
                                                  //     });
                                                  //   },
                                                  // ),

                                                  // IconButton(
                                                  //   icon: const  Image(image: AssetImage('assets/icons/share4.png'),width: 30,height: 30,),
                                                  //
                                                  //   color: Colors.green,
                                                  //   tooltip: 'Share Details',
                                                  //   onPressed: () {
                                                  //     setState(() {
                                                  //      // saveScreen1();
                                                  //          _takeScreenshot();
                                                  //     });
                                                  //   },
                                                  // ),
                                                  FlatButton(

                                                    child: Text('Cancel'),
                                                    onPressed: () {
                                                      Navigator.pop(context);

                                                    },
                                                  ),
                                                  FlatButton(
                                                    child: Text('Confirm'),
                                                    onPressed: ()  {
                                                      postHttp(
                                                          'timesheetapiuat/eror/updateScreen',
                                                          addError)
                                                          .then((value) {
                                                        print(value);
                                                        if(value['status']=='SUCCESS'){
                                                          return showDialog<void>(
                                                            context: context,
                                                            barrierDismissible: false,
                                                            // user must tap button!
                                                            builder: (
                                                                BuildContext context) {
                                                              return AlertDialog(
                                                                backgroundColor: Colors
                                                                    .grey[350],
                                                                title: Text(
                                                                    'Records have been successfully uploaded'),
                                                                content: SingleChildScrollView(
                                                                  child: ListBody(
                                                                    children: <
                                                                        Widget>[
                                                                      Text(
                                                                          'Thank you'),
                                                                    ],
                                                                  ),
                                                                ),
                                                                actions: <Widget>[
                                                                  FlatButton(
                                                                    child: Text(
                                                                        'Ok'),
                                                                    onPressed: () {
                                                                      Navigator
                                                                          .of(
                                                                          context)
                                                                          .push(
                                                                          new MaterialPageRoute(
                                                                              builder: (
                                                                                  BuildContext
                                                                                  context) =>
                                                                                  ErrorList())
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );}
                                                        else  if(value['status']!='SUCCESS'){
                                                          Toast.show("Something went wrong,please try again", context,
                                                              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

                                                        }
                                                      });
                                                    },
                                                  ),

                                                ],
                                              )) );
                                    },
                                  );

                                });
                              },
                            ),
                          ))),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),
    );
  }

// launchWhatsApp() async {
//   final link = WhatsAppUnilink(
//     phoneNumber: '+918825761193',
//     text: "Hi sir i have submitted my reimbursement for ${models.reimb.name} with the total ₹${_amount.text}.\n Thanks & Regards,\n ${user.username}",
//
//   );
//   await launch('$link');
}
