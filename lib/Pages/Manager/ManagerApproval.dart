import 'package:fit_timesheets/Pages/Manager/managerFirstPage.dart';
import 'package:fit_timesheets/models/create.dart';
import 'package:fit_timesheets/models/getTimeSheet/getDetails.dart';
import 'package:fit_timesheets/models/multiOccData.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

import '../footer.dart';

const Color mainColor = Color(0xFF796A9D);

class ManagerApproval extends StatefulWidget {
  final MultiOccData getTimeSheetModel;

  const ManagerApproval({Key key, this.getTimeSheetModel}) : super(key: key);

  @override
  _ManagerApprovalState createState() =>
      _ManagerApprovalState(getTimeSheetModel);
}

String formattedDate2;

class _ManagerApprovalState extends State<ManagerApproval> {
  final MultiOccData getTimeSheetModel;
  GetTimeSheet model = GetTimeSheet();

  _ManagerApprovalState(this.getTimeSheetModel);

  Create createModel = Create();
  TextEditingController _monday = TextEditingController();
  TextEditingController _tuesday = TextEditingController();
  TextEditingController _wednesday = TextEditingController();
  TextEditingController _thursday = TextEditingController();
  TextEditingController _friday = TextEditingController();
  TextEditingController _saturday = TextEditingController();
  TextEditingController _sunday = TextEditingController();
  TextEditingController _mondayComment = TextEditingController();
  TextEditingController _tuesdayComment = TextEditingController();
  TextEditingController _wednesdayComment = TextEditingController();
  TextEditingController _thursdayComment = TextEditingController();
  TextEditingController _fridayComment = TextEditingController();
  TextEditingController _saturdayComment = TextEditingController();
  TextEditingController _sundayComment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getHttp2(
            'timesheet/getScreen?screenName=S0003&language=E&enddate=${getTimeSheetModel.enddate}&userid=${getTimeSheetModel.userid}&mode=managerview&pageNum=0&pageSize=5&searchString=&searchCriteria=&firstTime=true')
        .then((apiValue) {
      setState(() {
        model = GetTimeSheet.fromJson(apiValue);

      });
    });

    // DateTime parseDate =
    // new DateFormat('dd-MM-yyyy').parse(getTimeSheetModel.enddate);
    //
    // String date = DateFormat("yyyy-MM-dd hh:mm:ss").format(parseDate);
    //

    String hello=getTimeSheetModel.enddate;

    String returnDate = hello.substring(6,8)+'-'+hello.substring(4,6)+'-'+hello.substring(0,4);

    DateTime parseDate =
     new DateFormat('dd-MM-yyyy').parse(returnDate);
    DateTime satDateTime = parseDate.subtract(const Duration(days: 1));
    DateTime friDateTime = parseDate.subtract(const Duration(days: 2));
    DateTime thursDateTime = parseDate.subtract(const Duration(days: 3));
    DateTime wedDateTime = parseDate.subtract(const Duration(days: 4));
    DateTime tuesDateTime = parseDate.subtract(const Duration(days: 5));
    DateTime monDateTime = parseDate.subtract(const Duration(days: 6));
    String monDate =
    DateFormat('dd-MM-yyyy').format(monDateTime);
    String tuesDate =
    DateFormat('dd-MM-yyyy').format(tuesDateTime);
    String wedDate =
    DateFormat('dd-MM-yyyy').format(wedDateTime);
    String thursDate =
    DateFormat('dd-MM-yyyy').format(thursDateTime);
    String friDate =
    DateFormat('dd-MM-yyyy').format(friDateTime);
    String satDate =
    DateFormat('dd-MM-yyyy').format(satDateTime);
    String sunDate =
    DateFormat('dd-MM-yyyy').format(parseDate);

    Widget returnListView() {
      return new Scrollbar(
          isAlwaysShown: true,
          //  controller: _scrollController,
          child: ListView.builder(
              itemCount: model.body.screenData.multiOccData.length,
              itemBuilder: (context, int position) {

                if (model.body.screenData.multiOccData[position].manHours0 ==
                    null) {
                  model.body.screenData.multiOccData[position].manHours0 = '0';
                } else if (model
                        .body.screenData.multiOccData[position].manHours0 !=
                    null) {
                  model.body.screenData.multiOccData[position].manHours0 =
                      model.body.screenData.multiOccData[position].manHours0;
                }

                if (model.body.screenData.multiOccData[position].manHours1 ==
                    null) {
                  model.body.screenData.multiOccData[position].manHours1 = '0';
                } else if (model
                        .body.screenData.multiOccData[position].manHours1 !=
                    null) {
                  model.body.screenData.multiOccData[position].manHours1 =
                      model.body.screenData.multiOccData[position].manHours1;
                }

                if (model.body.screenData.multiOccData[position].manHours2 ==
                    null) {
                  model.body.screenData.multiOccData[position].manHours2 = '0';
                } else if (model
                        .body.screenData.multiOccData[position].manHours2 !=
                    null) {
                  model.body.screenData.multiOccData[position].manHours2 =
                      model.body.screenData.multiOccData[position].manHours2;
                }

                if (model.body.screenData.multiOccData[position].manHours3 ==
                    null) {
                  model.body.screenData.multiOccData[position].manHours3 = '0';
                } else if (model
                        .body.screenData.multiOccData[position].manHours3 !=
                    null) {
                  model.body.screenData.multiOccData[position].manHours3 =
                      model.body.screenData.multiOccData[position].manHours3;
                }

                if (model.body.screenData.multiOccData[position].manHours4 ==
                    null) {
                  model.body.screenData.multiOccData[position].manHours4 = '0';
                } else if (model
                        .body.screenData.multiOccData[position].manHours4 !=
                    null) {
                  model.body.screenData.multiOccData[position].manHours4 =
                      model.body.screenData.multiOccData[position].manHours4;
                }

                if (model.body.screenData.multiOccData[position].manHours5 ==
                    null) {
                  model.body.screenData.multiOccData[position].manHours5 = '0';
                } else if (model
                        .body.screenData.multiOccData[position].manHours5 !=
                    null) {
                  model.body.screenData.multiOccData[position].manHours5 =
                      model.body.screenData.multiOccData[position].manHours5;
                }

                if (model.body.screenData.multiOccData[position].manHours6 ==
                    null) {
                  model.body.screenData.multiOccData[position].manHours6 = '0';
                } else if (model
                        .body.screenData.multiOccData[position].manHours6 !=
                    null) {
                  model.body.screenData.multiOccData[position].manHours6 =
                      model.body.screenData.multiOccData[position].manHours6;
                }

                return Column(
                  children: [

                    Container(
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         EditForm(
                            //             getTimeSheetModel: getTimeSheetModel.body.screenData.multiOccData[position]),
                            //   ),
                            // );
                          },
                          child: Card(
                            child: Container(
                                padding: EdgeInsets.all(12),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Card(
                                        elevation: 100,
                                        // shape: RoundedRectangleBorder(
                                        //   side: BorderSide(color: Colors.purple[900], width: 3),
                                        //   borderRadius: BorderRadius.circular(20),
                                        // ),
                                        color: Colors.white,
                                        child: Container(
                                          padding: EdgeInsets.all(12),
                                          child: Column(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 10,
                                              ),

                                              Theme(
                                                child: TextFormField(
                                                  enabled: false,
                                                  style: TextStyle(
                                                      fontFamily: "DancingScript-VariableFont_wght",
                                                      fontWeight: FontWeight.bold),
                                                  initialValue:
                                                  '${model.body.screenData.multiOccData[position].activityid}' +
                                                      '-${model.body.screenData.multiOccData[position].activityname}',
                                                  cursorColor: mainColor,
                                                  onChanged: (v) {
                                                    //   models.comment = _comment.text;
                                                  },
                                                  decoration: InputDecoration(
                                                    disabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                      borderSide: BorderSide(
                                                          color: Colors.purple,
                                                          width: 1.5),
                                                    ),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                      borderSide: BorderSide(
                                                          color: Colors.purple,
                                                          width: 1.5),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                    ),
                                                    labelText:
                                                    'Activity id and Name',
                                                    labelStyle: TextStyle(
                                                        fontFamily: "DancingScript-VariableFont_wght",
                                                        fontWeight:
                                                        FontWeight.bold),
                                                    hintText:
                                                    'Activity id and Name',
                                                    prefixIcon: const Icon(
                                                      Icons.local_activity,
                                                      color: Colors.green,
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
                                                child: TextFormField(
                                                  enabled: false,
                                                  style: TextStyle(
                                                      fontFamily: "DancingScript-VariableFont_wght",
                                                      fontWeight: FontWeight.bold),
                                                  initialValue:
                                                  '${model.body.screenData.multiOccData[position].subprojectid}' +
                                                      '-${model.body.screenData.multiOccData[position].subprojectname}',
                                                  cursorColor: mainColor,
                                                  onChanged: (v) {
                                                    //   models.comment = _comment.text;
                                                  },
                                                  decoration: InputDecoration(
                                                    disabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                      borderSide: BorderSide(
                                                          color: Colors.purple,
                                                          width: 1.5),
                                                    ),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                      borderSide: BorderSide(
                                                          color: Colors.purple,
                                                          width: 1.5),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                    ),
                                                    labelText:
                                                    'Sub-project id and Name',
                                                    labelStyle: TextStyle(
                                                        fontFamily: "DancingScript-VariableFont_wght",
                                                        fontWeight:
                                                        FontWeight.bold),
                                                    hintText:
                                                    'Sub-project id and Name',
                                                    prefixIcon: const Icon(
                                                      Icons.supervised_user_circle,
                                                      color: Colors.green,
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
                                                child: TextFormField(
                                                  enabled: false,
                                                  style: TextStyle(
                                                      fontFamily: "DancingScript-VariableFont_wght",
                                                      fontWeight: FontWeight.bold),
                                                  initialValue:
                                                  '${model.body.screenData.multiOccData[position].projectid}' +
                                                      '-${model.body.screenData.multiOccData[position].projectname}',
                                                  cursorColor: mainColor,
                                                  onChanged: (v) {
                                                    //   models.comment = _comment.text;
                                                  },
                                                  decoration: InputDecoration(
                                                    disabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                      borderSide: BorderSide(
                                                          color: Colors.purple,
                                                          width: 1.5),
                                                    ),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                      borderSide: BorderSide(
                                                          color: Colors.purple,
                                                          width: 1.5),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                    ),
                                                    labelText:
                                                    'Project id and Name',
                                                    labelStyle: TextStyle(
                                                        fontFamily: "DancingScript-VariableFont_wght",
                                                        fontWeight:
                                                        FontWeight.bold),
                                                    hintText: 'Project id and Name',
                                                    prefixIcon: const Icon(
                                                      Icons.layers,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ),
                                                data: Theme.of(context).copyWith(
                                                  primaryColor: Colors.redAccent,
                                                ),
                                              ),

                                              SizedBox(
                                                height: 20,
                                              ),

                                              SizedBox(
                                                height: 20,
                                              ),

                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: <Widget>[
                                                        Text(
                                                          '${monDate}\n      Mon',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 47,
                                                          // margin: const EdgeInsets.only(right: 100, left: 100),
                                                          width: 71,

                                                          child:
                                                          TextFormField(
                                                            enabled: false,
                                                            initialValue: "${ model.body.screenData.multiOccData[position].manHours0}",
                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            decoration:
                                                            InputDecoration(
                                                              contentPadding:
                                                              EdgeInsets.symmetric(
                                                                  vertical:
                                                                  10.0,
                                                                  horizontal:
                                                                  2),
                                                              border:
                                                              OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15.0),
                                                              ),
                                                            ),
                                                            // controller: _monday,
                                                            keyboardType:
                                                            TextInputType
                                                                .numberWithOptions(
                                                              decimal: false,
                                                              signed: true,
                                                            ),
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              WhitelistingTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                            onChanged: (v) {
                                                              setState(() {});
                                                            },
                                                          ),
                                                        ),
                                                      ]),
                                                  SizedBox(
                                                    width: 47,
                                                  ),
                                                  Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: <Widget>[
                                                        Text(
                                                          '${tuesDate}\n      Tue',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 45,
                                                          // margin: const EdgeInsets.only(right: 100, left: 100),
                                                          width: 71,

                                                          child:
                                                          TextFormField(
                                                            enabled: false,
                                                            initialValue: "${ model.body.screenData.multiOccData[position].manHours1}",


                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            decoration:
                                                            InputDecoration(
                                                              contentPadding:
                                                              EdgeInsets.symmetric(
                                                                  vertical:
                                                                  10.0,
                                                                  horizontal:
                                                                  2),
                                                              border:
                                                              OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15.0),
                                                              ),
                                                            ),

                                                            //    initialValue: '0',
                                                            keyboardType:
                                                            TextInputType
                                                                .numberWithOptions(
                                                              decimal: false,
                                                              signed: true,
                                                            ),
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              WhitelistingTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                            onChanged: (v) {
                                                              setState(() {});
                                                            },
                                                          ),
                                                        ),
                                                      ]),
                                                  SizedBox(
                                                    width: 35,
                                                  ),
                                                  Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: <Widget>[
                                                        Text(
                                                          '${wedDate}\n      Wed',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 45,
                                                          // margin: const EdgeInsets.only(right: 100, left: 100),
                                                          width: 71,

                                                          child:
                                                          TextFormField(
                                                            enabled: false,
                                                            initialValue: "${ model.body.screenData.multiOccData[position].manHours2}",

                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            decoration:
                                                            InputDecoration(
                                                              contentPadding:
                                                              EdgeInsets.symmetric(
                                                                  vertical:
                                                                  10.0,
                                                                  horizontal:
                                                                  2),
                                                              border:
                                                              OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15.0),
                                                              ),
                                                            ),
                                                            // controller: _wednesday,
                                                            onChanged: (v) {
                                                              setState(() {});
                                                            },
                                                            keyboardType:
                                                            TextInputType
                                                                .numberWithOptions(
                                                              decimal: false,
                                                              signed: true,
                                                            ),
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              WhitelistingTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                          ),
                                                        ),
                                                      ]),
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                ],
                                              ),

                                              // first three entry box



                                              SizedBox(
                                                height: 30,
                                              ),
                                              // next three entry box
                                              Row(
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: <Widget>[
                                                        Text(
                                                          '${thursDate}\n      Thurs',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 47,
                                                          // margin: const EdgeInsets.only(right: 100, left: 100),
                                                          width: 71,

                                                          child:
                                                          TextFormField(
                                                            enabled: false,
                                                            initialValue: "${ model.body.screenData.multiOccData[position].manHours3}",
                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            decoration:
                                                            InputDecoration(
                                                              contentPadding:
                                                              EdgeInsets.symmetric(
                                                                  vertical:
                                                                  10.0,
                                                                  horizontal:
                                                                  2),
                                                              border:
                                                              OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15.0),
                                                              ),
                                                            ),
                                                            // controller: _monday,
                                                            keyboardType:
                                                            TextInputType
                                                                .numberWithOptions(
                                                              decimal: false,
                                                              signed: true,
                                                            ),
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              WhitelistingTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                            onChanged: (v) {
                                                              setState(() {});
                                                            },
                                                          ),
                                                        ),
                                                      ]),
                                                  SizedBox(
                                                    width: 47,
                                                  ),
                                                  Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: <Widget>[
                                                        Text(
                                                          '${friDate}\n      Fri',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 45,
                                                          // margin: const EdgeInsets.only(right: 100, left: 100),
                                                          width: 71,

                                                          child:
                                                          TextFormField(
                                                            enabled: false,
                                                            initialValue: "${ model.body.screenData.multiOccData[position].manHours4}",

                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            decoration:
                                                            InputDecoration(
                                                              contentPadding:
                                                              EdgeInsets.symmetric(
                                                                  vertical:
                                                                  10.0,
                                                                  horizontal:
                                                                  2),
                                                              border:
                                                              OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15.0),
                                                              ),
                                                            ),

                                                            //    initialValue: '0',
                                                            keyboardType:
                                                            TextInputType
                                                                .numberWithOptions(
                                                              decimal: false,
                                                              signed: true,
                                                            ),
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              WhitelistingTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                            onChanged: (v) {
                                                              setState(() {});
                                                            },
                                                          ),
                                                        ),
                                                      ]),
                                                  SizedBox(
                                                    width: 35,
                                                  ),
                                                  Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: <Widget>[
                                                        Text(
                                                          '${satDate}\n      Sat',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 45,
                                                          // margin: const EdgeInsets.only(right: 100, left: 100),
                                                          width: 71,

                                                          child:
                                                          TextFormField(
                                                            enabled: false,
                                                            initialValue: "${ model.body.screenData.multiOccData[position].manHours5}",

                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            decoration:
                                                            InputDecoration(
                                                              contentPadding:
                                                              EdgeInsets.symmetric(
                                                                  vertical:
                                                                  10.0,
                                                                  horizontal:
                                                                  2),
                                                              border:
                                                              OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15.0),
                                                              ),
                                                            ),
                                                            // controller: _wednesday,
                                                            onChanged: (v) {
                                                              setState(() {});
                                                            },
                                                            keyboardType:
                                                            TextInputType
                                                                .numberWithOptions(
                                                              decimal: false,
                                                              signed: true,
                                                            ),
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              WhitelistingTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                          ),
                                                        ),
                                                      ]),
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                ],
                                              ),



                                              SizedBox(
                                                height: 30,
                                              ),
                                              // last entry box
                                              Row(
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 142,
                                                  ),
                                                  Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: <Widget>[
                                                        Text(
                                                          '${sunDate}\n      Sun',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 45,
                                                          // margin: const EdgeInsets.only(right: 100, left: 100),
                                                          width: 65,

                                                          child:
                                                          TextFormField(
                                                            enabled: false,
                                                            initialValue: "${ model.body.screenData.multiOccData[position].manHours6}",

                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            decoration:
                                                            InputDecoration(
                                                              contentPadding:
                                                              EdgeInsets.symmetric(
                                                                  vertical:
                                                                  10.0,
                                                                  horizontal:
                                                                  2),
                                                              border:
                                                              OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15.0),
                                                              ),
                                                            ),
                                                            //   controller: _sunday,
                                                            onChanged: (v) {
                                                              setState(() {});
                                                            },
                                                            keyboardType:
                                                            TextInputType
                                                                .numberWithOptions(
                                                              decimal: false,
                                                              signed: true,
                                                            ),
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              WhitelistingTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                          ),
                                                        ),
                                                      ]),
                                                  SizedBox(
                                                    width: 22,
                                                  ),
                                                ],
                                              ),


                                              SizedBox(
                                                height: 20,
                                              ),
                                              Center ( child: IconButton(
                                                icon: const Icon(
                                                  Icons.comment_outlined,
                                                  color: Colors.green,
                                                  size: 29,
                                                ),
                                                onPressed: () {
                                                  if (model.body.screenData.multiOccData[position].detail6 ==
                                                      null) {
                                                    _sundayComment.text = '';
                                                  } else if (model
                                                      .body.screenData.multiOccData[position].detail6 !=
                                                      null) {
                                                    _sundayComment.text =
                                                        model.body.screenData.multiOccData[position].detail6;
                                                  }

                                                  if (model.body.screenData.multiOccData[position].detail0 ==
                                                      null) {
                                                    _mondayComment.text = '';
                                                  } else if (model
                                                      .body.screenData.multiOccData[position].detail0 !=
                                                      null) {
                                                    _mondayComment.text =
                                                        model.body.screenData.multiOccData[position].detail0;
                                                  }

                                                  if (model.body.screenData.multiOccData[position].detail1 ==
                                                      null) {
                                                    _tuesdayComment.text = '';
                                                  } else if (model
                                                      .body.screenData.multiOccData[position].detail1 !=
                                                      null) {
                                                    _tuesdayComment.text =
                                                        model.body.screenData.multiOccData[position].detail1;
                                                  }

                                                  if (model.body.screenData.multiOccData[position].detail2 ==
                                                      null) {
                                                    _wednesdayComment.text = '';
                                                  } else if (model
                                                      .body.screenData.multiOccData[position].detail2 !=
                                                      null) {
                                                    _wednesdayComment.text =
                                                        model.body.screenData.multiOccData[position].detail2;
                                                  }

                                                  if (model.body.screenData.multiOccData[position].detail3 ==
                                                      null) {
                                                    _thursdayComment.text = '';
                                                  } else if (model
                                                      .body.screenData.multiOccData[position].detail3 !=
                                                      null) {
                                                    _thursdayComment.text =
                                                        model.body.screenData.multiOccData[position].detail3;
                                                  }

                                                  if (model.body.screenData.multiOccData[position].detail4 ==
                                                      null) {
                                                    _fridayComment.text = '';
                                                  } else if (model
                                                      .body.screenData.multiOccData[position].detail4 !=
                                                      null) {
                                                    _fridayComment.text =
                                                        model.body.screenData.multiOccData[position].detail4;
                                                  }

                                                  if (model.body.screenData.multiOccData[position].detail5 ==
                                                      null) {
                                                    _saturdayComment.text = '';
                                                  } else if (model
                                                      .body.screenData.multiOccData[position].detail5 !=
                                                      null) {
                                                    _saturdayComment.text =
                                                        model.body.screenData.multiOccData[position].detail5;
                                                  }


                                                  return showDialog<
                                                      void>(
                                                    context:
                                                    context,
                                                    barrierDismissible:
                                                    false,
// user must tap button!
                                                    builder:
                                                        (BuildContext
                                                    context) {
                                                      return AlertDialog(
                                                        backgroundColor:
                                                        Colors.grey[
                                                        350],
                                                        title: Text(
                                                            'Details'),
                                                        content:
                                                        SingleChildScrollView(
                                                          child:
                                                          ListBody(
                                                            children: <
                                                                Widget>[
                                                              Text(
                                                                  'Monday Comment: ${_mondayComment.text}\n'),
                                                              Text(
                                                                  'Tuesday Comment: ${_tuesdayComment.text}\n'),
                                                              Text(
                                                                  'Wednesday Comment: ${_wednesdayComment.text}\n'),
                                                              Text(
                                                                  'Thursday Comment: ${_thursdayComment.text}\n'),
                                                              Text(
                                                                  'Friday Comment: ${_fridayComment.text}\n'),
                                                              Text(
                                                                  'Saturday Comment: ${_saturdayComment.text}\n'),
                                                              Text(
                                                                  'Sunday Comment: ${_sundayComment.text}'),
                                                            ],
                                                          ),
                                                        ),
                                                        actions: <
                                                            Widget>[
                                                          FlatButton(
                                                            child: Text(
                                                                'OK'),
                                                            onPressed:
                                                                () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],

                                  ),
                                )),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    if (model.body.screenData.statusdesc == 'Submitted')
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
                                        return showDialog<void>(
                                          context: context,
                                          barrierDismissible: false,
                                          // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor: Colors.grey[350],
                                              title: Text('Delete'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Text(
                                                        'Do you want to reject this timesheet'),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: Text('No'),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                FlatButton(
                                                  child: Text('Yes'),
                                                  onPressed: () {
                                                    createModel.screenName =
                                                    'S0003';
                                                    createModel.language = "E";
                                                    createModel.mode = "reject";
                                                    createModel.screenObject
                                                        .enddate =
                                                    '${getTimeSheetModel.enddate}';
                                                    createModel
                                                        .respondWithSummary =
                                                    false;
                                                    createModel.screenObject
                                                        .userid =
                                                    '${getTimeSheetModel.userid}';

                                                    postHttp(
                                                        'timesheet/updateScreen',
                                                        createModel)
                                                        .then((value) {
                                                      return showDialog<void>(
                                                        context: context,
                                                        barrierDismissible:
                                                        false,
                                                        // user must tap button!
                                                        builder: (BuildContext
                                                        context) {
                                                          return AlertDialog(
                                                            backgroundColor:
                                                            Colors
                                                                .grey[350],
                                                            title: Text(
                                                                'Records have been successfully rejected'),
                                                            content:
                                                            SingleChildScrollView(
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
                                                                child:
                                                                Text('Ok'),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                      context)
                                                                      .push(new MaterialPageRoute(
                                                                      builder: (BuildContext context) =>
                                                                          ManagerFirstPage()));
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    });
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      });
                                    },
                                    child: Text(
                                      'Reject',
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
                                    child: FlatButton(
                                      color: Colors.grey[350],
                                      onPressed: () {
                                        setState(() {
                                          createModel.screenName = 'S0003';
                                          createModel.language = "E";
                                          createModel.mode = "approve";
                                          createModel.screenObject.enddate =
                                          '${getTimeSheetModel.enddate}';
                                          createModel.respondWithSummary =
                                          false;
                                          createModel.screenObject.userid =
                                          '${getTimeSheetModel.userid}';

                                          postHttp('timesheet/updateScreen',
                                              createModel)
                                              .then((value) {
                                            if(value['status']=='SUCCESS'){
                                            FlutterRingtonePlayer.playNotification();
                                            return showDialog<void>(
                                              context: context,
                                              barrierDismissible: false,
                                              // user must tap button!
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor:
                                                  Colors.grey[350],
                                                  title: Text(
                                                      'Records have been successfully approved'),
                                                  content:
                                                  SingleChildScrollView(
                                                    child: ListBody(
                                                      children: <Widget>[
                                                        Text('Thank you'),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      child: Text('Ok'),
                                                      onPressed: () {
                                                        Navigator.of(context).push(
                                                            new MaterialPageRoute(
                                                                builder: (BuildContext
                                                                context) =>
                                                                    ManagerFirstPage()));
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );}
                else if(value['status']!='SUCCESS'){
                                            Toast.show("Please check the entered fields or the activity entry already exists", context,
                                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                                            }
                                          });
                                        });
                                      },
                                      child: Text(
                                        'Approve',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ))),
                        ],
                      ),
                  ],
                );
              }));
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        title: Text(
          'Timesheet Detail',
          style: TextStyle(
              fontFamily: "Lobster-Regular",
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Text(
            '\nStatus: ${model.body.screenData.statusdesc}',
            style:
            TextStyle(fontFamily: "DancingScript-VariableFont_wght",fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Flexible(child: returnListView())
          ,
        ],
      ),



      // floatingActionButton: buildSpeedDial(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add your onPressed code here!
      //   },
      //   child: const Icon(Icons.picture_as_pdf_outlined),
      //   backgroundColor: Colors.purple[900],
      // ),

      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),
    );
  }
}
