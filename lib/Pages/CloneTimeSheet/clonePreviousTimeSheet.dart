
import 'package:fit_timesheets/Pages/CloneTimeSheet/saveCloneTimesheet.dart';
import 'package:fit_timesheets/Pages/TimeSheet/timesheetMainPage.dart';
import 'package:fit_timesheets/models/clone/clonegetDetails.dart';
import 'package:fit_timesheets/models/create.dart';
import 'package:fit_timesheets/models/getTimeSheet/getDetails.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../TimeSheet/TimeSheetList.dart';
import '../editTimeSheet.dart';

DateTime today = DateTime.now();
String sunDate2 =
DateFormat('yyyyMMdd').format(findLastDateOfTheWeek(today));
const Color mainColor = Color(0xFF796A9D);

class CloneTimesheet extends StatefulWidget {
  final String clonedDate;
  const CloneTimesheet({Key key, this.clonedDate}) : super(key: key);

  @override
  CloneTimesheetState createState() => CloneTimesheetState(clonedDate);
}

class CloneTimesheetState extends State<CloneTimesheet> {
  final String clonedDate;
  CloneTimesheetState(this.clonedDate);
  bool checkedComment = true;

  bool monCheck = true;

  bool tuesCheck = true;
  bool wedCheck = true;
  bool thursCheck = true;
  bool friCheck = true;
  bool satCheck = true;
  bool sunCheck = true;

  Create createModel = Create();
  GetTimeSheet getTimeSheetModel=GetTimeSheet();
  bool monCheckComment = true;
  bool tuesCheckComment = true;
  bool wedCheckComment = true;
  bool thursCheckComment = true;
  bool friCheckComment = true;
  bool satCheckComment = true;
  bool sunCheckComment = true;




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

  TextEditingController _activityid = TextEditingController();
  TextEditingController _activityname = TextEditingController();
  TextEditingController _subprojid = TextEditingController();
  TextEditingController _subprojname = TextEditingController();
  TextEditingController _projname = TextEditingController();
  TextEditingController _projid = TextEditingController();



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
    String apiCloneDate=clonedDate.substring(6,10)+clonedDate.substring(3,5)+
        clonedDate.substring(0,2);
    DateTime today = DateTime.now();
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

    List<DateTime> betweenDates = getDaysInBeteween(
        findFirstDateOfTheWeek(today), findLastDateOfTheWeek(today));
   String apiDate = DateFormat('yyyyMMdd').format(findLastDateOfTheWeek(today));
    String tuesDate = DateFormat('dd-MM-yyyy').format(betweenDates[1]);

    String wedDate = DateFormat('dd-MM-yyyy').format(betweenDates[2]);
    String thursDate = DateFormat('dd-MM-yyyy').format(betweenDates[3]);
    String friDate = DateFormat('dd-MM-yyyy').format(betweenDates[4]);
    String satDate = DateFormat('dd-MM-yyyy').format(betweenDates[5]);

     getHttp2(
        'timesheet/getScreen?screenName=SM002&enddate=$apiDate&cloneFromDate=$apiCloneDate&mode=clone')
        .then((apiValue) {

      setState(() {
       getTimeSheetModel= GetTimeSheet.fromJson(apiValue);
      });
    });

    int length = 0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        title: Text(
          'Clone TimeSheet',
          style: TextStyle(
              fontFamily: "Lobster-Regular",fontSize: 25,
              color: Colors.white,  fontWeight: FontWeight.bold),
        ),

      ),
      body:

            Column(
              children:<Widget> [
                Flexible(


                  child: Scrollbar(
                      isAlwaysShown: true,

                      //  controller: _scrollController,
                      child: ListView.builder(
                          itemCount:
                          getTimeSheetModel.body.screenData.timesheetData.length,
                          itemBuilder: (context, int position) {
                            int mon ;
                            var sumMon = 0;
                            var sing;
                            sing=getTimeSheetModel.body.screenData
                                .timesheetData[position].manHours0;
                            mon=int.parse(sing[0]);
                            for (var i = 0; i <= 2;) {
                              sumMon += mon;
                              //  sumTues += tues;

                            }
                            print("jjii$sumMon");
                            // if (getTimeSheetModel.body.screenData
                            //     .timesheetData[position].manHours0 ==
                            //     null) {
                            //   getTimeSheetModel.body.screenData.timesheetData[position]
                            //       .manHours0 = '0';
                            //   mon.add( int.parse(getTimeSheetModel
                            //       .body.screenData.timesheetData[position].manHours0));
                            // } else {
                            //   getTimeSheetModel.body.screenData.timesheetData[position]
                            //       .manHours0 =
                            //   "${getTimeSheetModel.body.screenData.timesheetData[position].manHours0}";
                            //   mon.add( int.parse(getTimeSheetModel
                            //       .body.screenData.timesheetData[position].manHours0));
                            // }


                          //  print('hello $mon');



                            _projid.text=getTimeSheetModel.body.screenData.timesheetData[position].projectid;
                            _projname.text=getTimeSheetModel.body.screenData.timesheetData[position].projectname;
                            _subprojid.text=getTimeSheetModel.body.screenData.timesheetData[position].subprojectid;
                            _subprojname.text=getTimeSheetModel.body.screenData.timesheetData[position].subprojectname;
                            _activityid.text=getTimeSheetModel.body.screenData.timesheetData[position].activityid;
                            _activityname.text=getTimeSheetModel.body.screenData.timesheetData[position].activityname;


                            if(  getTimeSheetModel.body.screenData.timesheetData[position].manHours0==null){
                              getTimeSheetModel.body.screenData.timesheetData[position].manHours0='0';
                            }
                            if(  getTimeSheetModel.body.screenData.timesheetData[position].manHours1==null){
                              getTimeSheetModel.body.screenData.timesheetData[position].manHours1='0';
                            }
                            if(  getTimeSheetModel.body.screenData.timesheetData[position].manHours2==null){
                              getTimeSheetModel.body.screenData.timesheetData[position].manHours2='0';
                            }
                            if(  getTimeSheetModel.body.screenData.timesheetData[position].manHours3==null){
                              getTimeSheetModel.body.screenData.timesheetData[position].manHours3='0';
                            }
                            if(  getTimeSheetModel.body.screenData.timesheetData[position].manHours4==null){
                              getTimeSheetModel.body.screenData.timesheetData[position].manHours4='0';
                            }
                            if(  getTimeSheetModel.body.screenData.timesheetData[position].manHours5==null){
                              getTimeSheetModel.body.screenData.timesheetData[position].manHours5='0';
                            }
                            if(  getTimeSheetModel.body.screenData.timesheetData[position].manHours6==null){
                              getTimeSheetModel.body.screenData.timesheetData[position].manHours6='0';
                            }



                            if(  getTimeSheetModel.body.screenData.timesheetData[position].manHours6=='0'){
                             _sunday.text=null;
                            }
                            else{
                              _sunday.text=getTimeSheetModel.body.screenData.timesheetData[position].manHours6;
                            }
                            if(  getTimeSheetModel.body.screenData.timesheetData[position].manHours5=='0'){
                              _saturday.text=null;
                            }
                            else{
                              _sunday.text=getTimeSheetModel.body.screenData.timesheetData[position].manHours5;
                            }
                            if(  getTimeSheetModel.body.screenData.timesheetData[position].manHours4=='0'){
                              _friday.text=null;
                            }
                            else{
                              _sunday.text=getTimeSheetModel.body.screenData.timesheetData[position].manHours4;
                            }
                            if(  getTimeSheetModel.body.screenData.timesheetData[position].manHours3=='0'){
                              _thursday.text=null;
                            }
                            else{
                              _sunday.text=getTimeSheetModel.body.screenData.timesheetData[position].manHours3;
                            }
                            if(  getTimeSheetModel.body.screenData.timesheetData[position].manHours2=='0'){
                              _wednesday.text=null;
                            }
                            else{
                              _sunday.text=getTimeSheetModel.body.screenData.timesheetData[position].manHours2;
                            }
                            if(  getTimeSheetModel.body.screenData.timesheetData[position].manHours1=='0'){
                              _tuesday.text=null;
                            }
                            else{
                              _sunday.text=getTimeSheetModel.body.screenData.timesheetData[position].manHours1;
                            }
                            if(  getTimeSheetModel.body.screenData.timesheetData[position].manHours0=='0'){
                              _monday.text=null;
                            }
                            else{
                              _sunday.text=getTimeSheetModel.body.screenData.timesheetData[position].manHours0;
                            }

                            createModel.screenObject.manHours6=getTimeSheetModel.body.screenData.timesheetData[position].manHours6;
                            createModel.screenObject.manHours5=getTimeSheetModel.body.screenData.timesheetData[position].manHours5;
                            createModel.screenObject.manHours4=getTimeSheetModel.body.screenData.timesheetData[position].manHours4;
                            createModel.screenObject.manHours3=getTimeSheetModel.body.screenData.timesheetData[position].manHours3;
                            createModel.screenObject.manHours2=getTimeSheetModel.body.screenData.timesheetData[position].manHours2;
                            createModel.screenObject.manHours1=getTimeSheetModel.body.screenData.timesheetData[position].manHours1;
                            createModel.screenObject.manHours0=getTimeSheetModel.body.screenData.timesheetData[position].manHours0;



                            return Column(
                              children: [
                                Container(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SaveCloneTimeSheet(
                                                getTimeSheetModel: getTimeSheetModel.body.screenData.timesheetData[position]),
                                          ),
                                        );

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
                                                              '${getTimeSheetModel.body.screenData.timesheetData[position].activityid}' +
                                                                  '-${getTimeSheetModel.body.screenData.timesheetData[position].activityname}',
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
                                                              '${getTimeSheetModel.body.screenData.timesheetData[position].subprojectid}' +
                                                                  '-${getTimeSheetModel.body.screenData.timesheetData[position].subprojectname}',
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
                                                              '${getTimeSheetModel.body.screenData.timesheetData[position].projectid}' +
                                                                  '-${getTimeSheetModel.body.screenData.timesheetData[position].projectname}',
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
                                                                        initialValue: '${getTimeSheetModel.body.screenData.timesheetData[position].manHours0}',
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
                                                                        initialValue: '${getTimeSheetModel.body.screenData.timesheetData[position].manHours1}',

                                                                        enabled: false,
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
                                                                        initialValue: '${getTimeSheetModel.body.screenData.timesheetData[position].manHours2}',

                                                                        enabled: false,

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
                                                                        initialValue: '${getTimeSheetModel.body.screenData.timesheetData[position].manHours3}',


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
                                                                        initialValue: '${getTimeSheetModel.body.screenData.timesheetData[position].manHours4}',

                                                                        enabled: false,

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
                                                                        initialValue: '${getTimeSheetModel.body.screenData.timesheetData[position].manHours5}',


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
                                                                        initialValue: '${getTimeSheetModel.body.screenData.timesheetData[position].manHours6}',

                                                                        enabled: false,

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
                                                                if (getTimeSheetModel.body.screenData.timesheetData[
                                                                position]
                                                                    .detail0 ==
                                                                    null) {
                                                                  getTimeSheetModel.body.screenData.timesheetData[
                                                                  position]
                                                                      .detail0 = ' ';
                                                                } else {
                                                                  getTimeSheetModel.body.screenData.timesheetData[
                                                                  position]
                                                                      .detail0 =
                                                                  "${getTimeSheetModel.body.screenData.timesheetData[position].detail0}";
                                                                }
                                                                if (getTimeSheetModel.body.screenData.timesheetData[
                                                                position]
                                                                    .detail1 ==
                                                                    null) {
                                                                  getTimeSheetModel.body.screenData.timesheetData[
                                                                  position]
                                                                      .detail1 = ' ';
                                                                } else {
                                                                  getTimeSheetModel.body.screenData.timesheetData[
                                                                  position]
                                                                      .detail1 =
                                                                  "${getTimeSheetModel.body.screenData.timesheetData[position].detail1}";
                                                                }
                                                                if (getTimeSheetModel.body.screenData.timesheetData[
                                                                position]
                                                                    .detail2 ==
                                                                    null) {
                                                                  getTimeSheetModel.body.screenData.timesheetData[
                                                                  position]
                                                                      .detail2 = ' ';
                                                                } else {
                                                                  getTimeSheetModel.body.screenData.timesheetData[
                                                                  position]
                                                                      .detail2 =
                                                                  "${getTimeSheetModel.body.screenData.timesheetData[position].detail2}";
                                                                }
                                                                if (getTimeSheetModel.body.screenData.timesheetData[
                                                                position]
                                                                    .detail3 ==
                                                                    null) {
                                                                  getTimeSheetModel.body.screenData.timesheetData[
                                                                  position]
                                                                      .detail3 = ' ';
                                                                } else {
                                                                  getTimeSheetModel.body.screenData.timesheetData[
                                                                  position]
                                                                      .detail3 =
                                                                  "${getTimeSheetModel.body.screenData.timesheetData[position].detail3}";
                                                                }
                                                                if (getTimeSheetModel.body.screenData.timesheetData[
                                                                position]
                                                                    .detail4 ==
                                                                    null) {
                                                                  getTimeSheetModel.body.screenData.timesheetData[
                                                                  position]
                                                                      .detail4 = ' ';
                                                                } else {
                                                                  getTimeSheetModel.body.screenData.timesheetData[
                                                                  position]
                                                                      .detail4 =
                                                                  "${getTimeSheetModel.body.screenData.timesheetData[position].detail4}";
                                                                }
                                                                if (getTimeSheetModel.body.screenData.timesheetData[
                                                                position]
                                                                    .detail5 ==
                                                                    null) {
                                                                  getTimeSheetModel.body.screenData.timesheetData[
                                                                  position]
                                                                      .detail5 = ' ';
                                                                } else {
                                                                  getTimeSheetModel.body.screenData.timesheetData[
                                                                  position]
                                                                      .detail5 =
                                                                  "${getTimeSheetModel.body.screenData.timesheetData[position].detail5}";
                                                                }
                                                                if (getTimeSheetModel.body.screenData.timesheetData[
                                                                position]
                                                                    .detail6 ==
                                                                    null) {
                                                                  getTimeSheetModel.body.screenData.timesheetData[
                                                                  position]
                                                                      .detail6 = ' ';
                                                                } else {
                                                                  getTimeSheetModel.body.screenData.timesheetData[
                                                                  position]
                                                                      .detail6 =
                                                                  "${getTimeSheetModel.body.screenData.timesheetData[position].detail6}";
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
                                                                                'Monday Comment: ${getTimeSheetModel.body.screenData.timesheetData[position].detail0}'),
                                                                            Text(
                                                                                'Tuesday Comment: ${getTimeSheetModel.body.screenData.timesheetData[position].detail1}'),
                                                                            Text(
                                                                                'Wednesday Comment: ${getTimeSheetModel.body.screenData.timesheetData[position].detail2}'),
                                                                            Text(
                                                                                'Thursday Comment: ${getTimeSheetModel.body.screenData.timesheetData[position].detail3}'),
                                                                            Text(
                                                                                'Friday Comment: ${getTimeSheetModel.body.screenData.timesheetData[position].detail4}'),
                                                                            Text(
                                                                                'Saturday Comment: ${getTimeSheetModel.body.screenData.timesheetData[position].detail5}'),
                                                                            Text(
                                                                                'Sunday Comment: ${getTimeSheetModel.body.screenData.timesheetData[position].detail6}'),
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
                ),


              ],
            ),









    );
  }


}
