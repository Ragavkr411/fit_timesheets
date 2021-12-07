import 'package:fit_timesheets/Pages/TimeSheet/timesheetEntry.dart';
import 'package:fit_timesheets/Pages/TimeSheet/timesheetMainPage.dart';
import 'package:fit_timesheets/models/activitiesdropdown.dart';
import 'package:fit_timesheets/models/create.dart';
import 'package:fit_timesheets/models/getTimeSheet/getDetails.dart';
import 'package:fit_timesheets/models/multiOccData.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../footer.dart';

const Color mainColor = Color(0xFF796A9D);

class PreviousWeek extends StatefulWidget {
  final DateTime currentDate;

  const PreviousWeek({Key key, this.currentDate}) : super(key: key);

  @override
  _PreviousWeekState createState() => _PreviousWeekState(currentDate);
}

String formattedDate2;

class _PreviousWeekState extends State<PreviousWeek> {
  DateTime currentDate;

  _PreviousWeekState(this.currentDate);

  bool monCheck = true;

  bool dropChecked = true;
  bool editButton = true;
  bool tuesCheck = true;
  bool wedCheck = true;
  bool thursCheck = true;
  bool friCheck = true;
  bool satCheck = true;
  bool sunCheck = true;

  Create createModel = Create();
  bool monCheckComment = true;

  bool tuesCheckComment = true;
  bool wedCheckComment = true;
  bool thursCheckComment = true;
  bool friCheckComment = true;
  bool satCheckComment = true;
  bool sunCheckComment = true;

  GetTimeSheet getTimeSheetModel = GetTimeSheet();
  Activities activityObject = Activities();
  Activities activityModel = Activities();
  bool enabled = false;
  String projectName;
  List<MultiOccData> muliOccDataList = [];
  List<TimesheetCard> timeSheetCard = [];
  String dropdown;

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
  void initState() {
    super.initState();

    _monday.text = "0";
    _tuesday.text = "0";
    _wednesday.text = "0";
    _thursday.text = "0";
    _friday.text = "0";
    _saturday.text = "0";
    _sunday.text = "0"; // Setting the initial value for the field.
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime yesterday =
        findFirstDateOfTheWeek(today).subtract(Duration(days: 1));

    String previousWeek = DateFormat('yyyyMMdd').format(currentDate);

    String monDate = DateFormat('dd-MM-yyyy')
        .format(currentDate.subtract(Duration(days: 6)));

    String sunDate = DateFormat('dd-MM-yyyy').format(currentDate);

    List<DateTime> getDaysInBeteween(DateTime startDate, DateTime endDate) {
      List<DateTime> days = [];
      for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
        days.add(DateTime(
            startDate.year,
            startDate.month,
            // In Dart you can set more than. 30 days, DateTime will do the trick
            startDate.day + i));
      }
      return days;
    }


    String tuesDate = DateFormat('dd-MM-yyyy')
        .format(currentDate.subtract(Duration(days: 5)));

    String wedDate = DateFormat('dd-MM-yyyy')
        .format(currentDate.subtract(Duration(days: 4)));
    String thursDate = DateFormat('dd-MM-yyyy')
        .format(currentDate.subtract(Duration(days: 3)));
    String friDate = DateFormat('dd-MM-yyyy')
        .format(currentDate.subtract(Duration(days: 2)));
    String satDate = DateFormat('dd-MM-yyyy')
        .format(currentDate.subtract(Duration(days: 1)));

    getHttp2(
            'timesheet/getScreen?screenName=S0004&language =E&firstTime=true&pageNum=0&pageSize=20&enddate=20210530&searchCriteria=projectname')
        .then((apiValue) {

      setState(() {activityObject = Activities.fromJson(apiValue);});
    });

    getHttp2(
            'timesheet/getScreen?screenName=S0003&language =E&mode=display&enddate=${previousWeek}')
        .then((apiValue) {

      setState(() { getTimeSheetModel = GetTimeSheet.fromJson(apiValue);});
    });
    int itemCount = getTimeSheetModel.body.screenData.multiOccData.length;
    int hello = 7;
    DateTime yesterdays =
        findFirstDateOfTheWeek(today).subtract(Duration(days: hello));
    print('heeloooooo$yesterdays');

//print('Yest$yesterdays');

    Widget returnListView() {
      return new Scrollbar(
          isAlwaysShown: true,
          //  controller: _scrollController,
          child: ListView.builder(
              itemCount: itemCount,
              itemBuilder: (context, int position) {
                if (getTimeSheetModel
                        .body.screenData.multiOccData[position].manHours0 ==
                    null) {
                  getTimeSheetModel
                      .body.screenData.multiOccData[position].manHours0 = '0';
                } else {
                  getTimeSheetModel
                          .body.screenData.multiOccData[position].manHours0 =
                      "${getTimeSheetModel.body.screenData.multiOccData[position].manHours0}";
                }
                if (getTimeSheetModel
                        .body.screenData.multiOccData[position].manHours1 ==
                    null) {
                  getTimeSheetModel
                      .body.screenData.multiOccData[position].manHours1 = '0';
                } else {
                  getTimeSheetModel
                          .body.screenData.multiOccData[position].manHours1 =
                      "${getTimeSheetModel.body.screenData.multiOccData[position].manHours1}";
                }
                if (getTimeSheetModel
                        .body.screenData.multiOccData[position].manHours2 ==
                    null) {
                  getTimeSheetModel
                      .body.screenData.multiOccData[position].manHours2 = '0';
                } else {
                  getTimeSheetModel
                          .body.screenData.multiOccData[position].manHours2 =
                      "${getTimeSheetModel.body.screenData.multiOccData[position].manHours2}";
                }
                if (getTimeSheetModel
                        .body.screenData.multiOccData[position].manHours3 ==
                    null) {
                  getTimeSheetModel
                      .body.screenData.multiOccData[position].manHours3 = '0';
                } else {
                  getTimeSheetModel
                          .body.screenData.multiOccData[position].manHours3 =
                      "${getTimeSheetModel.body.screenData.multiOccData[position].manHours3}";
                }
                if (getTimeSheetModel
                        .body.screenData.multiOccData[position].manHours4 ==
                    null) {
                  getTimeSheetModel
                      .body.screenData.multiOccData[position].manHours4 = '0';
                } else {
                  getTimeSheetModel
                          .body.screenData.multiOccData[position].manHours4 =
                      "${getTimeSheetModel.body.screenData.multiOccData[position].manHours4}";
                }
                if (getTimeSheetModel
                        .body.screenData.multiOccData[position].manHours5 ==
                    null) {
                  getTimeSheetModel
                      .body.screenData.multiOccData[position].manHours5 = '0';
                } else {
                  getTimeSheetModel
                          .body.screenData.multiOccData[position].manHours5 =
                      "${getTimeSheetModel.body.screenData.multiOccData[position].manHours5}";
                }
                if (getTimeSheetModel
                        .body.screenData.multiOccData[position].manHours6 ==
                    null) {
                  getTimeSheetModel
                      .body.screenData.multiOccData[position].manHours6 = '0';
                } else {
                  getTimeSheetModel
                          .body.screenData.multiOccData[position].manHours6 =
                      "${getTimeSheetModel.body.screenData.multiOccData[position].manHours6}";
                } // Setting the

                if (getTimeSheetModel
                        .body.screenData.multiOccData[position].detail0 ==
                    null) {
                  getTimeSheetModel
                      .body.screenData.multiOccData[position].detail0 = ' ';
                } else {
                  getTimeSheetModel
                          .body.screenData.multiOccData[position].detail0 =
                      "${getTimeSheetModel.body.screenData.multiOccData[position].detail0}";
                }
                if (getTimeSheetModel
                        .body.screenData.multiOccData[position].detail1 ==
                    null) {
                  getTimeSheetModel
                      .body.screenData.multiOccData[position].detail1 = ' ';
                } else {
                  getTimeSheetModel
                          .body.screenData.multiOccData[position].detail1 =
                      "${getTimeSheetModel.body.screenData.multiOccData[position].detail1}";
                }
                if (getTimeSheetModel
                        .body.screenData.multiOccData[position].detail2 ==
                    null) {
                  getTimeSheetModel
                      .body.screenData.multiOccData[position].detail2 = ' ';
                } else {
                  getTimeSheetModel
                          .body.screenData.multiOccData[position].detail2 =
                      "${getTimeSheetModel.body.screenData.multiOccData[position].detail2}";
                }
                if (getTimeSheetModel
                        .body.screenData.multiOccData[position].detail3 ==
                    null) {
                  getTimeSheetModel
                      .body.screenData.multiOccData[position].detail3 = ' ';
                } else {
                  getTimeSheetModel
                          .body.screenData.multiOccData[position].detail3 =
                      "${getTimeSheetModel.body.screenData.multiOccData[position].detail3}";
                }
                if (getTimeSheetModel
                        .body.screenData.multiOccData[position].detail4 ==
                    null) {
                  getTimeSheetModel
                      .body.screenData.multiOccData[position].detail4 = ' ';
                } else {
                  getTimeSheetModel
                          .body.screenData.multiOccData[position].detail4 =
                      "${getTimeSheetModel.body.screenData.multiOccData[position].detail4}";
                }
                if (getTimeSheetModel
                        .body.screenData.multiOccData[position].detail5 ==
                    null) {
                  getTimeSheetModel
                      .body.screenData.multiOccData[position].detail5 = ' ';
                } else {
                  getTimeSheetModel
                          .body.screenData.multiOccData[position].detail5 =
                      "${getTimeSheetModel.body.screenData.multiOccData[position].detail5}";
                }
                if (getTimeSheetModel
                        .body.screenData.multiOccData[position].detail6 ==
                    null) {
                  getTimeSheetModel
                      .body.screenData.multiOccData[position].detail6 = ' ';
                } else {
                  getTimeSheetModel
                          .body.screenData.multiOccData[position].detail6 =
                      "${getTimeSheetModel.body.screenData.multiOccData[position].detail6}";
                }
                return Column(
                  children: [
                    Text(
                      '\nStatus: ${getTimeSheetModel.body.screenData.statusdesc}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
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
                                                  fontWeight: FontWeight.bold),
                                              initialValue:
                                                  '${getTimeSheetModel.body.screenData.multiOccData[position].activityid}' +
                                                      '-${getTimeSheetModel.body.screenData.multiOccData[position].activityname}',
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
                                                  fontWeight: FontWeight.bold),
                                              initialValue:
                                                  '${getTimeSheetModel.body.screenData.multiOccData[position].subprojectid}' +
                                                      '-${getTimeSheetModel.body.screenData.multiOccData[position].subprojectname}',
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
                                                  fontWeight: FontWeight.bold),
                                              initialValue:
                                                  '${getTimeSheetModel.body.screenData.multiOccData[position].projectid}' +
                                                      '-${getTimeSheetModel.body.screenData.multiOccData[position].projectname}',
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
                                          // first three entry box
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '${monDate}\n      Mon',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 47,
                                                      // margin: const EdgeInsets.only(right: 100, left: 100),
                                                      width: 71,

                                                      child: TextFormField(
                                                        enabled: false,
                                                        initialValue:
                                                            '${getTimeSheetModel.body.screenData.multiOccData[position].manHours0}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
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
                                                        keyboardType: TextInputType
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
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '${tuesDate}\n      Tue',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 45,
                                                      // margin: const EdgeInsets.only(right: 100, left: 100),
                                                      width: 71,

                                                      child: TextFormField(
                                                        enabled: false,
                                                        initialValue:
                                                            '${getTimeSheetModel.body.screenData.multiOccData[position].manHours1}',

                                                        textAlign:
                                                            TextAlign.center,
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
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
                                                        keyboardType: TextInputType
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
                                                          setState(() {
                                                            createModel
                                                                    .screenObject
                                                                    .manHours1 =
                                                                (_tuesday.text);
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ]),
                                              SizedBox(
                                                width: 35,
                                              ),
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '${wedDate}\n      Wed',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 45,
                                                      // margin: const EdgeInsets.only(right: 100, left: 100),
                                                      width: 71,

                                                      child: TextFormField(
                                                        enabled: false,
                                                        initialValue:
                                                            '${getTimeSheetModel.body.screenData.multiOccData[position].manHours2}',

                                                        textAlign:
                                                            TextAlign.center,
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
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
                                                          setState(() {
                                                            createModel
                                                                    .screenObject
                                                                    .manHours2 =
                                                                (_wednesday
                                                                    .text);
                                                          });
                                                        },
                                                        keyboardType: TextInputType
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
                                          // next three entry box
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '${thursDate}\n      Thurs',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 45,
                                                      // margin: const EdgeInsets.only(right: 100, left: 100),
                                                      width: 71,

                                                      child: TextFormField(
                                                        enabled: false,
                                                        initialValue:
                                                            '${getTimeSheetModel.body.screenData.multiOccData[position].manHours3}',

                                                        textAlign:
                                                            TextAlign.center,
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
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
                                                        //controller: _thursday,
                                                        onChanged: (v) {
                                                          setState(() {
                                                            createModel
                                                                    .screenObject
                                                                    .manHours3 =
                                                                (_thursday
                                                                    .text);
                                                          });
                                                        },
                                                        keyboardType: TextInputType
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
                                                width: 47,
                                              ),
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '${friDate}\n      Fri',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 45,
                                                      // margin: const EdgeInsets.only(right: 100, left: 100),
                                                      width: 71,

                                                      child: TextFormField(
                                                        enabled: false,
                                                        initialValue:
                                                            '${getTimeSheetModel.body.screenData.multiOccData[position].manHours4}',

                                                        textAlign:
                                                            TextAlign.center,
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
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
                                                        //  controller: _friday,
                                                        onChanged: (v) {
                                                          setState(() {
                                                            createModel
                                                                    .screenObject
                                                                    .manHours4 =
                                                                (_friday.text);
                                                          });
                                                        },
                                                        keyboardType: TextInputType
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
                                                width: 35,
                                              ),
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '${satDate}\n      Sat',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 45,
                                                      // margin: const EdgeInsets.only(right: 100, left: 100),
                                                      width: 71,

                                                      child: TextFormField(
                                                        enabled: false,
                                                        initialValue:
                                                            '${getTimeSheetModel.body.screenData.multiOccData[position].manHours5}',

                                                        textAlign:
                                                            TextAlign.center,
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
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
                                                        //  controller: _saturday,
                                                        onChanged: (v) {
                                                          setState(() {
                                                            createModel
                                                                    .screenObject
                                                                    .manHours5 =
                                                                (_saturday
                                                                    .text);
                                                          });
                                                        },
                                                        keyboardType: TextInputType
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
                                                width: 15,
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
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '${sunDate}\n      Sun',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 45,
                                                      // margin: const EdgeInsets.only(right: 100, left: 100),
                                                      width: 65,

                                                      child: TextFormField(
                                                        enabled: false,
                                                        initialValue:
                                                            '${getTimeSheetModel.body.screenData.multiOccData[position].manHours6}',

                                                        textAlign:
                                                            TextAlign.center,
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
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
                                                          setState(() {
                                                            createModel
                                                                    .screenObject
                                                                    .manHours6 =
                                                                (_sunday.text);
                                                          });
                                                        },
                                                        keyboardType: TextInputType
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

                                          Center(
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.comment_outlined,
                                                color: Colors.green,
                                                size: 29,
                                              ),
                                              onPressed: () {
                                                if (getTimeSheetModel
                                                    .body
                                                    .screenData
                                                    .multiOccData[
                                                position]
                                                    .detail0 ==
                                                    null) {
                                                  getTimeSheetModel
                                                      .body
                                                      .screenData
                                                      .multiOccData[
                                                  position]
                                                      .detail0 = ' ';
                                                } else {
                                                  getTimeSheetModel
                                                      .body
                                                      .screenData
                                                      .multiOccData[
                                                  position]
                                                      .detail0 =
                                                  "${getTimeSheetModel.body.screenData.multiOccData[position].detail0}";
                                                }
                                                if (getTimeSheetModel
                                                    .body
                                                    .screenData
                                                    .multiOccData[
                                                position]
                                                    .detail1 ==
                                                    null) {
                                                  getTimeSheetModel
                                                      .body
                                                      .screenData
                                                      .multiOccData[
                                                  position]
                                                      .detail1 = ' ';
                                                } else {
                                                  getTimeSheetModel
                                                      .body
                                                      .screenData
                                                      .multiOccData[
                                                  position]
                                                      .detail1 =
                                                  "${getTimeSheetModel.body.screenData.multiOccData[position].detail1}";
                                                }
                                                if (getTimeSheetModel
                                                    .body
                                                    .screenData
                                                    .multiOccData[
                                                position]
                                                    .detail2 ==
                                                    null) {
                                                  getTimeSheetModel
                                                      .body
                                                      .screenData
                                                      .multiOccData[
                                                  position]
                                                      .detail2 = ' ';
                                                } else {
                                                  getTimeSheetModel
                                                      .body
                                                      .screenData
                                                      .multiOccData[
                                                  position]
                                                      .detail2 =
                                                  "${getTimeSheetModel.body.screenData.multiOccData[position].detail2}";
                                                }
                                                if (getTimeSheetModel
                                                    .body
                                                    .screenData
                                                    .multiOccData[
                                                position]
                                                    .detail3 ==
                                                    null) {
                                                  getTimeSheetModel
                                                      .body
                                                      .screenData
                                                      .multiOccData[
                                                  position]
                                                      .detail3 = ' ';
                                                } else {
                                                  getTimeSheetModel
                                                      .body
                                                      .screenData
                                                      .multiOccData[
                                                  position]
                                                      .detail3 =
                                                  "${getTimeSheetModel.body.screenData.multiOccData[position].detail3}";
                                                }
                                                if (getTimeSheetModel
                                                    .body
                                                    .screenData
                                                    .multiOccData[
                                                position]
                                                    .detail4 ==
                                                    null) {
                                                  getTimeSheetModel
                                                      .body
                                                      .screenData
                                                      .multiOccData[
                                                  position]
                                                      .detail4 = ' ';
                                                } else {
                                                  getTimeSheetModel
                                                      .body
                                                      .screenData
                                                      .multiOccData[
                                                  position]
                                                      .detail4 =
                                                  "${getTimeSheetModel.body.screenData.multiOccData[position].detail4}";
                                                }
                                                if (getTimeSheetModel
                                                    .body
                                                    .screenData
                                                    .multiOccData[
                                                position]
                                                    .detail5 ==
                                                    null) {
                                                  getTimeSheetModel
                                                      .body
                                                      .screenData
                                                      .multiOccData[
                                                  position]
                                                      .detail5 = ' ';
                                                } else {
                                                  getTimeSheetModel
                                                      .body
                                                      .screenData
                                                      .multiOccData[
                                                  position]
                                                      .detail5 =
                                                  "${getTimeSheetModel.body.screenData.multiOccData[position].detail5}";
                                                }
                                                if (getTimeSheetModel
                                                    .body
                                                    .screenData
                                                    .multiOccData[
                                                position]
                                                    .detail6 ==
                                                    null) {
                                                  getTimeSheetModel
                                                      .body
                                                      .screenData
                                                      .multiOccData[
                                                  position]
                                                      .detail6 = ' ';
                                                } else {
                                                  getTimeSheetModel
                                                      .body
                                                      .screenData
                                                      .multiOccData[
                                                  position]
                                                      .detail6 =
                                                  "${getTimeSheetModel.body.screenData.multiOccData[position].detail6}";
                                                }
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
                                                      title:
                                                      Text('Details'),
                                                      content:
                                                      SingleChildScrollView(
                                                        child: ListBody(
                                                          children: <
                                                              Widget>[
                                                            Text(
                                                                'Monday Comment: ${getTimeSheetModel.body.screenData.multiOccData[position].detail0}'),
                                                            Text(
                                                                'Tuesday Comment: ${getTimeSheetModel.body.screenData.multiOccData[position].detail1}'),
                                                            Text(
                                                                'Wednesday Comment: ${getTimeSheetModel.body.screenData.multiOccData[position].detail2}'),
                                                            Text(
                                                                'Thursday Comment: ${getTimeSheetModel.body.screenData.multiOccData[position].detail3}'),
                                                            Text(
                                                                'Friday Comment: ${getTimeSheetModel.body.screenData.multiOccData[position].detail4}'),
                                                            Text(
                                                                'Saturday Comment: ${getTimeSheetModel.body.screenData.multiOccData[position].detail5}'),
                                                            Text(
                                                                'Sunday Comment: ${getTimeSheetModel.body.screenData.multiOccData[position].detail6}'),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          child:
                                                          Text('OK'),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ))
                  ],
                );
              }));
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        title: Text(
          'Previous Week Timesheet',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: returnListView(),

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
