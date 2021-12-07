import 'dart:convert';

import 'package:fit_timesheets/Pages/TimeSheet/TimeSheetList.dart';
import 'package:fit_timesheets/Pages/TimeSheet/timesheetMainPage.dart';
import 'package:fit_timesheets/models/activitiesdropdown.dart';
import 'package:fit_timesheets/models/create.dart';
import 'package:fit_timesheets/models/multiOccData.dart';
import 'package:fit_timesheets/models/reimbursement/getReimbursement.dart';
import 'package:fit_timesheets/models/screenObject.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:toast/toast.dart';
import '../footer.dart';

DateTime findFirstDateOfTheWeek(DateTime dateTime) {
  return dateTime.subtract(Duration(days: dateTime.weekday - 1));
}

DateTime findLastDateOfTheWeek(DateTime dateTime) {
  return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
}


// // Find first date and last date of any provided date
// DateTime date = DateTime.parse('2020-11-24');
// print(findFirstDateOfTheWeek(date));
// print(findLastDateOfTheWeek(date));
DateTime today = DateTime.now();
String sunDate2 =
DateFormat('yyyyMMdd').format(findLastDateOfTheWeek(today));
const Color mainColor = Color(0xFF796A9D);

class TimeSheetForm extends StatefulWidget {
  @override
  TimeSheetFormState createState() => TimeSheetFormState();
}

class TimeSheetFormState extends State<TimeSheetForm> {
  bool checkedComment = true;

  bool monCheck = true;

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

  GetReimbursement reimbList=GetReimbursement();

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
  TextEditingController _projectName = TextEditingController();

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
    String monDate =
    DateFormat('dd-MM-yyyy').format(findFirstDateOfTheWeek(today));
    String sunDate =
    DateFormat('dd-MM-yyyy').format(findLastDateOfTheWeek(today));
    int currentValue = int.parse(_monday.text) +
        int.parse(_tuesday.text) +
        int.parse(_wednesday.text) +
        int.parse(_thursday.text) +
        int.parse(_friday.text) +
        int.parse(_saturday.text) +
        int.parse(_sunday.text);
    List<DateTime> getDaysInBeteween(DateTime startDate, DateTime endDate) {
      List<DateTime> days = [];
      for (int i = 0; i <= endDate
          .difference(startDate)
          .inDays; i++) {
        days.add(DateTime(
            startDate.year,
            startDate.month,
            // In Dart you can set more than. 30 days, DateTime will do the trick
            startDate.day + i));
      }
      return days;
    }

    List<DateTime> betweenDates = getDaysInBeteween(
        findFirstDateOfTheWeek(today), findLastDateOfTheWeek(today));

    String tuesDate = DateFormat('dd-MM-yyyy').format(betweenDates[1]);

    String wedDate = DateFormat('dd-MM-yyyy').format(betweenDates[2]);
    String thursDate = DateFormat('dd-MM-yyyy').format(betweenDates[3]);
    String friDate = DateFormat('dd-MM-yyyy').format(betweenDates[4]);
    String satDate = DateFormat('dd-MM-yyyy').format(betweenDates[5]);

    var totalHours = TextEditingController(text: "$currentValue");
    finalHours = TextEditingController(text: "$currentValue");
    getHttp2(
        'timesheet/getScreen?screenName=S0004&language =E&firstTime=true&pageNum=0&pageSize=100&enddate=20210530&searchCriteria=projectname')
        .then((apiValue) {

      setState(() {
        activityObject = Activities.fromJson(apiValue);});
    });



    print('hello ${reimbList.toString()}');
    int length = 0;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // automaticallyImplyLeading: false,
          title: Column(children: <Widget>[
            Text(
              'TimeSheet Entry',
              style: TextStyle(
                  fontFamily: "Lobster-Regular",
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${user.username}",
              style: TextStyle(
                  fontFamily: "Lobster-Regular",
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),

          ]),
          backgroundColor: Colors.purple[900],
          elevation: 0.0,
        ),
        body:
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
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
                                  // SearchableDropdown.single(
                                  //   // underline: Colors.pink,
                                  //   menuBackgroundColor: Colors.white60,
                                  //
                                  //   items: <String>[
                                  //     for (length = 0;
                                  //     length <
                                  //         activityObject
                                  //             .body
                                  //             .screenData
                                  //             .multiOccData
                                  //             .length -
                                  //             1;
                                  //     length++)
                                  //       activityObject
                                  //           .body
                                  //           .screenData
                                  //           .multiOccData[length]
                                  //           .activityid +'-'+  activityObject
                                  //           .body
                                  //           .screenData
                                  //           .multiOccData[length]
                                  //           .projectname +' '+ activityObject
                                  //           .body
                                  //           .screenData
                                  //           .multiOccData[length]
                                  //           .activityname
                                  //   ].map<DropdownMenuItem<String>>(
                                  //
                                  //           (String value) {
                                  //         return DropdownMenuItem<String>(
                                  //
                                  //           value: value,
                                  //           child: Text(
                                  //             value,
                                  //             style: TextStyle(
                                  //                 color: Colors.black,fontSize: 16),
                                  //           ),
                                  //         );
                                  //       }).toList(),
                                  //   value: dropdown,
                                  //   hint: "Select Project Type",style: TextStyle(color: Colors.black),
                                  //   searchHint: "Search Project",
                                  //   onChanged: (value) {
                                  //     setState(() {
                                  //       dropdown = value;
                                  //     });
                                  //   },
                                  //   iconEnabledColor: Colors.red,
                                  //   dialogBox: false,
                                  //   isExpanded: true,
                                  //   menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
                                  // ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Container(

                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          decoration: BoxDecoration(

                                            borderRadius: BorderRadius.circular(
                                                15.0),
                                            border: Border.all(
                                                color: Colors.purple,
                                                style: BorderStyle.solid,
                                                width: 1.5),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              SearchableDropdown.single(
                                                // underline: Colors.pink,
                                                menuBackgroundColor: Colors
                                                    .white60,
                                                iconDisabledColor: Colors.white,
                                                items: <String>[

                                                  for (length = 0;
                                                  length <=
                                                      activityObject
                                                          .body
                                                          .screenData
                                                          .multiOccData.length -
                                                          1;
                                                  length++)
                                                    activityObject
                                                        .body
                                                        .screenData
                                                        .multiOccData[length]
                                                        .activityid + '-' +
                                                        activityObject
                                                            .body
                                                            .screenData
                                                            .multiOccData[length]
                                                            .activityname +
                                                        '-' +
                                                        activityObject
                                                            .body
                                                            .screenData
                                                            .multiOccData[length]
                                                            .subprojectid +
                                                        '-' +
                                                        activityObject
                                                            .body
                                                            .screenData
                                                            .multiOccData[length]
                                                            .subprojectname +
                                                        '-' +
                                                        activityObject
                                                            .body
                                                            .screenData
                                                            .multiOccData[length]
                                                            .projectid + '-' +
                                                        activityObject
                                                            .body
                                                            .screenData
                                                            .multiOccData[length]
                                                            .projectname

                                                ].map<DropdownMenuItem<String>>(

                                                        (String value) {
                                                      return DropdownMenuItem<
                                                          String>(

                                                        value: value,
                                                        child: Text(
                                                          value,
                                                          style: TextStyle(fontFamily: "DancingScript-VariableFont_wght",

                                                              color: Colors
                                                                  .black,
                                                              fontSize: 16),
                                                        ),
                                                      );
                                                    }).toList(),
                                                value: dropdown,
                                                hint: "Select Project Type",
                                                style: TextStyle(
                                                    fontFamily: "DancingScript-VariableFont_wght",
                                                    color: Colors.black),
                                                searchHint: "Search Project",
                                                onChanged: (value) {
                                                  setState(() {
                                                    dropdown = value;
                                                    var arr = dropdown.split(
                                                        '-');
                                                    createModel.screenObject
                                                        .activityid = arr[0];
                                                    createModel.screenObject
                                                        .activityname = arr[1];
                                                    createModel.screenObject
                                                        .subprojectid = arr[2];
                                                    createModel.screenObject
                                                        .subprojectname =
                                                    arr[3];
                                                    createModel.screenObject
                                                        .projectid = arr[4];
                                                    createModel.screenObject
                                                        .projectname = arr[5];


                                                    createModel.screenObject
                                                        .enddate = sunDate2;
                                                  });
                                                },
                                                iconEnabledColor: Colors.red,
                                                dialogBox: false,
                                                isExpanded: true,
                                                menuConstraints: BoxConstraints
                                                    .tight(
                                                    Size.fromHeight(350)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),

                                  // Theme(
                                  //   child: TextFormField(
                                  //     // initialValue: _projectName,
                                  //     enabled: false,
                                  //     controller: _projectName,
                                  //     keyboardType: TextInputType.number,
                                  //     cursorColor: mainColor,
                                  //     onChanged: (v) {
                                  //       //  models.amount = double.parse(v);
                                  //       //  models.status="PENDING";
                                  //     },
                                  //     decoration: InputDecoration(
                                  //       disabledBorder: OutlineInputBorder(
                                  //         borderRadius: BorderRadius.circular(25.0),
                                  //         borderSide: BorderSide(
                                  //             color: Colors.purple, width: 1.5),
                                  //       ),
                                  //       enabledBorder: OutlineInputBorder(
                                  //         borderRadius: BorderRadius.circular(25.0),
                                  //         borderSide: BorderSide(
                                  //             color: Colors.purple, width: 1.5),
                                  //       ),
                                  //       border: OutlineInputBorder(
                                  //         borderRadius: BorderRadius.circular(25.0),
                                  //       ),
                                  //       labelText: 'Project/Sub-Project Name',
                                  //       hintText: 'Project/Sub-Project Name',
                                  //       prefixIcon: const Icon(
                                  //         Icons.assignment,
                                  //         color: Colors.black,
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   data: Theme.of(context).copyWith(
                                  //     primaryColor: Colors.redAccent,
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 20,
                                  // ), Theme(
                                  //   child: TextFormField(
                                  //     // initialValue: _projectName,
                                  //     enabled: false,
                                  //     controller: _projectName2,
                                  //     keyboardType: TextInputType.number,
                                  //     cursorColor: mainColor,
                                  //     onChanged: (v) {
                                  //       //  models.amount = double.parse(v);
                                  //       //  models.status="PENDING";
                                  //     },
                                  //     decoration: InputDecoration(
                                  //       disabledBorder: OutlineInputBorder(
                                  //         borderRadius: BorderRadius.circular(25.0),
                                  //         borderSide: BorderSide(
                                  //             color: Colors.purple, width: 1.5),
                                  //       ),
                                  //       enabledBorder: OutlineInputBorder(
                                  //         borderRadius: BorderRadius.circular(25.0),
                                  //         borderSide: BorderSide(
                                  //             color: Colors.purple, width: 1.5),
                                  //       ),
                                  //       border: OutlineInputBorder(
                                  //         borderRadius: BorderRadius.circular(25.0),
                                  //       ),
                                  //       labelText: 'Project/Sub-Project Name',
                                  //       hintText: 'Project/Sub-Project Name',
                                  //       prefixIcon: const Icon(
                                  //         Icons.assignment,
                                  //         color: Colors.black,
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   data: Theme.of(context).copyWith(
                                  //     primaryColor: Colors.redAccent,
                                  //   ),
                                  // ),
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
                                            if (monCheck == false)
                                              Text(
                                                '${monDate}\n      Mon',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                            SizedBox(
                                              height: 47,
                                              // margin: const EdgeInsets.only(right: 100, left: 100),
                                              width: 71,

                                              child: TextFormField(
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 2),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(15.0),
                                                  ),
                                                ),
                                                controller: _monday,
                                                keyboardType:
                                                TextInputType.numberWithOptions(
                                                  decimal: false,
                                                  signed: true,
                                                ),
                                                inputFormatters: <
                                                    TextInputFormatter>[
                                                  WhitelistingTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                onChanged: (v) {
                                                  setState((

                                                      ) {});
                                                },
                                              ),
                                            ),
                                          ]),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          if (monCheck == false)
                                            Text(
                                              ' ',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        width: 1.15,
                                                      ),
                                                    ),
                                                  ),
                                                  child: InkWell(
                                                    child: Icon(
                                                      Icons.arrow_drop_up,
                                                      size: 20.0,
                                                    ),
                                                    onTap: () {
                                                      int currentValue =
                                                      int.parse(_monday.text);
                                                      setState(() {
                                                        monCheck = false;
                                                        currentValue++;
                                                        _monday.text =
                                                            (currentValue)
                                                                .toString();
                                                        // incrementing value
                                                      });
                                                    },
                                                  ),
                                                ),
                                                InkWell(
                                                  child: Icon(
                                                    Icons.arrow_drop_down,
                                                    size: 20.0,
                                                  ),
                                                  onTap: () {
                                                    int currentValue =
                                                    int.parse(_monday.text);
                                                    setState(() {
                                                      monCheck = false;
                                                      currentValue--;
                                                      _monday.text =
                                                          (currentValue >
                                                              0
                                                              ? currentValue
                                                              : 0)
                                                              .toString(); // decrementing value
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            if (tuesCheck == false)
                                              Text(
                                                '${tuesDate}\n      Tue',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                            SizedBox(
                                              height: 45,
                                              // margin: const EdgeInsets.only(right: 100, left: 100),
                                              width: 71,

                                              child: TextFormField(
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 2),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(15.0),
                                                  ),
                                                ),
                                                controller: _tuesday,
                                                //    initialValue: '0',
                                                keyboardType:
                                                TextInputType.numberWithOptions(
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
                                                    createModel.screenObject
                                                        .manHours1 =
                                                    (_tuesday.text);
                                                  });
                                                },
                                              ),
                                            ),
                                          ]),
                                      Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            if (tuesCheck == false)
                                              Text(
                                                ' ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          width: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                    child: InkWell(
                                                      child: Icon(
                                                        Icons.arrow_drop_up,
                                                        size: 20.0,
                                                      ),
                                                      onTap: () {
                                                        int currentValue =
                                                        int.parse(
                                                            _tuesday.text);
                                                        setState(() {
                                                          tuesCheck = false;
                                                          currentValue++;
                                                          _tuesday.text =
                                                              (currentValue)
                                                                  .toString(); // incrementing value
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  InkWell(
                                                    child: Icon(
                                                      Icons.arrow_drop_down,
                                                      size: 20.0,
                                                    ),
                                                    onTap: () {
                                                      int currentValue =
                                                      int.parse(_tuesday.text);
                                                      setState(() {
                                                        tuesCheck = false;
                                                        currentValue--;
                                                        _tuesday
                                                            .text =
                                                            (currentValue >
                                                                0
                                                                ? currentValue
                                                                : 0)
                                                                .toString(); // decrementing value
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            if (wedCheck == false)
                                              Text(
                                                '${wedDate}\n      Wed',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                            SizedBox(
                                              height: 45,
                                              // margin: const EdgeInsets.only(right: 100, left: 100),
                                              width: 71,

                                              child: TextFormField(
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 2),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(15.0),
                                                  ),
                                                ),
                                                controller: _wednesday,
                                                onChanged: (v) {
                                                  setState(() {
                                                    createModel.screenObject
                                                        .manHours2 =
                                                    (_wednesday.text);
                                                  });
                                                },
                                                keyboardType:
                                                TextInputType.numberWithOptions(
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
                                      Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            if (wedCheck == false)
                                              Text(
                                                ' ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          width: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                    child: InkWell(
                                                      child: Icon(
                                                        Icons.arrow_drop_up,
                                                        size: 20.0,
                                                      ),
                                                      onTap: () {
                                                        int currentValue =
                                                        int.parse(
                                                            _wednesday.text);
                                                        setState(() {
                                                          wedCheck = false;
                                                          currentValue++;
                                                          _wednesday.text =
                                                              (currentValue)
                                                                  .toString(); // incrementing value
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  InkWell(
                                                    child: Icon(
                                                      Icons.arrow_drop_down,
                                                      size: 20.0,
                                                    ),
                                                    onTap: () {
                                                      int currentValue = int
                                                          .parse(
                                                          _wednesday.text);
                                                      setState(() {
                                                        wedCheck = false;
                                                        currentValue--;
                                                        _wednesday
                                                            .text =
                                                            (currentValue >
                                                                0
                                                                ? currentValue
                                                                : 0)
                                                                .toString(); // decrementing value
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                      SizedBox(
                                        width: 15,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 29,
                                      ),
                                      if (monCheckComment == true)
                                        new IconButton(
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              monCheckComment = false;
                                            });
                                            //_selectDate(context);
                                          },
                                        ),
                                      if (monCheckComment == false)
                                        new IconButton(
                                          icon: const Icon(
                                            Icons.minimize,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              monCheckComment = true;
                                            });
                                            //_selectDate(context);
                                          },
                                        ),
                                      SizedBox(
                                        width: 65,
                                      ),
                                      if (tuesCheckComment == true)
                                        new IconButton(
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              tuesCheckComment = false;
                                            });
                                            //_selectDate(context);
                                          },
                                        ),
                                      if (tuesCheckComment == false)
                                        new IconButton(
                                          icon: const Icon(
                                            Icons.minimize,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              tuesCheckComment = true;
                                            });
                                            //_selectDate(context);
                                          },
                                        ),
                                      SizedBox(
                                        width: 59,
                                      ),
                                      if (wedCheckComment == true)
                                        new IconButton(
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              wedCheckComment = false;
                                            });
                                            //_selectDate(context);
                                          },
                                        ),
                                      if (wedCheckComment == false)
                                        new IconButton(
                                          icon: const Icon(
                                            Icons.minimize,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              wedCheckComment = true;
                                            });
                                            //_selectDate(context);
                                          },
                                        ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                  new Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      if (monCheckComment == false)
                                        new Flexible(
                                          child: new Theme(
                                            child: TextFormField(
                                              cursorColor: Colors.purple,
                                              //controller: _wednesdayComment,
                                              controller: _mondayComment,
                                              decoration: InputDecoration(
                                                  focusColor: Colors
                                                      .purple[900],
                                                  fillColor: Colors.purple,
                                                  labelText: 'Monday Comment',
                                                  hintText: 'Monday Comment',
                                                  contentPadding:
                                                  EdgeInsets.all(10)),
                                              onChanged: (v) {
                                                createModel.screenObject
                                                    .detail0 =
                                                    _mondayComment.text;
                                              },
                                            ),
                                            data: Theme.of(context).copyWith(
                                              primaryColor: Colors.purple[900],
                                            ),
                                          ),
                                        ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      if (tuesCheckComment == false)
                                        new Flexible(
                                          child: new Theme(
                                            child: TextFormField(
                                              controller: _tuesdayComment,
                                              cursorColor: Colors.purple,
                                              decoration: InputDecoration(
                                                  focusColor: Colors
                                                      .purple[900],
                                                  fillColor: Colors.purple,
                                                  labelText: 'Tuesday Comment',
                                                  hintText: 'Tuesday Comment',
                                                  contentPadding:
                                                  EdgeInsets.all(10)),
                                              onChanged: (v) {
                                                createModel.screenObject
                                                    .detail1 =
                                                    _tuesdayComment.text;
                                              },
                                            ),
                                            data: Theme.of(context).copyWith(
                                              primaryColor: Colors.purple[900],
                                            ),
                                          ),
                                        ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      if (wedCheckComment == false)
                                        new Flexible(
                                          child: new Theme(
                                            child: TextFormField(
                                              cursorColor: Colors.purple,
                                              controller: _wednesdayComment,
                                              decoration: InputDecoration(
                                                  focusColor: Colors
                                                      .purple[900],

                                                  fillColor: Colors.purple,
                                                  labelText: 'Wednesday Comment',
                                                  hintText: 'Wednesday Comment',
                                                  contentPadding:
                                                  EdgeInsets.all(10)),
                                              onChanged: (v) {
                                                createModel.screenObject
                                                    .detail2 =
                                                    _wednesdayComment.text;
                                              },
                                            ),
                                            data: Theme.of(context).copyWith(
                                              primaryColor: Colors.purple[900],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
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
                                            if (thursCheck == false)
                                              Text(
                                                '${thursDate}\n      Thurs',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                            SizedBox(
                                              height: 45,
                                              // margin: const EdgeInsets.only(right: 100, left: 100),
                                              width: 71,

                                              child: TextFormField(
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 2),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(15.0),
                                                  ),
                                                ),
                                                controller: _thursday,
                                                onChanged: (v) {
                                                  setState(() {
                                                    createModel.screenObject
                                                        .manHours3 =
                                                    (_thursday.text);
                                                  });
                                                },
                                                keyboardType:
                                                TextInputType.numberWithOptions(
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
                                      Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            if (thursCheck == false)
                                              Text(
                                                ' ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          width: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                    child: InkWell(
                                                      child: Icon(
                                                        Icons.arrow_drop_up,
                                                        size: 20.0,
                                                      ),
                                                      onTap: () {
                                                        int currentValue =
                                                        int.parse(
                                                            _thursday.text);
                                                        setState(() {
                                                          thursCheck = false;
                                                          currentValue++;
                                                          _thursday.text =
                                                              (currentValue)
                                                                  .toString(); // incrementing value
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  InkWell(
                                                    child: Icon(
                                                      Icons.arrow_drop_down,
                                                      size: 20.0,
                                                    ),
                                                    onTap: () {
                                                      int currentValue =
                                                      int.parse(_thursday.text);
                                                      setState(() {
                                                        thursCheck = false;
                                                        currentValue--;
                                                        _thursday
                                                            .text =
                                                            (currentValue >
                                                                0
                                                                ? currentValue
                                                                : 0)
                                                                .toString(); // decrementing value
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                      SizedBox(
                                        width: 22,
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            if (friCheck == false)
                                              Text(
                                                '${friDate}\n      Fri',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                            SizedBox(
                                              height: 45,
                                              // margin: const EdgeInsets.only(right: 100, left: 100),
                                              width: 71,

                                              child: TextFormField(
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 2),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(15.0),
                                                  ),
                                                ),
                                                controller: _friday,
                                                onChanged: (v) {
                                                  setState(() {
                                                    createModel.screenObject
                                                        .manHours4 =
                                                    (_friday.text);
                                                  });
                                                },
                                                keyboardType:
                                                TextInputType.numberWithOptions(
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
                                      Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            if (friCheck == false)
                                              Text(
                                                ' ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          width: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                    child: InkWell(
                                                      child: Icon(
                                                        Icons.arrow_drop_up,
                                                        size: 20.0,
                                                      ),
                                                      onTap: () {
                                                        int currentValue =
                                                        int.parse(_friday.text);
                                                        setState(() {
                                                          friCheck = false;
                                                          currentValue++;
                                                          _friday.text =
                                                              (currentValue)
                                                                  .toString(); // incrementing value
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  InkWell(
                                                    child: Icon(
                                                      Icons.arrow_drop_down,
                                                      size: 20.0,
                                                    ),
                                                    onTap: () {
                                                      int currentValue =
                                                      int.parse(_friday.text);
                                                      setState(() {
                                                        friCheck = false;
                                                        currentValue--;
                                                        _friday
                                                            .text =
                                                            (currentValue >
                                                                0
                                                                ? currentValue
                                                                : 0)
                                                                .toString(); // decrementing value
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            if (satCheck == false)
                                              Text(
                                                '${satDate}\n      Sat',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                            SizedBox(
                                              height: 45,
                                              // margin: const EdgeInsets.only(right: 100, left: 100),
                                              width: 71,

                                              child: TextFormField(
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 2),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(15.0),
                                                  ),
                                                ),
                                                controller: _saturday,
                                                onChanged: (v) {
                                                  setState(() {
                                                    createModel.screenObject
                                                        .manHours5 =
                                                    (_saturday.text);
                                                  });
                                                },
                                                keyboardType:
                                                TextInputType.numberWithOptions(
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
                                      Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            if (satCheck == false)
                                              Text(
                                                ' ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          width: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                    child: InkWell(
                                                      child: Icon(
                                                        Icons.arrow_drop_up,
                                                        size: 20.0,
                                                      ),
                                                      onTap: () {
                                                        int currentValue =
                                                        int.parse(
                                                            _saturday.text);
                                                        setState(() {
                                                          satCheck = false;
                                                          currentValue++;
                                                          _saturday.text =
                                                              (currentValue)
                                                                  .toString(); // incrementing value
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  InkWell(
                                                    child: Icon(
                                                      Icons.arrow_drop_down,
                                                      size: 20.0,
                                                    ),
                                                    onTap: () {
                                                      int currentValue =
                                                      int.parse(_saturday.text);
                                                      setState(() {
                                                        satCheck = false;
                                                        currentValue--;
                                                        _saturday
                                                            .text =
                                                            (currentValue >
                                                                0
                                                                ? currentValue
                                                                : 0)
                                                                .toString(); // decrementing value
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                      SizedBox(
                                        width: 15,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 31,
                                      ),
                                      if (thursCheckComment == true)
                                        new IconButton(
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              thursCheckComment = false;
                                            });
                                            //_selectDate(context);
                                          },
                                        ),
                                      if (thursCheckComment == false)
                                        new IconButton(
                                          icon: const Icon(
                                            Icons.minimize,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              thursCheckComment = true;
                                            });
                                            //_selectDate(context);
                                          },
                                        ),
                                      SizedBox(
                                        width: 65,
                                      ),
                                      if (friCheckComment == true)
                                        new IconButton(
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              friCheckComment = false;
                                            });
                                            //_selectDate(context);
                                          },
                                        ),
                                      if (friCheckComment == false)
                                        new IconButton(
                                          icon: const Icon(
                                            Icons.minimize,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              friCheckComment = true;
                                            });
                                            //_selectDate(context);
                                          },
                                        ),
                                      SizedBox(
                                        width: 61,
                                      ),
                                      if (satCheckComment == true)
                                        new IconButton(
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              satCheckComment = false;
                                            });
                                            //_selectDate(context);
                                          },
                                        ),
                                      if (satCheckComment == false)
                                        new IconButton(
                                          icon: const Icon(
                                            Icons.minimize,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              satCheckComment = true;
                                            });
                                            //_selectDate(context);
                                          },
                                        ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                    ],
                                  ),
                                  new Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      if (thursCheckComment == false)
                                        new Flexible(
                                          child: new Theme(
                                            child: TextFormField(
                                              cursorColor: Colors.purple,
                                              controller: _thursdayComment,
                                              decoration: InputDecoration(
                                                  focusColor: Colors
                                                      .purple[900],
                                                  fillColor: Colors.purple,
                                                  labelText: 'Thursday Comment',
                                                  hintText: 'Thursday Comment',
                                                  contentPadding:
                                                  EdgeInsets.all(10)),
                                              onChanged: (v) {
                                                setState(() {
                                                  createModel.screenObject
                                                      .detail3 =
                                                      _thursdayComment.text;
                                                });
                                              },
                                            ),
                                            data: Theme.of(context).copyWith(
                                              primaryColor: Colors.purple[900],
                                            ),
                                          ),
                                        ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      if (friCheckComment == false)
                                        new Flexible(
                                          child: new Theme(
                                            child: TextFormField(
                                              cursorColor: Colors.purple,
                                              controller: _fridayComment,
                                              decoration: InputDecoration(
                                                  focusColor: Colors
                                                      .purple[900],
                                                  fillColor: Colors.purple,
                                                  labelText: 'Friday Comment',
                                                  hintText: 'Friday Comment',
                                                  contentPadding:
                                                  EdgeInsets.all(10)),
                                              onChanged: (v) {
                                                setState(() {
                                                  createModel.screenObject
                                                      .detail4 =
                                                      _fridayComment.text;
                                                });
                                              },
                                            ),
                                            data: Theme.of(context).copyWith(
                                              primaryColor: Colors.purple[900],
                                            ),
                                          ),
                                        ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      if (satCheckComment == false)
                                        new Flexible(
                                          child: new Theme(
                                            child: TextFormField(
                                              cursorColor: Colors.purple,
                                              controller: _saturdayComment,
                                              decoration: InputDecoration(
                                                  focusColor: Colors
                                                      .purple[900],
                                                  fillColor: Colors.purple,
                                                  labelText: 'Saturday Comment',
                                                  hintText: 'Saturday Comment',
                                                  contentPadding:
                                                  EdgeInsets.all(10)),
                                              onChanged: (v) {
                                                setState(() {
                                                  createModel.screenObject
                                                      .detail5 =
                                                      _saturdayComment.text;
                                                });
                                              },
                                            ),
                                            data: Theme.of(context).copyWith(
                                              primaryColor: Colors.purple[900],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  // last entry box
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 138,
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            if (sunCheck == false)
                                              Text(
                                                '${sunDate}\n      Sun',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                            SizedBox(
                                              height: 45,
                                              // margin: const EdgeInsets.only(right: 100, left: 100),
                                              width: 65,

                                              child: TextFormField(
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 2),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(15.0),
                                                  ),
                                                ),
                                                controller: _sunday,
                                                onChanged: (v) {
                                                  setState(() {
                                                    createModel.screenObject
                                                        .manHours6 =
                                                    (_sunday.text);
                                                  });
                                                },
                                                keyboardType:
                                                TextInputType.numberWithOptions(
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
                                      Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            if (sunCheck == false)
                                              Text(
                                                ' ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          width: 1.15,
                                                        ),
                                                      ),
                                                    ),
                                                    child: InkWell(
                                                      child: Icon(
                                                        Icons.arrow_drop_up,
                                                        size: 20.0,
                                                      ),
                                                      onTap: () {
                                                        sunCheck = false;
                                                        int currentValue =
                                                        int.parse(_sunday.text);
                                                        setState(() {
                                                          currentValue++;
                                                          _sunday.text =
                                                              (currentValue)
                                                                  .toString(); // incrementing value
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  InkWell(
                                                    child: Icon(
                                                      Icons.arrow_drop_down,
                                                      size: 20.0,
                                                    ),
                                                    onTap: () {
                                                      int currentValue =
                                                      int.parse(_sunday.text);
                                                      setState(() {
                                                        sunCheck = false;
                                                        currentValue--;
                                                        _sunday
                                                            .text =
                                                            (currentValue >
                                                                0
                                                                ? currentValue
                                                                : 0)
                                                                .toString(); // decrementing value
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                      SizedBox(
                                        width: 22,
                                      ),
                                    ],
                                  ),

                                  if (sunCheckComment == true)
                                    new IconButton(
                                      icon: const Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          sunCheckComment = false;
                                        });
                                        //_selectDate(context);
                                      },
                                    ),
                                  if (sunCheckComment == false)
                                    new IconButton(
                                      icon: const Icon(
                                        Icons.minimize,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          sunCheckComment = true;
                                        });
                                        //_selectDate(context);
                                      },
                                    ),
                                  if (sunCheckComment == false)
                                    Theme(
                                      child: TextFormField(
                                        cursorColor: Colors.purple,
                                        controller: _sundayComment,
                                        decoration: InputDecoration(
                                            focusColor: Colors.purple[900],
                                            fillColor: Colors.purple,
                                            labelText: 'Sunday Comment',
                                            hintText: 'Sunday Comment',
                                            contentPadding: EdgeInsets.all(10)),
                                        onChanged: (v) {
                                          setState(() {
                                            createModel.screenObject.detail6 =
                                                _sundayComment.text;
                                          });
                                        },
                                      ),
                                      data: Theme.of(context).copyWith(
                                        primaryColor: Colors.redAccent,
                                      ),
                                    ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  Container(
                                    height: 50,
                                    width: 110,
                                    alignment: Alignment.center,

                                    child: Theme(
                                      child: TextField(
                                        style: TextStyle(
                                            fontFamily: "DancingScript-VariableFont_wght",
                                            fontWeight: FontWeight.bold),
                                        controller: totalHours,
                                        cursorColor: mainColor,
                                        onChanged: (v) {
                                          //   models.comment = _comment.text;
                                        },
                                        decoration: InputDecoration(
                                          disabledBorder: OutlineInputBorder(

                                            borderRadius: BorderRadius.circular(

                                                25.0),
                                            borderSide: BorderSide(
                                                color: Colors.purple,
                                                width: 2),
                                          ),

                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                25.0),
                                            borderSide: BorderSide(
                                                color: Colors.purple,
                                                width: 1.5),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                25.0),
                                          ),
                                          labelText: 'Hours',
                                          labelStyle: TextStyle(
                                              fontFamily: "DancingScript-VariableFont_wght",
                                              fontWeight: FontWeight.bold),
                                          hintText: 'Hours',
                                          prefixIcon: const Icon(
                                            Icons.watch_later_sharp,
                                            color: Colors.green,
                                          ),

                                        ),


                                      ),
                                      data: Theme.of(context).copyWith(
                                        primaryColor: Colors.redAccent,
                                      ),
                                    ),
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
                                              borderRadius: BorderRadius
                                                  .circular(25),
                                              border: Border.all(
                                                  color: Colors.purple,
                                                  style: BorderStyle.solid,
                                                  width: 2),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius
                                                  .circular(30),
                                              child: FlatButton(
                                                color: Colors.grey[350],
                                                onPressed: () {
                                                  setState(() {
                                                    _monday.text = '0';
                                                    _tuesday.text = '0';
                                                    _wednesday.text = '0';
                                                    _thursday.text = '0';
                                                    _friday.text = '0';
                                                    _sunday.text = '0';
                                                    _saturday.text = '0';
                                                    dropdown = null;
                                                    sunCheck = true;
                                                    monCheck = true;
                                                    tuesCheck = true;
                                                    wedCheck = true;
                                                    thursCheck = true;
                                                    friCheck = true;
                                                    satCheck = true;
                                                    sunCheckComment = true;
                                                    monCheckComment = true;
                                                    wedCheckComment = true;
                                                    tuesCheckComment = true;
                                                    thursCheckComment = true;
                                                    friCheckComment = true;
                                                    satCheckComment = true;
                                                  });
                                                },
                                                child: Text(
                                                  'Clear',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontFamily: "DancingScript-VariableFont_wght",
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          )),
                                      new SizedBox(
                                          width: 120.0,
                                          height: 50.0,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(25),
                                                border: Border.all(
                                                    color: Colors.purple,
                                                    style: BorderStyle.solid,
                                                    width: 2),
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius
                                                    .circular(30),
                                                child: FlatButton(
                                                  color: Colors.grey[350],
                                                  onPressed: () {
                                                    setState(() {
                                                      createModel.screenName =
                                                      'S0003';
                                                      createModel.language =
                                                      "E";
                                                      createModel.mode =
                                                      "create";
                                                      createModel
                                                          .respondWithSummary =
                                                      false;
                                                      createModel.screenObject
                                                          .detail0 =
                                                          _mondayComment.text;
                                                      createModel.screenObject
                                                          .detail1 =_tuesdayComment.text;
                                                      createModel.screenObject
                                                          .detail2 =
                                                          _wednesdayComment
                                                              .text;
                                                      createModel.screenObject
                                                          .detail3 =
                                                          _thursdayComment.text;
                                                      createModel.screenObject
                                                          .detail4 =
                                                          _fridayComment.text;
                                                      createModel.screenObject
                                                          .detail5 =
                                                          _saturdayComment.text;
                                                      createModel.screenObject
                                                          .detail6 =
                                                          _sundayComment.text;
                                                      if (_monday.text == '0') {
                                                        createModel.screenObject
                                                            .manHours0 = null;
                                                      } else {
                                                        createModel.screenObject
                                                            .manHours0 =
                                                        (_monday.text);
                                                      }
                                                      if (_tuesday.text ==
                                                          '0') {
                                                        createModel.screenObject
                                                            .manHours1 = null;
                                                      } else {
                                                        createModel.screenObject
                                                            .manHours1 =
                                                        (_tuesday.text);
                                                      }
                                                      if (_wednesday.text ==
                                                          '0') {
                                                        createModel.screenObject
                                                            .manHours2 = null;
                                                      } else {
                                                        createModel.screenObject
                                                            .manHours2 =
                                                        (_wednesday.text);
                                                      }
                                                      if (_thursday.text ==
                                                          "0") {
                                                        createModel.screenObject
                                                            .manHours3 = null;
                                                      } else {
                                                        createModel.screenObject
                                                            .manHours3 =
                                                        (_thursday.text);
                                                      }
                                                      if (_friday.text == '0') {
                                                        createModel.screenObject
                                                            .manHours4 = null;
                                                      } else {
                                                        createModel.screenObject
                                                            .manHours4 =
                                                        (_friday.text);
                                                      }
                                                      if (_saturday.text ==
                                                          "0") {
                                                        createModel.screenObject
                                                            .manHours5 = null;
                                                      } else {
                                                        createModel.screenObject
                                                            .manHours5 =
                                                        (_saturday.text);
                                                      }
                                                      if (_sunday.text == '0') {
                                                        createModel.screenObject
                                                            .manHours6 = null;
                                                      } else {
                                                        createModel.screenObject
                                                            .manHours6 =
                                                        (_sunday.text);
                                                      }

                                                      postHttp(
                                                          'timesheet/updateScreen',
                                                          createModel)
                                                          .then((value) {
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
                                                                                TimeSheetList())
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
                                                    });
                                                  },
                                                  child: Text(
                                                    'Save',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),

              Column(
                children: timeSheetCard,
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   height: 50,
              //   width: 110,
              //   alignment: Alignment.center,
              //
              //   child: Theme(
              //     child: TextField(
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //       controller: totalHours,
              //       cursorColor: mainColor,
              //       onChanged: (v) {
              //         //   models.comment = _comment.text;
              //       },
              //       decoration: InputDecoration(
              //         disabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(25.0),
              //           borderSide: BorderSide(color: Colors.purple, width: 1.5),
              //         ),
              //         enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(25.0),
              //           borderSide: BorderSide(color: Colors.purple, width: 1.5),
              //         ),
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(25.0),
              //         ),
              //         labelText: 'Hours',
              //         labelStyle: TextStyle(fontWeight:FontWeight.bold),
              //         hintText: 'Hours',
              //         prefixIcon: const Icon(
              //           Icons.watch_later_sharp,
              //           color: Colors.green,
              //         ),
              //
              //       ),
              //
              //
              //     ),
              //     data: Theme.of(context).copyWith(
              //       primaryColor: Colors.redAccent,
              //     ),
              //   ),
              // ),
            ],
          ),
        ));
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      marginEnd: 18,
      marginBottom: 20,
      iconTheme: new IconThemeData(color: Colors.lightGreenAccent),
      child: new Icon(Icons.add),
      icon: Icons.menu_open,
      activeIcon: Icons.close,
      activeForegroundColor: Colors.red,
      activeBackgroundColor: Colors.grey,
      buttonSize: 56.0,
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.purple[900],
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: CircleBorder(),
      gradientBoxShape: BoxShape.circle,
      children: [
        SpeedDialChild(
          child: Icon(
            Icons.add,
            color: Colors.lightGreenAccent,
          ),

          backgroundColor: Colors.blue,
          label: 'Add Entry',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () {
            add();
            enabled = true;
          },
          // onLongPress: () => print('FIRST CHILD LONG PRESS'),
        ),
        if (enabled == true)
          SpeedDialChild(
            child: Icon(Icons.delete_forever, color: Colors.lightGreenAccent),
            backgroundColor: Colors.red,
            label: 'Delete',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              if (timeSheetCard.length > 0) {
                delete();
              } else if (timeSheetCard.length == 0) {
                setState(() {
                  enabled = false;
                  Toast.show("Invalid Process", context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                });
              }
            },
          )
      ],
    );
  }

  void add() {
    setState(() {
      timeSheetCard.add(TimesheetCard());
    });
  }

  void delete() {
    setState(() {
      timeSheetCard.removeLast();
    });
  }
}
