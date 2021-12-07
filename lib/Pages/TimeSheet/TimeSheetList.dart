import 'package:fit_timesheets/Pages/Admin/adminDashboard.dart';
import 'package:fit_timesheets/Pages/CloneTimeSheet/clonePreviousTimeSheet.dart';
import 'package:fit_timesheets/Pages/Reimbursement/reimbursementTab.dart';
import 'package:fit_timesheets/Pages/TimeSheet/previosWeekTimeSheet.dart';
import 'package:fit_timesheets/Pages/TimeSheet/timesheetEntry.dart';
import 'package:fit_timesheets/Pages/TimeSheet/timesheetMainPage.dart';
import 'package:fit_timesheets/models/activitiesdropdown.dart';
import 'package:fit_timesheets/models/clone/getDetails.dart';
import 'package:fit_timesheets/models/create.dart';
import 'package:fit_timesheets/models/getTimeSheet/getDetails.dart';
import 'package:fit_timesheets/models/multiOccData.dart';

import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:toast/toast.dart';

import '../Login.dart';
import '../footer.dart';
import '../Manager/managerFirstPage.dart';
import 'edit_delete.dart';

const Color mainColor = Color(0xFF796A9D);

class TimeSheetList extends StatefulWidget {
  @override
  _TimeSheetListState createState() => _TimeSheetListState();
}

String formattedDate2;

class _TimeSheetListState extends State<TimeSheetList> {
  TextEditingController _dateCtl1 = TextEditingController();
  bool checkedComment = true;
  double progress = 0.0;
  bool monCheck = true;
  double all1=0;
  double all2=0;
  double all3=0;
  double all4=0;
  double all5=0;
  double all6=0;
  double all7=0;
  var mond;
  var tuesd;
  var wedn;
  var thursd;
  var frid;
  var satu;
  var sund;


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

  CloneGetTimeSheet cloneModel = CloneGetTimeSheet();
  Activities activityObject = Activities();
  Activities activityModel = Activities();
  bool enabled = false;
  String projectName;
  List<MultiOccData> muliOccDataList = [];
  List<TimesheetCard> timeSheetCard = [];
  String dropdown;
  String cloneDat;

  TextEditingController _monday = TextEditingController();
  TextEditingController _tuesday = TextEditingController();
  TextEditingController _wednesday = TextEditingController();
  TextEditingController _thursday = TextEditingController();
  TextEditingController _friday = TextEditingController();
  TextEditingController _saturday = TextEditingController();
  TextEditingController _sunday = TextEditingController();
  double totalValue = 0.0;
  DateTime today = DateTime.now();
  String apiDate;

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

  int length = 0;

  DateTime currentDate = DateTime.now();
  DateTime date1 = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    DateTime newDateTime = await showRoundedDatePicker(
        context: context,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        styleDatePicker: MaterialRoundedDatePickerStyle(
          textStyleDayButton: TextStyle(fontSize: 36, color: Colors.white),
          textStyleYearButton: TextStyle(
            fontSize: 52,
            color: Colors.white,
          ),
          textStyleDayHeader: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
          textStyleCurrentDayOnCalendar: TextStyle(
              fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
          textStyleDayOnCalendar: TextStyle(fontSize: 28, color: Colors.white),
          textStyleDayOnCalendarSelected: TextStyle(
              fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
          textStyleDayOnCalendarDisabled:
              TextStyle(fontSize: 28, color: Colors.white.withOpacity(0.1)),
          textStyleMonthYearHeader: TextStyle(
              fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
          paddingDatePicker: EdgeInsets.all(0),
          paddingMonthHeader: EdgeInsets.all(32),
          paddingActionBar: EdgeInsets.all(16),
          paddingDateYearHeader: EdgeInsets.all(32),
          sizeArrow: 50,
          colorArrowNext: Colors.white,
          colorArrowPrevious: Colors.white,
          marginLeftArrowPrevious: 16,
          marginTopArrowPrevious: 16,
          marginTopArrowNext: 16,
          marginRightArrowNext: 32,
          textStyleButtonAction: TextStyle(fontSize: 28, color: Colors.white),
          textStyleButtonPositive: TextStyle(
              fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          textStyleButtonNegative:
              TextStyle(fontSize: 28, color: Colors.white.withOpacity(0.5)),
          decorationDateSelected:
              BoxDecoration(color: Colors.orange[600], shape: BoxShape.circle),
          backgroundPicker: Colors.deepPurple[400],
          backgroundActionBar: Colors.deepPurple[300],
          backgroundHeaderMonth: Colors.deepPurple[300],
        ),
        styleYearPicker: MaterialRoundedYearPickerStyle(
          textStyleYear: TextStyle(fontSize: 40, color: Colors.white),
          textStyleYearSelected: TextStyle(
              fontSize: 56, color: Colors.white, fontWeight: FontWeight.bold),
          heightYearRow: 100,
          backgroundPicker: Colors.deepPurple[400],
        ));
    if (newDateTime != null && newDateTime != currentDate) {
      setState(() {
        setState(() {
          currentDate = newDateTime;
          // _dateCtl2=currentDate as TextEditingController;

          date1 = currentDate;
          String formattedDate = DateFormat('dd-MM-yyyy').format(currentDate);
          _dateCtl1.text = formattedDate;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String monDate =
        DateFormat('dd-MM-yyyy').format(findFirstDateOfTheWeek(today));
    String sunDate =
        DateFormat('dd-MM-yyyy').format(findLastDateOfTheWeek(today));

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

    apiDate = DateFormat('yyyyMMdd').format(findLastDateOfTheWeek(today));
    List<DateTime> betweenDates = getDaysInBeteween(
        findFirstDateOfTheWeek(today), findLastDateOfTheWeek(today));

    String tuesDate = DateFormat('dd-MM-yyyy').format(betweenDates[1]);

    String wedDate = DateFormat('dd-MM-yyyy').format(betweenDates[2]);
    String thursDate = DateFormat('dd-MM-yyyy').format(betweenDates[3]);
    String friDate = DateFormat('dd-MM-yyyy').format(betweenDates[4]);
    String satDate = DateFormat('dd-MM-yyyy').format(betweenDates[5]);

    getHttp2(
            'timesheetapiuat/timesheet/getScreen?screenName=S0004&language =E&firstTime=true&pageNum=0&pageSize=20&enddate=${apiDate}&searchCriteria=projectname')
        .then((apiValue) {
      setState(() {
        activityObject = Activities.fromJson(apiValue);
      });
    });

    getHttp2(
            'timesheetapiuat/timesheet/getScreen?screenName=S0003&language =E&mode=display&enddate=${apiDate}')
        .then((apiValue) {


      setState(() {
        getTimeSheetModel = GetTimeSheet.fromJson(apiValue);
      });
    });
    getHttp2(
        'timesheetapiuat/timesheet/getScreen?screenName=SM002&enddate=20210801&mode=display')
        .then((apiValue) {


      setState(() {
        cloneModel = CloneGetTimeSheet.fromJson(apiValue);
      });
    });

    SpeedDial buildSpeedDial() {
      return SpeedDial(
        marginEnd: 18,
        marginBottom: 20,
        iconTheme: new IconThemeData(color: Colors.cyanAccent),
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

            backgroundColor: Colors.blueGrey,
            label: 'Add Entry',
            labelStyle: TextStyle(fontSize: 18.0,color:Colors.white),
            labelBackgroundColor: Colors.blueGrey,
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => TimeSheetForm()));
            },
            // onLongPress: () => print('FIRST CHILD LONG PRESS'),
          ),
          if(getTimeSheetModel.body.screenData.statusdesc!='Submitted')
          SpeedDialChild(
            child: Icon(Icons.skip_previous_outlined,
                color: Colors.lightGreenAccent),
            backgroundColor: Colors.blueGrey,
            label: 'Clone Previous Timesheet',
            labelStyle: TextStyle(fontSize: 18.0,color: Colors.white),
            labelBackgroundColor: Colors.blueGrey,
            onTap: () {
              setState(() {
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
                      Text('Select Clone Date'),
                      content:
                      Container(
                        height: 500,
                        width: 300,
                        child: SingleChildScrollView(
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SearchableDropdown.single(
                                    // underline: Colors.pink,
                                    menuBackgroundColor: Colors.white60,

                                    items: <String>[
                                      for (length = 0;
                                      length <
                                          cloneModel.body.screenData.cloneDates.length -
                                              1;
                                      length++)
                                        cloneModel.body.screenData.cloneDates[length].substring(6,8) +'/'+
                                            cloneModel.body.screenData.cloneDates[length].substring(4,6)+'/'+
                                            cloneModel.body.screenData.cloneDates[length].substring(0,4)
                                    ].map<DropdownMenuItem<String>>(

                                            (String value) {
                                          return DropdownMenuItem<String>(

                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.black,fontSize: 16),
                                            ),
                                          );
                                        }).toList(),
                                    value: dropdown,
                                    hint: "Select Clone date",style: TextStyle(color: Colors.black),
                                    searchHint: "Search Clone date",
                                    onChanged: (value) {
                                      setState(() {
                                        dropdown = value;
                                      });
                                    },
                                    iconEnabledColor: Colors.red,
                                    dialogBox: false,
                                    isExpanded: true,
                                    menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
                                  ),


                                ])
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child:
                          Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(
                                context);
                          },
                        ),
                        FlatButton(
                          child:
                          Text('OK'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CloneTimesheet(
                                    clonedDate:dropdown),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              });

          })
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        title: Text(
          'TimeSheet',
          style: TextStyle(fontFamily: "Lobster-Regular",
              color: Colors.white, fontSize: 25,),
        ),
        leading: IconButton(
          tooltip: 'Menu bar',
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              showMenu();
            });
          },
        ),
      ),
      body: Column(
        children: [
          Text(
            '\nStatus: ${getTimeSheetModel.body.screenData.statusdesc}',
            style: TextStyle(fontFamily: "DancingScript-VariableFont_wght",fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Flexible(
            child: Scrollbar(
                isAlwaysShown: true,
                //  controller: _scrollController,
                child: ListView.builder(
                    itemCount:
                        getTimeSheetModel.body.screenData.multiOccData.length,
                    itemBuilder: (context, int position) {






                      if (getTimeSheetModel.body.screenData
                              .multiOccData[position].manHours0 ==
                          null) {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                            .manHours0 = '0';
                       } else {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                            .manHours0 =
                        "${getTimeSheetModel.body.screenData
                            .multiOccData[position].manHours0}";
                      }
                      if (getTimeSheetModel.body.screenData
                          .multiOccData[position].manHours1 ==
                          null) {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                            .manHours1 = '0';
                      } else {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                            .manHours1 =
                        "${getTimeSheetModel.body.screenData.multiOccData[position].manHours1}";
                      }

                      if (getTimeSheetModel.body.screenData
                              .multiOccData[position].manHours2 ==
                          null) {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                            .manHours2 = '0';
                      } else {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                                .manHours2 =
                            "${getTimeSheetModel.body.screenData.multiOccData[position].manHours2}";
                      }
                      if (getTimeSheetModel.body.screenData
                              .multiOccData[position].manHours3 ==
                          null) {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                            .manHours3 = '0';
                      } else {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                                .manHours3 =
                            "${getTimeSheetModel.body.screenData.multiOccData[position].manHours3}";
                     }
                      if (getTimeSheetModel.body.screenData
                              .multiOccData[position].manHours4 ==
                          null) {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                            .manHours4 = '0';

                     } else {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                                .manHours4 =
                            "${getTimeSheetModel.body.screenData.multiOccData[position].manHours4}";
                     }
                      if (getTimeSheetModel.body.screenData
                              .multiOccData[position].manHours5 ==
                          null) {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                            .manHours5 = '0';

                      } else {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                                .manHours5 =
                            "${getTimeSheetModel.body.screenData.multiOccData[position].manHours5}";
                     }
                      if (getTimeSheetModel.body.screenData
                              .multiOccData[position].manHours6 ==
                          null) {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                            .manHours6 = '0';
                       } else {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                                .manHours6 =
                            "${getTimeSheetModel.body.screenData.multiOccData[position].manHours6}";
                      } // Setting the

                      if (getTimeSheetModel
                              .body.screenData.multiOccData[position].detail0 ==
                          null) {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                            .detail0 = ' ';
                      } else {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                                .detail0 =
                            "${getTimeSheetModel.body.screenData.multiOccData[position].detail0}";
                      }
                      if (getTimeSheetModel
                              .body.screenData.multiOccData[position].detail1 ==
                          null) {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                            .detail1 = ' ';
                      } else {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                                .detail1 =
                            "${getTimeSheetModel.body.screenData.multiOccData[position].detail1}";
                      }
                      if (getTimeSheetModel
                              .body.screenData.multiOccData[position].detail2 ==
                          null) {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                            .detail2 = ' ';
                      } else {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                                .detail2 =
                            "${getTimeSheetModel.body.screenData.multiOccData[position].detail2}";
                      }
                      if (getTimeSheetModel
                              .body.screenData.multiOccData[position].detail3 ==
                          null) {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                            .detail3 = ' ';
                      } else {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                                .detail3 =
                            "${getTimeSheetModel.body.screenData.multiOccData[position].detail3}";
                      }
                      if (getTimeSheetModel
                              .body.screenData.multiOccData[position].detail4 ==
                          null) {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                            .detail4 = ' ';
                      } else {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                                .detail4 =
                            "${getTimeSheetModel.body.screenData.multiOccData[position].detail4}";
                      }
                      if (getTimeSheetModel
                              .body.screenData.multiOccData[position].detail5 ==
                          null) {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                            .detail5 = ' ';
                      } else {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                                .detail5 =
                            "${getTimeSheetModel.body.screenData.multiOccData[position].detail5}";
                      }
                      if (getTimeSheetModel
                              .body.screenData.multiOccData[position].detail6 ==
                          null) {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                            .detail6 = ' ';
                      } else {
                        getTimeSheetModel.body.screenData.multiOccData[position]
                                .detail6 =
                            "${getTimeSheetModel.body.screenData.multiOccData[position].detail6}";
                      }











                      createModel.screenObject.manHours0 = getTimeSheetModel
                          .body.screenData.multiOccData[position].manHours0;

                      createModel.screenObject.manHours1 = getTimeSheetModel
                          .body.screenData.multiOccData[position].manHours1;

                      createModel.screenObject.manHours2 = getTimeSheetModel
                          .body.screenData.multiOccData[position].manHours2;

                      createModel.screenObject.manHours3 = getTimeSheetModel
                          .body.screenData.multiOccData[position].manHours3;

                      createModel.screenObject.manHours4 = getTimeSheetModel
                          .body.screenData.multiOccData[position].manHours4;

                      createModel.screenObject.manHours5 = getTimeSheetModel
                          .body.screenData.multiOccData[position].manHours5;

                      createModel.screenObject.manHours6 = getTimeSheetModel
                          .body.screenData.multiOccData[position].manHours6;

                      createModel.screenObject.detail0 = getTimeSheetModel
                          .body.screenData.multiOccData[position].detail0;

                      createModel.screenObject.detail1 = getTimeSheetModel
                          .body.screenData.multiOccData[position].detail1;

                      createModel.screenObject.detail2 = getTimeSheetModel
                          .body.screenData.multiOccData[position].detail2;

                      createModel.screenObject.detail3 = getTimeSheetModel
                          .body.screenData.multiOccData[position].detail3;

                      createModel.screenObject.detail4 = getTimeSheetModel
                          .body.screenData.multiOccData[position].detail4;

                      createModel.screenObject.detail5 = getTimeSheetModel
                          .body.screenData.multiOccData[position].detail5;

                      createModel.screenObject.detail6 = getTimeSheetModel
                          .body.screenData.multiOccData[position].detail6;


                      //
                      // getTimeSheetModel
                      //     .body.screenData.multiOccData.forEach((element) => print(element));
                      // for(int i=0;i<=getTimeSheetModel
                      //     .body.screenData.multiOccData.length;){
                      //   mond=double.parse(getTimeSheetModel.body.screenData
                      //       .multiOccData[position].manHours0).toDouble();
                      //
                      // }
                      // all1+=mond;
                      // print('final total value=$all1');
                      // //  totalValue=(all1+all2+all3+all4+all5+all6+all7);
                      // double total = totalValue;
                      //
                      // if (total >= 45) {
                      //   progress = 1.0;
                      // } else if (total >= 36) {
                      //   progress = 0.8;
                      // } else if (total >= 27) {
                      //   progress = 0.6;
                      // } else if (total >= 18) {
                      //   progress = 0.4;
                      // } else if (total >= 9) {
                      //   progress = 0.2;
                      // } else if (total >= 0) {
                      //   progress = 0.1;
                      // }


                      return Column(
                        children: [
                          Container(
                              child: InkWell(
                            onTap: () {
                              if (getTimeSheetModel
                                      .body.screenData.statusdesc !=
                                  'Submitted') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditForm(
                                        getTimeSheetModel: getTimeSheetModel
                                            .body
                                            .screenData
                                            .multiOccData[position]),
                                  ),
                                );
                              } else {
                                Toast.show(
                                    "Submitted timesheet cant be modified",
                                    context,
                                    duration: Toast.LENGTH_LONG,
                                    gravity: Toast.BOTTOM);
                              }
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
                                                        fontFamily: "DancingScript-VariableFont_wght",fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                            BorderRadius
                                                                .circular(25.0),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.purple,
                                                            width: 1.5),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.purple,
                                                            width: 1.5),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
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
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                    primaryColor:
                                                        Colors.redAccent,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Theme(
                                                  child: TextFormField(
                                                    enabled: false,
                                                    style: TextStyle(
                                                        fontFamily: "DancingScript-VariableFont_wght",fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                            BorderRadius
                                                                .circular(25.0),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.purple,
                                                            width: 1.5),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.purple,
                                                            width: 1.5),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
                                                      ),
                                                      labelText:
                                                          'Sub-project id and Name',
                                                      labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      hintText:
                                                          'Sub-project id and Name',
                                                      prefixIcon: const Icon(
                                                        Icons
                                                            .supervised_user_circle,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ),
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                    primaryColor:
                                                        Colors.redAccent,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Theme(
                                                  child: TextFormField(
                                                    enabled: false,
                                                    style: TextStyle(
                                                        fontFamily: "DancingScript-VariableFont_wght",fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                            BorderRadius
                                                                .circular(25.0),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.purple,
                                                            width: 1.5),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.purple,
                                                            width: 1.5),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
                                                      ),
                                                      labelText:
                                                          'Project id and Name',
                                                      labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      hintText:
                                                          'Project id and Name',
                                                      prefixIcon: const Icon(
                                                        Icons.layers,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ),
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                    primaryColor:
                                                        Colors.redAccent,
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
                                                              initialValue:
                                                                  '${getTimeSheetModel.body.screenData.multiOccData[position].manHours0}',
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
                                                              initialValue:
                                                                  '${getTimeSheetModel.body.screenData.multiOccData[position].manHours1}',

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
                                                              initialValue:
                                                                  '${getTimeSheetModel.body.screenData.multiOccData[position].manHours2}',

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
                                                            height: 45,
                                                            // margin: const EdgeInsets.only(right: 100, left: 100),
                                                            width: 71,

                                                            child:
                                                                TextFormField(
                                                              enabled: false,
                                                              initialValue:
                                                                  '${getTimeSheetModel.body.screenData.multiOccData[position].manHours3}',

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
                                                              //controller: _thursday,
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
                                                              initialValue:
                                                                  '${getTimeSheetModel.body.screenData.multiOccData[position].manHours4}',

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
                                                              //  controller: _friday,
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
                                                              initialValue:
                                                                  '${getTimeSheetModel.body.screenData.multiOccData[position].manHours5}',

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
                                                              //  controller: _saturday,
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
                                                              initialValue:
                                                                  '${getTimeSheetModel.body.screenData.multiOccData[position].manHours6}',

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
                                        SizedBox(
                                          height: 20,
                                        ),

                                      ],
                                    ),
                                  )),
                            ),
                          )),

                        ],
                      );
                    })),
          ),  if (
          getTimeSheetModel.body.screenData
              .statusdesc !=
              'Approved'&&getTimeSheetModel.body.screenData
              .statusdesc !=
              'Submitted')
            Container(
              child: FlatButton(
                color: Colors.blue[700],
                onPressed: () {
                  setState(() {
                    createModel.screenName =
                    'S0003';
                    createModel.language = 'E';
                    createModel.mode = 'submit';
                    createModel.screenObject
                        .enddate = '$apiDate';

                    postHttp(
                        'timesheet/updateScreen',
                        createModel)
                        .then((value) {
                      if(value['status']=='SUCCESS') {
                        FlutterRingtonePlayer
                            .playNotification();

                        return showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          // user must tap button!
                          builder: (BuildContext
                          context) {
                            return AlertDialog(
                              backgroundColor:
                              Colors.grey[350],
                              title: Text(
                                  'Successfully Submitted'),
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
                                  child: Text(
                                      'Ok'),
                                  onPressed: () {
                                    Navigator.of(
                                        context)
                                        .push(
                                        new MaterialPageRoute(
                                            builder:
                                                (
                                                BuildContext context) =>
                                                TimeSheetList()));
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                      else if(value['status']!='SUCCESS'){
                        Toast.show("Something went wrong,please try again", context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

                      }
                    });
                  });
                },
                child: Text(
                  'Submit',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight:
                      FontWeight.bold),
                ),
              ),
            )

        ],
      ),

      floatingActionButton: buildSpeedDial(),

      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //       height: 50,
      //       child: Row(children: <Widget>[
      //         SizedBox(width: 20),
      //
      //         LinearPercentIndicator(
      //
      //           width: 250.0,
      //           animation: true,
      //           animationDuration: 1000,
      //           lineHeight: 20.0,
      //           leading: new Text("     Total Hours",
      //               style: TextStyle(
      //                   fontSize: 15.0,
      //                   color: Colors.white,
      //                   fontWeight: FontWeight.bold)),
      //           percent: progress,
      //           center: Text("$totalValue hours",
      //               style: TextStyle(
      //                   fontSize: 15.0,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold)),
      //           linearStrokeCap: LinearStrokeCap.butt,
      //           progressColor: Colors.green,
      //         ),
      //         SizedBox(width: 20),
      //       ])),
      //   color: Colors.purple[900],
      // ),
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

  showMenu() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              color: Color(0xff232f34),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 36,
                  color: Colors.purple[900],
                ),
                SizedBox(
                    height: (56 * 6).toDouble(),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: Colors.purple[800],
                        ),
                        child: Stack(
                          alignment: Alignment(0, 0),
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Positioned(
                              top: -36,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        color: Colors.white60, width: 10)),
                                child: Center(
                                  child: ClipOval(
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/fitlogo.jpg'),
                                      height: 36,
                                      width: 36,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      "",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Previous week Timesheet",
                                      style: TextStyle(fontFamily: "Lobster-Regular",fontSize: 20,color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.av_timer_sharp,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      return showDialog<void>(
                                        context: context,
                                        barrierDismissible: false,
                                        // user must tap button!
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.grey[350],
                                            title: Text(
                                                'Select previous week date to continue'),
                                            content: SingleChildScrollView(
                                              child: ListBody(
                                                children: <Widget>[
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          color: Colors
                                                              .purple[900],
                                                          //reimbursement list keela
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10.0),

                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              new Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                      '\n\n\n\n\n'),
                                                                  new Flexible(
                                                                    child:
                                                                        Theme(
                                                                      child:
                                                                          TextField(
                                                                        onTap:
                                                                            () {
                                                                          _selectDate(
                                                                              context);
                                                                        },

                                                                        controller:
                                                                            _dateCtl1,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                        // controller: _amount,
                                                                        keyboardType:
                                                                            TextInputType.number,
                                                                        // cursorColor: mainColor,
                                                                        onChanged:
                                                                            (v) {
                                                                          setState(
                                                                              () {});

                                                                          //  models.amount = double.parse(v);
                                                                          //  models.status="PENDING";
                                                                        },
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelStyle:
                                                                              TextStyle(color: Colors.white),
                                                                          labelText:
                                                                              'Date',
                                                                          hintText:
                                                                              'Previous date',
                                                                          prefixIcon:
                                                                              IconButton(
                                                                            icon:
                                                                                const Icon(
                                                                              Icons.calendar_today_outlined,
                                                                              color: Colors.white,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              _selectDate(context);
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      data: Theme.of(
                                                                              context)
                                                                          .copyWith(
                                                                        primaryColor:
                                                                            Colors.white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              FlatButton(
                                                child: Text('Ok'),
                                                onPressed: () {
                                                  if (DateFormat('EEEE').format(
                                                          currentDate) ==
                                                      'Sunday') {
                                                    Navigator.of(context).push(
                                                        new MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                PreviousWeek(
                                                                    currentDate:
                                                                        currentDate)));
                                                  } else {
                                                    Toast.show(
                                                        "Select a sunday date to continue",
                                                        context,
                                                        duration:
                                                            Toast.LENGTH_LONG,
                                                        gravity: Toast.BOTTOM);
                                                  }
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),ListTile(
                                    title: Text(
                                      "Reimbursement",
                                      style: TextStyle(fontFamily: "Lobster-Regular",fontSize: 20,color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.manage_accounts,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  ReimbursementTabView()));
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Admin",
                                      style: TextStyle(fontFamily: "Lobster-Regular",fontSize: 20,color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  AdminDashBoard()));
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Manager",
                                      style: TextStyle(fontFamily: "Lobster-Regular",fontSize: 20,color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.manage_accounts,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  ManagerFirstPage()));
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Logout",
                                      style: TextStyle(fontFamily: "Lobster-Regular",fontSize: 20,color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.logout,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          PageRouteBuilder(pageBuilder:
                                              (BuildContext context,
                                                  Animation animation,
                                                  Animation
                                                      secondaryAnimation) {
                                            return LoginIn();
                                          }, transitionsBuilder:
                                              (BuildContext context,
                                                  Animation<double> animation,
                                                  Animation<double>
                                                      secondaryAnimation,
                                                  Widget child) {
                                            return new SlideTransition(
                                              position: new Tween<Offset>(
                                                begin: const Offset(1.0, 0.0),
                                                end: Offset.zero,
                                              ).animate(animation),
                                              child: child,
                                            );
                                          }),
                                          (Route route) => false);
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))),
                Container(
                    height: 40,
                    color: Colors.purple[900],
                    child: Center(
                      child: Text(
                        '©FuturaInsTech2021',
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
