import 'dart:convert';

import 'package:fit_timesheets/Pages/TimeSheet/timesheetMainPage.dart';
import 'package:fit_timesheets/models/activitiesdropdown.dart';
import 'package:fit_timesheets/models/create.dart';
import 'package:fit_timesheets/models/multiOccData.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'footer.dart';
DateTime findFirstDateOfTheWeek(DateTime dateTime) {
  return dateTime.subtract(Duration(days: dateTime.weekday - 1));
}DateTime findLastDateOfTheWeek(DateTime dateTime) {
  return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
}


DateTime today = DateTime.now();
String sunDate2 =
DateFormat('yyyyMMdd').format(findLastDateOfTheWeek(today));
const Color mainColor = Color(0xFF796A9D);

class TimeSheetForm extends StatefulWidget {
  @override
  TimeSheetFormState createState() => TimeSheetFormState();
}

class TimeSheetFormState extends State<TimeSheetForm> {

  Create createModel=Create();
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

  @override
  void initState() {
    super.initState();
    _monday.text = "0";
    _tuesday.text = "0";
    _wednesday.text = "0";
    _thursday.text = "0";
    _friday.text = "0";
    _saturday.text = "0";
    _sunday.text = "0";// Setting the initial value for the field.
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
  @override
  Widget build(BuildContext context) {

    String monDate =
    DateFormat('dd-MM-yyyy').format(findFirstDateOfTheWeek(today));
    String sunDate =
    DateFormat('dd-MM-yyyy').format(findLastDateOfTheWeek(today));
    int currentValue = int.parse(_monday.text)+int.parse(_tuesday.text)+
        int.parse(_wednesday.text)+int.parse(_thursday.text)+int.parse(_friday.text)+int.parse(_saturday.text)
        +int.parse(_sunday.text);
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


    var totalHours=TextEditingController(text:"$currentValue");

    getHttp2(
        'timesheet/getScreen?screenName=S0004&language =E&firstTime=true&pageNum=0&pageSize=1000&enddate=${sunDate2}&searchCriteria=projectname')
        .then((apiValue) {
      activityObject = Activities.fromJson(apiValue);
      setState(() {
      });
    });



    int position=activityObject
        .body
        .screenData
        .multiOccData
        .length;
    List<Widget> entryList=[];

    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TimeSheet Entry ',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[900],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child:  Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).accentColor),
          child: Row(
            children: [
              InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 16,
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                padding:
                EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white),
                child: Text(
                  '3',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  )),
            ],
          ),
        ),
      ),


      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),
    );
  }

}
