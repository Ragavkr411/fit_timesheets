import 'dart:convert';

import 'package:fit_timesheets/Pages/TimeSheet/TimeSheetList.dart';
import 'package:fit_timesheets/Pages/TimeSheet/timesheetMainPage.dart';
import 'package:fit_timesheets/models/activitiesdropdown.dart';
import 'package:fit_timesheets/models/create.dart';
import 'package:fit_timesheets/models/getTimeSheet/getDetails.dart';
import 'package:fit_timesheets/models/multiOccData.dart';
import 'package:fit_timesheets/models/screenObject.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:toast/toast.dart';
import '../editTimeSheet.dart';
import '../footer.dart';



// // Find first date and last date of any provided date
// DateTime date = DateTime.parse('2020-11-24');
// print(findFirstDateOfTheWeek(date));
// print(findLastDateOfTheWeek(date));
DateTime today = DateTime.now();
String sunDate2 =
DateFormat('yyyyMMdd').format(findLastDateOfTheWeek(today));
const Color mainColor = Color(0xFF796A9D);

class EditForm extends StatefulWidget {
  final  MultiOccData getTimeSheetModel;

  const EditForm({Key key, this.getTimeSheetModel}) : super(key: key);

  @override
  EditFormState createState() => EditFormState(getTimeSheetModel);
}

class EditFormState extends State<EditForm> {
  final  MultiOccData getTimeSheetModel;
  Create createModel=Create();
  Create deleteModel=Create();
  bool checkedComment=true;
  Activities activityObject = Activities();
  Activities activityModel = Activities();
  bool monCheck=true;
  bool tuesCheck=true;
  bool wedCheck=true;
  bool thursCheck=true;
  bool friCheck=true;
  bool satCheck=true;
  bool sunCheck=true;
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

  EditFormState(this.getTimeSheetModel);
  double progress = 0.0;
  @override
  void initState() {
    super.initState();
    if(getTimeSheetModel.manHours0==null){
      _monday.text='0';
    }else {
      var monSplit = "${getTimeSheetModel.manHours0}";
      _monday.text = monSplit[0];
    }
    if(getTimeSheetModel.manHours1==null){
      _tuesday.text='0';
    }else {
      var tuesSplit = "${getTimeSheetModel.manHours1}";
      _tuesday.text= tuesSplit[0];
    }
    if(getTimeSheetModel.manHours2==null){
      _wednesday.text='0';
    }else {
      var wedSplit = "${getTimeSheetModel.manHours2}";
      _wednesday.text= wedSplit[0];
    }
    if(getTimeSheetModel.manHours3==null){
      _thursday.text='0';
    }else {
      var thursSplit = "${getTimeSheetModel.manHours3}";
      _thursday.text=thursSplit[0];
    }
    if(getTimeSheetModel.manHours4==null){
      _friday.text='0';
    }else {
      var friSplit = "${getTimeSheetModel.manHours4}";
      _friday.text=friSplit[0];
    }
    if(getTimeSheetModel.manHours5==null){
      _saturday.text='0';
    }else {
      var satSplit = "${getTimeSheetModel.manHours5}";
      _saturday.text= satSplit[0];
    }
    if(getTimeSheetModel.manHours6==null){
      _sunday.text='0';
    }else {
      var sunSplit = "${getTimeSheetModel.manHours6}";
      _sunday.text=sunSplit[0];
    }// Setting the initial value for the field.


    if(getTimeSheetModel.detail0==null){
      _mondayComment.text='';
    }else {

      _mondayComment.text = "${getTimeSheetModel.detail0}";
    }
    if(getTimeSheetModel.detail1==null){
      _tuesdayComment.text='';
    }else {
      _tuesdayComment.text = "${getTimeSheetModel.detail1}";
    }
    if(getTimeSheetModel.detail2==null){
      _wednesdayComment.text='';
    }else {
      _wednesdayComment.text = "${getTimeSheetModel.detail2}";
    }
    if(getTimeSheetModel.detail3==null){
     _thursdayComment.text='';
    }else {
      _thursdayComment.text = "${getTimeSheetModel.detail3}";
    }
    if(getTimeSheetModel.detail4==null){
      _fridayComment.text='';
    }else {
      _fridayComment.text = "${getTimeSheetModel.detail4}";
    }
    if(getTimeSheetModel.detail5==null){
      _saturdayComment.text='';
    }else {
      _saturdayComment.text = "${getTimeSheetModel.detail5}";
    }
    if(getTimeSheetModel.detail6==null){
     _sundayComment.text='';
    }else {
      _sundayComment.text = "${getTimeSheetModel.detail6}";
    }
  }
  bool enabled = false;
  String projectName;
  List<MultiOccData> muliOccDataList = [];
  List<TimesheetCard> timeSheetCard = [];
  String dropdown;
  bool monCheckComment=true;
  Map<String, dynamic> json;
  bool tuesCheckComment=true;
  bool wedCheckComment=true;
  bool thursCheckComment=true;
  bool friCheckComment=true;
  bool satCheckComment=true;
  bool sunCheckComment=true;
  int length = 0;
  int pos=0;
  double totalValue = 0.0;
  @override
  Widget build(BuildContext context) {
    String monDate =
    DateFormat('dd-MM-yyyy').format(findFirstDateOfTheWeek(today));
    String sunDate =
    DateFormat('dd-MM-yyyy').format(findLastDateOfTheWeek(today));

    List<DateTime> getDaysInBeteween(DateTime startDate, DateTime endDate) {
      List<DateTime> days = [];
      for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
        days.add(
            DateTime(
                startDate.year,
                startDate.month,
                // In Dart you can set more than. 30 days, DateTime will do the trick
                startDate.day + i)
        );
      }
      return days;
    }


    List <DateTime> betweenDates=getDaysInBeteween(findFirstDateOfTheWeek(today), findLastDateOfTheWeek(today));


    String tuesDate =
    DateFormat('dd-MM-yyyy').format(betweenDates[1]);

    String wedDate =
    DateFormat('dd-MM-yyyy').format(betweenDates[2]);
    String thursDate =
    DateFormat('dd-MM-yyyy').format(betweenDates[3]);
    String friDate =
    DateFormat('dd-MM-yyyy').format(betweenDates[4]);
    String satDate =
    DateFormat('dd-MM-yyyy').format(betweenDates[5]);



    getHttp2(
        'timesheet/getScreen?screenName=S0004&language =E&firstTime=true&pageNum=0&pageSize=1000&enddate=${sunDate2}&searchCriteria=projectname')
        .then((apiValue) {

      setState(() {
        activityObject = Activities.fromJson(apiValue);
      });
    });

    int mon = int.parse(_monday.text);
    int tues = int.parse(_tuesday.text);
    int wed = int.parse(_wednesday.text);
    int thurs = int.parse(_thursday.text);
    int fri = int.parse(_friday.text);
    int sat = int.parse(_saturday.text);
    int sun = int.parse(_sunday.text);

    totalValue=(mon+tues+wed+thurs+fri+sat+sun).toDouble();
    double total = totalValue;
    if (total >= 45) {
      progress = 1.0;
    } else if (total >= 36) {
      progress = 0.8;
    } else if (total >= 27) {
      progress = 0.6;
    } else if (total >= 18) {
      progress = 0.4;
    } else if (total >= 9) {
      progress = 0.2;
    } else if (total >= 0) {
      progress = 0.1;
    }

    List<Widget> entryList=[];

    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Modify TimeSheet',
          style: TextStyle(
              fontFamily: "Lobster-Regular",
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[900],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
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
                            child:  Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),

                                Theme(
                                  child: TextFormField(
                                    enabled: false,
                                    style: TextStyle(
                                        fontFamily: "DancingScript-VariableFont_wght",fontWeight: FontWeight.bold),
                                    initialValue: '${getTimeSheetModel.activityid}'+
                                        '-${getTimeSheetModel.activityname}',
                                    cursorColor: mainColor,
                                    onChanged: (v) {
                                      //   models.comment = _comment.text;
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
                                      labelText: 'Activity id and Name',
                                      labelStyle: TextStyle(
                                          fontFamily: "DancingScript-VariableFont_wght",fontWeight:FontWeight.bold),
                                      hintText: 'Activity id and Name',
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
                                        fontFamily: "DancingScript-VariableFont_wght",fontWeight: FontWeight.bold),
                                    initialValue: '${getTimeSheetModel.subprojectid}'+
                                        '-${getTimeSheetModel.subprojectname}',
                                    cursorColor: mainColor,
                                    onChanged: (v) {
                                      //   models.comment = _comment.text;
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
                                      labelText: 'Sub-project id and Name',
                                      labelStyle: TextStyle(
                                          fontFamily: "DancingScript-VariableFont_wght",fontWeight:FontWeight.bold),
                                      hintText: 'Sub-project id and Name',
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
                                    style: TextStyle(fontFamily: "DancingScript-VariableFont_wght",fontWeight: FontWeight.bold),
                                    initialValue: '${getTimeSheetModel.projectid}'+
                                        '-${getTimeSheetModel.projectname}',
                                    cursorColor: mainColor,
                                    onChanged: (v) {
                                      //   models.comment = _comment.text;
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
                                      labelText: 'Project id and Name',
                                      labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght",fontWeight:FontWeight.bold),
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
                                          if (monCheck == false)
                                            Text(
                                              '${monDate}\n      Mon',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          SizedBox(
                                            height: 47,
                                            // margin: const EdgeInsets.only(right: 100, left: 100),
                                            width: 71,

                                            child: TextFormField(
                                            //  initialValue: '${getTimeSheetModel.manHours0}',
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
                                                setState(() {});
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
                                                    _monday.text = (currentValue >
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
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          SizedBox(
                                            height: 45,
                                            // margin: const EdgeInsets.only(right: 100, left: 100),
                                            width: 71,

                                            child: TextFormField(
                                            //  initialValue: '${getTimeSheetModel.manHours1}',
                                              controller: _tuesday,
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
                                                      int.parse(
                                                          _tuesday.text);
                                                      setState(() {
                                                        tuesCheck = false;
                                                        currentValue++;
                                                        _tuesday.text = (currentValue)
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
                                                          .text = (currentValue >
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
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          SizedBox(
                                            height: 45,
                                            // margin: const EdgeInsets.only(right: 100, left: 100),
                                            width: 71,

                                            child: TextFormField(
                                             // initialValue: '${getTimeSheetModel.manHours2}',

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
                                                    int currentValue = int.parse(
                                                        _wednesday.text);
                                                    setState(() {
                                                      wedCheck = false;
                                                      currentValue--;
                                                      _wednesday
                                                          .text = (currentValue >
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
                                          //  initialValue: '${getTimeSheetModel.detail0}',

                                            cursorColor: Colors.purple,
                                            //controller: _wednesdayComment,
                                          controller: _mondayComment,
                                            decoration: InputDecoration(
                                                focusColor: Colors.purple[900],
                                                fillColor: Colors.purple,
                                                labelText: 'Monday Comment',
                                                hintText: 'Monday Comment',
                                                contentPadding:
                                                EdgeInsets.all(10)),
                                            onChanged: (v) {
                                              createModel.screenObject.detail0 =
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
                                         //   initialValue: '${getTimeSheetModel.detail1}',

                                            controller: _tuesdayComment,
                                            cursorColor: Colors.purple,
                                            decoration: InputDecoration(
                                                focusColor: Colors.purple[900],
                                                fillColor: Colors.purple,
                                                labelText: 'Tuesday Comment',
                                                hintText: 'Tuesday Comment',
                                                contentPadding:
                                                EdgeInsets.all(10)),
                                            onChanged: (v) {
                                              createModel.screenObject.detail1 =
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
                                           // initialValue: '${getTimeSheetModel.detail2}',

                                            cursorColor: Colors.purple,
                                            controller: _wednesdayComment,
                                            decoration: InputDecoration(
                                                focusColor: Colors.purple[900],

                                                fillColor: Colors.purple,
                                                labelText: 'Wednesday Comment',
                                                hintText: 'Wednesday Comment',
                                                contentPadding:
                                                EdgeInsets.all(10)),
                                            onChanged: (v) {
                                              createModel.screenObject.detail2 =
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
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          SizedBox(
                                            height: 45,
                                            // margin: const EdgeInsets.only(right: 100, left: 100),
                                            width: 71,

                                            child: TextFormField(
                                             // initialValue: '${getTimeSheetModel.manHours3}',

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
                                                          .text = (currentValue >
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
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          SizedBox(
                                            height: 45,
                                            // margin: const EdgeInsets.only(right: 100, left: 100),
                                            width: 71,

                                            child: TextFormField(
                                           //   initialValue: '${getTimeSheetModel.manHours4}',

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
                                                      int.parse(_friday.text);
                                                      setState(() {
                                                        friCheck = false;
                                                        currentValue++;
                                                        _friday.text = (currentValue)
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
                                                          .text = (currentValue >
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
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          SizedBox(
                                            height: 45,
                                            // margin: const EdgeInsets.only(right: 100, left: 100),
                                            width: 71,

                                            child: TextFormField(
                                            //  initialValue: '${getTimeSheetModel.manHours5}',

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
                                                          .text = (currentValue >
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
                                           // initialValue: '${getTimeSheetModel.detail3}',

                                            cursorColor: Colors.purple,
                                               controller: _thursdayComment,
                                            decoration: InputDecoration(
                                                focusColor: Colors.purple[900],
                                                fillColor: Colors.purple,
                                                labelText: 'Thursday Comment',
                                                hintText: 'Thursday Comment',
                                                contentPadding:
                                                EdgeInsets.all(10)),
                                            onChanged: (v) {
                                              setState(() {
                                                createModel.screenObject.detail3 =
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
                                           // initialValue: '${getTimeSheetModel.detail4}',

                                            cursorColor: Colors.purple,
                                              controller: _fridayComment,
                                            decoration: InputDecoration(
                                                focusColor: Colors.purple[900],
                                                fillColor: Colors.purple,
                                                labelText: 'Friday Comment',
                                                hintText: 'Friday Comment',
                                                contentPadding:
                                                EdgeInsets.all(10)),
                                            onChanged: (v) {
                                              setState(() {
                                                createModel.screenObject.detail4 =
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
                                           // initialValue: '${getTimeSheetModel.detail5}',

                                            cursorColor: Colors.purple,
                                          controller: _saturdayComment,
                                            decoration: InputDecoration(
                                                focusColor: Colors.purple[900],
                                                fillColor: Colors.purple,
                                                labelText: 'Saturday Comment',
                                                hintText: 'Saturday Comment',
                                                contentPadding:
                                                EdgeInsets.all(10)),
                                            onChanged: (v) {
                                              setState(() {
                                                createModel.screenObject.detail5 =
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
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          SizedBox(
                                            height: 45,
                                            // margin: const EdgeInsets.only(right: 100, left: 100),
                                            width: 65,

                                            child: TextFormField(
                                             // initialValue: '${getTimeSheetModel.manHours6}',

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
                                                      sunCheck = false;
                                                      int currentValue =
                                                      int.parse(_sunday.text);
                                                      setState(() {
                                                        currentValue++;
                                                        _sunday.text = (currentValue)
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
                                                          .text = (currentValue >
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
                                     // initialValue: '${getTimeSheetModel.detail6}',

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
                                Center(
                                  child: IconButton(
                                    icon:
                                    const Icon(Icons.info,color: Colors.red,),
                                    onPressed: () {
                                      if( createModel.screenObject.detail0==null &&
                                          createModel.screenObject.detail1==null &&
                                          createModel.screenObject.detail2==null &&
                                          createModel.screenObject.detail3==null &&
                                          createModel.screenObject.detail4==null &&
                                          createModel.screenObject.detail5==null &&
                                          createModel.screenObject.detail6==null
                                      ){
                                        createModel.screenObject.detail0='';
                                        createModel.screenObject.detail1='';
                                        createModel.screenObject.detail2='';
                                        createModel.screenObject.detail3='';
                                        createModel.screenObject.detail4='';
                                        createModel.screenObject.detail5='';
                                        createModel.screenObject.detail6='';


                                      }
                                      return showDialog<void>(
                                        context: context,
                                        barrierDismissible: false,
// user must tap button!
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.grey[350],
                                            title: Text(
                                                'Details'),
                                            content: SingleChildScrollView(
                                              child: ListBody(
                                                children: <Widget>[


                                                  Text('Monday Comment: ${createModel.screenObject.detail0}'),
                                                  Text('Tuesday Comment: ${createModel.screenObject.detail1}'),
                                                  Text('Wednesday Comment: ${createModel.screenObject.detail2}'),
                                                  Text('Thursday Comment: ${createModel.screenObject.detail3}'),
                                                  Text('Friday Comment: ${createModel.screenObject.detail4}'),
                                                  Text('Saturday Comment: ${createModel.screenObject.detail5}'),
                                                  Text('Sunday Comment: ${createModel.screenObject.detail6}'),

                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text('OK'),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),

                                            ],
                                          );
                                        },
                                      );

                                    },
                                  ),
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

                                                  return showDialog<void>(
                                                    context: context,
                                                    barrierDismissible: false,
                                                    // user must tap button!
                                                    builder: (BuildContext context) {
                                                      return AlertDialog(
                                                        backgroundColor: Colors.grey[350],
                                                        title: Text(
                                                            'Delete'),
                                                        content: SingleChildScrollView(
                                                          child: ListBody(
                                                            children: <Widget>[
                                                              Text('Do you want to delete this timesheet'),
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

                                                              createModel.screenObject.activityid=getTimeSheetModel.activityid;
                                                              createModel.screenObject.activityname=getTimeSheetModel.activityname;
                                                              createModel.screenObject.projectid=getTimeSheetModel.projectid;
                                                              createModel.screenObject.projectname=getTimeSheetModel.projectname;
                                                              createModel.screenObject.subprojectid=getTimeSheetModel.subprojectid;
                                                              createModel.screenObject.subprojectname=getTimeSheetModel.subprojectname;

                                                              createModel.screenName='S0003';
                                                              createModel.language="E";
                                                              createModel.mode="delete";
                                                              createModel.screenObject.enddate='$sunDate2';
                                                              createModel.respondWithSummary=false;
                                                              createModel.screenObject.detail0=_mondayComment.text;
                                                              createModel.screenObject.detail1=_tuesdayComment.text;
                                                              createModel.screenObject.detail2=_wednesdayComment.text;
                                                              createModel.screenObject.detail3=_thursdayComment.text;
                                                              createModel.screenObject.detail4=_fridayComment.text;
                                                              createModel.screenObject.detail5=_saturdayComment.text;
                                                              createModel.screenObject.detail6=_sundayComment.text;
                                                              if(_monday.text=='0'){
                                                                createModel.screenObject
                                                                    .manHours0=null;
                                                              }else {
                                                                createModel.screenObject
                                                                    .manHours0 =
                                                                    (_monday.text);
                                                              }
                                                              if(_tuesday.text=='0'){
                                                                createModel.screenObject
                                                                    .manHours1=null;
                                                              }else{
                                                                createModel.screenObject
                                                                    .manHours1 =
                                                                    (_tuesday.text);}
                                                              if(_wednesday.text=='0'){
                                                                createModel.screenObject
                                                                    .manHours2 =null;
                                                              }else{
                                                                createModel.screenObject
                                                                    .manHours2 =
                                                                    (_wednesday.text);}
                                                              if(_thursday.text=="0"){
                                                                createModel.screenObject
                                                                    .manHours3 =null;
                                                              }else{
                                                                createModel.screenObject
                                                                    .manHours3 =
                                                                   (_thursday.text);}
                                                              if(_friday.text=='0'){
                                                                createModel.screenObject
                                                                    .manHours4 =null;
                                                              }else{
                                                                createModel.screenObject
                                                                    .manHours4 =
                                                                    (_friday.text);}
                                                              if(_saturday.text=="0"){
                                                                createModel.screenObject
                                                                    .manHours5 =null;
                                                              }else{
                                                                createModel.screenObject
                                                                    .manHours5 =
                                                                    (_saturday.text);}
                                                              if(_sunday.text=='0'){
                                                                createModel.screenObject
                                                                    .manHours6 =null;
                                                              }else {
                                                                createModel.screenObject
                                                                    .manHours6 =
                                                                   (_sunday.text);
                                                              }
                                                              postHttp('timesheet/updateScreen',
                                                                  createModel)
                                                                  .then((value) {
                                                                print("submi $value");
                                                                return showDialog<void>(
                                                                  context: context,
                                                                  barrierDismissible: false,
                                                                  // user must tap button!
                                                                  builder: (BuildContext context) {
                                                                    return AlertDialog(
                                                                      backgroundColor: Colors.grey[350],
                                                                      title: Text(
                                                                          'Records have been successfully deleted'),
                                                                      content: SingleChildScrollView(
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
                                                                                    context) =>TimeSheetList())
                                                                                       );
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
                                                'Delete',
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
                                                    var monday = _monday.text.split('.');
                                                    var tuesday = _tuesday.text.split('.');
                                                    var wednesday = _wednesday.text.split('.');
                                                    var thursday = _thursday.text.split('.');
                                                    var friday = _friday.text.split('.');
                                                    var saturday = _saturday.text.split('.');
                                                    var sunday = _sunday.text.split('.');

                                                    createModel.screenName='S0003';
                                                    createModel.language="E";
                                                    createModel.mode="modify";
                                                    createModel.respondWithSummary=false;
                                                    createModel.screenObject.activityid=getTimeSheetModel.activityid;
                                                    createModel.screenObject.activityname=getTimeSheetModel.activityname;
                                                    createModel.screenObject.projectid=getTimeSheetModel.projectid;
                                                    createModel.screenObject.projectname=getTimeSheetModel.projectname;
                                                    createModel.screenObject.subprojectid=getTimeSheetModel.subprojectid;
                                                    createModel.screenObject.subprojectname=getTimeSheetModel.subprojectname;
                                                    createModel.screenObject.enddate='$sunDate2';

                                                    createModel.screenObject.detail0=_mondayComment.text;
                                                    createModel.screenObject.detail1=_tuesdayComment.text;
                                                    createModel.screenObject.detail2=_wednesdayComment.text;
                                                    createModel.screenObject.detail3=_thursdayComment.text;
                                                    createModel.screenObject.detail4=_fridayComment.text;
                                                    createModel.screenObject.detail5=_saturdayComment.text;
                                                    createModel.screenObject.detail6=_sundayComment.text;
                                                    if(_monday.text=='0'){
                                                      createModel.screenObject
                                                          .manHours0=null;
                                                    }else {
                                                      createModel.screenObject
                                                          .manHours0 =
                                                          (monday[0]);
                                                    }
                                                    if(_tuesday.text=='0'){
                                                      createModel.screenObject
                                                          .manHours1=null;
                                                    }else{
                                                      createModel.screenObject
                                                          .manHours1 =
                                                          (tuesday[0]);}
                                                    if(_wednesday.text=='0'){
                                                      createModel.screenObject
                                                          .manHours2 =null;
                                                    }else{
                                                      createModel.screenObject
                                                          .manHours2 =
                                                          (wednesday[0]);}
                                                    if(_thursday.text=="0"){
                                                      createModel.screenObject
                                                          .manHours3 =null;
                                                    }else{
                                                      createModel.screenObject
                                                          .manHours3 =
                                                         (thursday[0]);}
                                                    if(_friday.text=='0'){
                                                      createModel.screenObject
                                                          .manHours4 =null;
                                                    }else{
                                                      createModel.screenObject
                                                          .manHours4 =
                                                         (friday[0]);}
                                                    if(_saturday.text=="0"){
                                                      createModel.screenObject
                                                          .manHours5 =null;
                                                    }else{
                                                      createModel.screenObject
                                                          .manHours5 =
                                                         (saturday[0]);}
                                                    if(_sunday.text=='0'){
                                                      createModel.screenObject
                                                          .manHours6 =null;
                                                    }else {
                                                      createModel.screenObject
                                                          .manHours6 =
                                                         (sunday[0]);
                                                    }

                                                    postHttp('timesheet/updateScreen',
                                                        createModel)
                                                        .then((value) {
    if(value['status']=='SUCCESS') {
                                                      return showDialog<void>(
                                                        context: context,
                                                        barrierDismissible: false,
                                                        // user must tap button!
                                                        builder: (BuildContext context) {
                                                          return AlertDialog(
                                                            backgroundColor: Colors.grey[350],
                                                            title: Text(
                                                                'Records have been successfully updated'),
                                                            content: SingleChildScrollView(
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
                                                                          context) =>TimeSheetList()
                                                                             ));
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );}
                                                      else if(value['status']!='SUCCESS'){
                                                      Toast.show("Something went wrong,please try again", context,
                                                      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

                                                      }
                                                    });
                                                  });
                                                },
                                                child: Text(
                                                  'Save',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(color: Colors.black),
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


            SizedBox(height: 20,),
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
            // ButtonBar(
            //   alignment: MainAxisAlignment.center,
            //   buttonMinWidth: 80,
            //   children: <Widget>[
            //
            //     new SizedBox(
            //         width: 120.0,
            //         height: 50.0,
            //         child: Container(
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(25),
            //               border: Border.all(
            //                   color: Colors.purple,
            //                   style: BorderStyle.solid,
            //                   width: 2),
            //             ),
            //             child: ClipRRect(
            //               borderRadius: BorderRadius.circular(30),
            //               child: FlatButton(
            //                 color: Colors.grey[350],
            //                 onPressed: () {
            //                   setState(() {
            //                     // postHttp('timesheet/updateScreen',
            //                     //     createModel)
            //                     //     .then((value) {
            //                     //       print('Submit value$value');
            //                     //   return showDialog<void>(
            //                     //     context: context,
            //                     //     barrierDismissible: false,
            //                     //     // user must tap button!
            //                     //     builder: (BuildContext context) {
            //                     //       return AlertDialog(
            //                     //         backgroundColor: Colors.grey[350],
            //                     //         title: Text(
            //                     //             'Records have been successfully uploaded'),
            //                     //         content: SingleChildScrollView(
            //                     //           child: ListBody(
            //                     //             children: <Widget>[
            //                     //               Text('Thank you'),
            //                     //             ],
            //                     //           ),
            //                     //         ),
            //                     //         actions: <Widget>[
            //                     //           FlatButton(
            //                     //             child: Text('Ok'),
            //                     //             onPressed: () {
            //                     //               // Navigator.of(context).push(
            //                     //               //     new MaterialPageRoute(
            //                     //               //         builder: (BuildContext
            //                     //               //         context) =>
            //                     //               //            );
            //                     //             },
            //                     //           ),
            //                     //         ],
            //                     //       );
            //                     //     },
            //                     //   );
            //                     // });
            //                   });
            //                 },
            //                 child: Text(
            //                   'Submit',
            //                   textAlign: TextAlign.left,
            //                   style: TextStyle(color: Colors.black),
            //                 ),
            //               ),
            //             ))),
            //   ],
            // ),
          ],
        ),
      ),


      bottomNavigationBar: BottomAppBar(
        child: Container(
            height: 50,
            child: Row(children: <Widget>[
              SizedBox(width: 20),
              LinearPercentIndicator(
                width: 250.0,
                animation: true,
                animationDuration: 1000,
                lineHeight: 20.0,
                leading: new Text("     Total Hours",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                percent: progress,
                center: Text("$totalValue hours",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                linearStrokeCap: LinearStrokeCap.butt,
                progressColor: Colors.green,
              ),
              SizedBox(width: 20),
            ])),
        color: Colors.purple[900],
      ),
    );
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
