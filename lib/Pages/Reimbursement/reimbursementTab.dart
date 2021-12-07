import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:fit_timesheets/Pages/Reimbursement/reimbursementEntry.dart';
import 'package:fit_timesheets/models/reimbursement/delete/deleteinList.dart';
import 'package:fit_timesheets/models/reimbursement/getReimbursement.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import '../Login.dart';
import 'RetrieveList.dart';

class ReimbursementTabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ReimbursementTabViewState();
  }
}
DateTime initial1 =  DateTime(2020 - 01 - 01);

DateTime initial2 = DateTime.now();
String formatInitial1= DateFormat('dd-MM-yyyy').format(initial1);

String formatInitial2= DateFormat('dd-MM-yyyy').format(initial2);

class _ReimbursementTabViewState extends State<ReimbursementTabView> {

  String rolesApprove;

  TextEditingController _dateCtl1 = TextEditingController(text:"$formatInitial1" );
  TextEditingController _dateCtl2 = TextEditingController(text:"$formatInitial2" );
  DateTime date1 = DateTime(2021 - 01 - 01);
  DateTime date2 = DateTime.now();

  convertR(dateGiven) {
    String y = dateGiven.substring(0, 4) +
        dateGiven.substring(5, 7) +
        dateGiven.substring(8, 10);
    var x = int.parse(y);
    return x;
  }

  convertApi(dateGiven) {
    String y = dateGiven.substring(6, 10) +
        dateGiven.substring(3, 5) +
        dateGiven.substring(0, 2);
    var x = int.parse(y);
    return x;
  }
  final ScrollController _scrollController = ScrollController();
  GetReimbursement reimbList=GetReimbursement();
  DeleteReimbInList deleteAll=DeleteReimbInList();
  @override

  Widget build(BuildContext context) {
    getHttp2(
        'timesheetapiuat/timesheet/getScreen?screenName=S0017&language =E&mode=display&pageNum=0&pageSize=5&searchString=PN&searchCriteria=status&firstTime=true')
        .then((apiValue) {
      setState(() {

        reimbList = GetReimbursement.fromJson(apiValue);
      });
    });
    DateTime currentDate =  DateTime(2020 - 01 - 01);

    DateTime currentDate2 = DateTime.now();

    Future<void> _selectDate(BuildContext context) async {
      DateTime newDateTime = await showRoundedDatePicker(
          context: context,
          theme: ThemeData(primarySwatch: Colors.deepPurple),
          styleDatePicker: MaterialRoundedDatePickerStyle(
            textStyleDayButton: TextStyle(fontFamily: "DancingScript-VariableFont_wght",fontSize: 36, color: Colors.white),
            textStyleYearButton: TextStyle(
              fontFamily: "DancingScript-VariableFont_wght",
              fontSize: 52,
              color: Colors.white,
            ),
            textStyleDayHeader: TextStyle(
              fontFamily: "DancingScript-VariableFont_wght",
              fontSize: 24,
              color: Colors.white,
            ),
            textStyleCurrentDayOnCalendar: TextStyle(
                fontFamily: "DancingScript-VariableFont_wght",
                fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
            textStyleDayOnCalendar:
            TextStyle(fontFamily: "DancingScript-VariableFont_wght",fontSize: 28, color: Colors.white),
            textStyleDayOnCalendarSelected: TextStyle(
                fontFamily: "DancingScript-VariableFont_wght",
                fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
            textStyleDayOnCalendarDisabled:
            TextStyle(fontSize: 28, color: Colors.white.withOpacity(0.1)),
            textStyleMonthYearHeader: TextStyle(
                fontFamily: "DancingScript-VariableFont_wght",
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
            textStyleButtonAction: TextStyle(fontFamily: "DancingScript-VariableFont_wght",fontSize: 28, color: Colors.white),
            textStyleButtonPositive: TextStyle(
                fontFamily: "DancingScript-VariableFont_wght",
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
            textStyleButtonNegative:
            TextStyle(fontFamily: "DancingScript-VariableFont_wght",fontSize: 28, color: Colors.white.withOpacity(0.5)),
            decorationDateSelected: BoxDecoration(
                color: Colors.orange[600], shape: BoxShape.circle),
            backgroundPicker: Colors.deepPurple[400],
            backgroundActionBar: Colors.deepPurple[300],
            backgroundHeaderMonth: Colors.deepPurple[300],
          ),
          styleYearPicker: MaterialRoundedYearPickerStyle(
            textStyleYear: TextStyle(fontFamily: "DancingScript-VariableFont_wght",fontSize: 40, color: Colors.white),
            textStyleYearSelected: TextStyle(
                fontFamily: "DancingScript-VariableFont_wght",
                fontSize: 56, color: Colors.white, fontWeight: FontWeight.bold),
            heightYearRow: 100,
            backgroundPicker: Colors.deepPurple[400],
          ));
      if (newDateTime != null && newDateTime != currentDate) {
        setState(() {
          setState(() {
            currentDate = newDateTime;
            // _dateCtl2=currentDate as TextEditingController;

            date1=currentDate;
            String formattedDate =
            DateFormat('dd-MM-yyyy').format(currentDate);
            _dateCtl1.text=formattedDate;
          });



        });
      }
    }
    Future<void> _selectDate2(BuildContext context) async {
      DateTime newDateTime2 = await showRoundedDatePicker(
          context: context,
          theme: ThemeData(primarySwatch: Colors.deepPurple),
          styleDatePicker: MaterialRoundedDatePickerStyle(
            textStyleDayButton: TextStyle(fontFamily: "DancingScript-VariableFont_wght",fontSize: 36, color: Colors.white),
            textStyleYearButton: TextStyle(
              fontFamily: "DancingScript-VariableFont_wght",
              fontSize: 52,
              color: Colors.white,
            ),
            textStyleDayHeader: TextStyle(
              fontFamily: "DancingScript-VariableFont_wght",
              fontSize: 24,
              color: Colors.white,
            ),
            textStyleCurrentDayOnCalendar: TextStyle(
                fontFamily: "DancingScript-VariableFont_wght",
                fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
            textStyleDayOnCalendar:
            TextStyle(fontSize: 28,fontFamily: "DancingScript-VariableFont_wght", color: Colors.white),
            textStyleDayOnCalendarSelected: TextStyle(fontFamily: "DancingScript-VariableFont_wght",

                fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
            textStyleDayOnCalendarDisabled:
            TextStyle(fontFamily: "DancingScript-VariableFont_wght",fontSize: 28, color: Colors.white.withOpacity(0.1)),
            textStyleMonthYearHeader: TextStyle(
                fontFamily: "DancingScript-VariableFont_wght",
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
            textStyleButtonAction: TextStyle(fontFamily: "DancingScript-VariableFont_wght",fontSize: 28, color: Colors.white),
            textStyleButtonPositive: TextStyle(
                fontFamily: "DancingScript-VariableFont_wght",
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
            textStyleButtonNegative:
            TextStyle(fontFamily: "DancingScript-VariableFont_wght",fontSize: 28, color: Colors.white.withOpacity(0.5)),
            decorationDateSelected: BoxDecoration(
                color: Colors.orange[600], shape: BoxShape.circle),
            backgroundPicker: Colors.deepPurple[400],
            backgroundActionBar: Colors.deepPurple[300],
            backgroundHeaderMonth: Colors.deepPurple[300],
          ),
          styleYearPicker: MaterialRoundedYearPickerStyle(
            textStyleYear: TextStyle(fontFamily: "DancingScript-VariableFont_wght",fontSize: 40, color: Colors.white),
            textStyleYearSelected: TextStyle(
                fontFamily: "DancingScript-VariableFont_wght",
                fontSize: 56, color: Colors.white, fontWeight: FontWeight.bold),
            heightYearRow: 100,
            backgroundPicker: Colors.deepPurple[400],
          ));
      if (newDateTime2 != null && newDateTime2 != currentDate2) {
        setState(() {
          currentDate2 = newDateTime2;
          // _dateCtl2=currentDate as TextEditingController;

          date2=currentDate2;

          String formattedDate2 =
          DateFormat('dd-MM-yyyy').format(currentDate2);
          _dateCtl2.text=formattedDate2;

        });
      }
    }


    return Scaffold(

      body: DefaultTabController(
        length: 3,
        child: Scaffold(

          appBar: AppBar(
            centerTitle: true,
            //   leading:
            //   IconButton(
            //   onPressed: showMenu,
            //   icon: Icon(Icons.menu),
            //   color: Colors.white,
            // ),

            automaticallyImplyLeading: false,
            title:Column(
                children: <Widget>[

                  Text(
                    'Reimbursement List',
                    style: TextStyle(
                        fontFamily: "Lobster-Regular",
                        color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                  ),

                ]
            ),





            backgroundColor: Colors.purple[900],
            elevation: 0.0,
          ),
          bottomNavigationBar: bottomNavigationBar,
          body:

          TabBarView(
            children: [
              Column(
                children: <Widget>[

                  Row(
                    children: [

                      Expanded(
                        child: Container(
                          color: Colors.purple[900], //reimbursement list keela
                          padding: EdgeInsets.symmetric(horizontal: 10.0),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[




                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Scrollbar(
                        isAlwaysShown: true,
                        controller: _scrollController,
                        child: ListView.builder(
                            itemCount: reimbList.body.screenData.multiOccData.length,
                            itemBuilder: (context, int position) {
                              String formattedDate =
                              DateFormat('yyyy-MM-dd').format(date1);
                              String formattedToDate =
                              DateFormat('yyyy-MM-dd').format(date2);
                              var dateFromn = convertR(formattedDate);
                              var dateTon = convertR(formattedToDate);

                              return Container(

                                child:  ListTile(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(14),
                                  ),

                                  title: new Row(
                                    children: <Widget>[
                                      Text(
                                        '${reimbList.body.screenData.multiOccData[position].year}'+' '+
                                        '${reimbList.body.screenData.multiOccData[position].month}',
                                        style: TextStyle(
                                            fontFamily: "DancingScript-VariableFont_wght",
                                            fontSize: 20,
                                            fontWeight:
                                            FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        '',
                                        style: TextStyle(
                                            fontFamily: "DancingScript-VariableFont_wght",
                                            fontSize: 1,
                                            fontWeight:
                                            FontWeight.normal,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            RetrieveList(
                                                reimbList: reimbList.body.screenData.multiOccData[position]),
                                      ),
                                    );
                                  },
                                  subtitle:
                                  new Row(
                                      children: <Widget>[

                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          color: Colors.red,
                                          tooltip: 'Delete reimbursement',
                                          onPressed: () {
                                            setState(() {
                                              deleteAll.screenName='S0018';
                                              deleteAll.language='E';
                                              deleteAll.headerMode='delete';
                                              deleteAll.headerFieldMap.year=reimbList.body.screenData.multiOccData[position].year;
                                              deleteAll.headerFieldMap.month=reimbList.body.screenData.multiOccData[position].month;

                                              return showDialog<void>(
                                                context: context,
                                                barrierDismissible: false,
                                                // user must tap button!
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor: Colors.grey[350],
                                                    title: Text(
                                                        'Are you sure to delete this reimbursement?'),
                                                    content: SingleChildScrollView(
                                                      child: ListBody(
                                                        children: <Widget>[

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
                                                        child: Text('Confirm'),
                                                        onPressed: () {
                                                          postHttp('timesheetapiuat/timesheet/updateScreen',
                                                              deleteAll)
                                                              .then((value) {


                                                            print('hell $value');
                                                            return showDialog<void>(
                                                              context: context,
                                                              barrierDismissible: false,
                                                              // user must tap button!
                                                              builder: (BuildContext context) {
                                                                return AlertDialog(
                                                                  backgroundColor: Colors.grey[350],
                                                                  title: Text(
                                                                      'Record is successfully deleted'),
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
                                                                                context) =>
                                                                                    ReimbursementTabView()));
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
                                        ),
                                        if (reimbList.body.screenData.multiOccData[position].status ==
                                            'Pending')
                                          ClipOval(
                                            child: Material(
                                              color: Colors.white, // button color
                                              child: InkWell(
                                                splashColor: Colors.red, // inkwell color
                                                child: SizedBox(width: 30, height: 30, child: Icon(Icons.pending,color: Colors.orange,)),
                                                onTap: () {},
                                              ),
                                            ),
                                          ),
                                        if (reimbList.body.screenData.multiOccData[position].status ==
                                            'approved')
                                          ClipOval(
                                            child: Material(
                                              color: Colors.white, // button color
                                              child: InkWell(
                                                splashColor: Colors.red, // inkwell color
                                                child: SizedBox(width: 30, height: 30, child: Icon(Icons.pending,color: Colors.orange,)),
                                                onTap: () {},
                                              ),
                                            ),
                                          ),
                                        if (reimbList.body.screenData.multiOccData[position].status ==
                                            'rejected')
                                          ClipOval(
                                            child: Material(
                                              color: Colors.white, // button color
                                              child: InkWell(
                                                splashColor: Colors.red, // inkwell color
                                                child: SizedBox(width: 35, height: 35, child: Icon(Icons.assignment_turned_in_rounded,color: Colors.green,)),
                                                onTap: () {},
                                              ),
                                            ),
                                          ),

                                      ]),
                                  trailing:
                                  new Column(children: <Widget>[
                                    new Text("",style: TextStyle(
                                        fontSize: 6,
                                        color: Colors.white),
                                    ),
                                    Text(
                                      '${reimbList.body.screenData.multiOccData[position].approvedBy}'+
                                          '\n${reimbList.body.screenData.multiOccData[position].statusDate}',
                                      style: TextStyle(
                                          fontFamily: "DancingScript-VariableFont_wght",
                                          fontSize: 10,
                                          fontWeight:
                                          FontWeight.normal,
                                          color: Colors.black),
                                    ),

                                    new Text(
                                      '₹ ${reimbList.body.screenData.multiOccData[position].totalAmt}',
                                      style: TextStyle(
                                          fontFamily: "DancingScript-VariableFont_wght",
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),

                                  ]),
                                )



                              );
                            })),
                  ),




                ],

              ),
              Column(
                children: <Widget>[

                  Row(
                    children: [

                      Expanded(
                        child: Container(
                          color: Colors.purple[900], //reimbursement list keela
                          padding: EdgeInsets.symmetric(horizontal: 10.0),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[




                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Scrollbar(
                        isAlwaysShown: true,
                        controller: _scrollController,
                        child: ListView.builder(
                            itemCount: reimbList.body.screenData.multiOccData.length,
                            itemBuilder: (context, int position) {
                              String formattedDate =
                              DateFormat('yyyy-MM-dd').format(date1);
                              String formattedToDate =
                              DateFormat('yyyy-MM-dd').format(date2);
                              var dateFromn = convertR(formattedDate);
                              var dateTon = convertR(formattedToDate);

                              return Container(

                                  child:  ListTile(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(14),
                                    ),

                                    title: new Row(
                                      children: <Widget>[
                                        Text(
                                          '${reimbList.body.screenData.multiOccData[position].year}'+' '+
                                              '${reimbList.body.screenData.multiOccData[position].month}',
                                          style: TextStyle(
                                              fontFamily: "DancingScript-VariableFont_wght",
                                              fontSize: 20,
                                              fontWeight:
                                              FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          '',
                                          style: TextStyle(
                                              fontSize: 1,
                                              fontWeight:
                                              FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         RetrieveList(
                                      //             reimbList: reimbList[
                                      //             position]),
                                      //   ),
                                      // );
                                    },
                                    subtitle:
                                    new Row(
                                        children: <Widget>[

                                          Text('        '),
                                          if (reimbList.body.screenData.multiOccData[position].status ==
                                              'Pending')
                                            ClipOval(
                                              child: Material(
                                                color: Colors.white, // button color
                                                child: InkWell(
                                                  splashColor: Colors.red, // inkwell color
                                                  child: SizedBox(width: 30, height: 30, child: Icon(Icons.pending,color: Colors.orange,)),
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),
                                          if (reimbList.body.screenData.multiOccData[position].status ==
                                              'approved')
                                            ClipOval(
                                              child: Material(
                                                color: Colors.white, // button color
                                                child: InkWell(
                                                  splashColor: Colors.red, // inkwell color
                                                  child: SizedBox(width: 30, height: 30, child: Icon(Icons.pending,color: Colors.orange,)),
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),
                                          if (reimbList.body.screenData.multiOccData[position].status ==
                                              'rejected')
                                            ClipOval(
                                              child: Material(
                                                color: Colors.white, // button color
                                                child: InkWell(
                                                  splashColor: Colors.red, // inkwell color
                                                  child: SizedBox(width: 35, height: 35, child: Icon(Icons.assignment_turned_in_rounded,color: Colors.green,)),
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),

                                        ]),
                                    trailing:
                                    new Column(children: <Widget>[
                                      new Text("",style: TextStyle(
                                          fontSize: 6,
                                          color: Colors.white),
                                      ),
                                      Text(
                                        '${reimbList.body.screenData.multiOccData[position].approvedBy}'+
                                            '\n${reimbList.body.screenData.multiOccData[position].statusDate}',
                                        style: TextStyle(
                                            fontFamily: "DancingScript-VariableFont_wght",
                                            fontSize: 10,
                                            fontWeight:
                                            FontWeight.normal,
                                            color: Colors.black),
                                      ),

                                      new Text(
                                        '₹ ${reimbList.body.screenData.multiOccData[position].totalAmt}',
                                        style: TextStyle(
                                            fontFamily: "DancingScript-VariableFont_wght",
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),

                                    ]),
                                  )



                              );
                            })),
                  ),




                ],

              ),
              Column(
                children: <Widget>[

                  Row(
                    children: [

                      Expanded(
                        child: Container(
                          color: Colors.purple[900], //reimbursement list keela
                          padding: EdgeInsets.symmetric(horizontal: 10.0),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[




                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Scrollbar(
                        isAlwaysShown: true,
                        controller: _scrollController,
                        child: ListView.builder(
                            itemCount: reimbList.body.screenData.multiOccData.length,
                            itemBuilder: (context, int position) {
                              String formattedDate =
                              DateFormat('yyyy-MM-dd').format(date1);
                              String formattedToDate =
                              DateFormat('yyyy-MM-dd').format(date2);
                              var dateFromn = convertR(formattedDate);
                              var dateTon = convertR(formattedToDate);

                              return Container(

                                  child:  ListTile(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(14),
                                    ),

                                    title: new Row(
                                      children: <Widget>[
                                        Text(
                                          '${reimbList.body.screenData.multiOccData[position].year}'+' '+
                                              '${reimbList.body.screenData.multiOccData[position].month}',
                                          style: TextStyle(
                                              fontFamily: "DancingScript-VariableFont_wght",
                                              fontSize: 20,
                                              fontWeight:
                                              FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          '',
                                          style: TextStyle(
                                              fontFamily: "DancingScript-VariableFont_wght",
                                              fontSize: 1,
                                              fontWeight:
                                              FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         RetrieveList(
                                      //             reimbList: reimbList[
                                      //             position]),
                                      //   ),
                                      // );
                                    },
                                    subtitle:
                                    new Row(
                                        children: <Widget>[

                                          Text('        '),
                                          if (reimbList.body.screenData.multiOccData[position].status ==
                                              'Pending')
                                            ClipOval(
                                              child: Material(
                                                color: Colors.white, // button color
                                                child: InkWell(
                                                  splashColor: Colors.red, // inkwell color
                                                  child: SizedBox(width: 30, height: 30, child: Icon(Icons.pending,color: Colors.orange,)),
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),
                                          if (reimbList.body.screenData.multiOccData[position].status ==
                                              'approved')
                                            ClipOval(
                                              child: Material(
                                                color: Colors.white, // button color
                                                child: InkWell(
                                                  splashColor: Colors.red, // inkwell color
                                                  child: SizedBox(width: 30, height: 30, child: Icon(Icons.pending,color: Colors.orange,)),
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),
                                          if (reimbList.body.screenData.multiOccData[position].status ==
                                              'rejected')
                                            ClipOval(
                                              child: Material(
                                                color: Colors.white, // button color
                                                child: InkWell(
                                                  splashColor: Colors.red, // inkwell color
                                                  child: SizedBox(width: 35, height: 35, child: Icon(Icons.assignment_turned_in_rounded,color: Colors.green,)),
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),

                                        ]),
                                    trailing:
                                    new Column(children: <Widget>[
                                      new Text("",style: TextStyle(
                                          fontSize: 6,
                                          color: Colors.white),
                                      ),
                                      Text(
                                        '${reimbList.body.screenData.multiOccData[position].approvedBy}'+
                                            '\n${reimbList.body.screenData.multiOccData[position].statusDate}',
                                        style: TextStyle(
                                            fontFamily: "DancingScript-VariableFont_wght",
                                            fontSize: 10,
                                            fontWeight:
                                            FontWeight.normal,
                                            color: Colors.black),
                                      ),

                                      new Text(
                                        '₹ ${reimbList.body.screenData.multiOccData[position].totalAmt}',
                                        style: TextStyle(
                                            fontFamily: "DancingScript-VariableFont_wght",
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),

                                    ]),
                                  )



                              );
                            })),
                  ),




                ],

              ),
            ],
          ),
          floatingActionButton: Builder(
            builder: (context) => FabCircularMenu(
              //key: fabKey,
              // Cannot be `Alignment.center`
              alignment: Alignment.bottomRight,
              ringColor: Colors.indigoAccent,
              ringDiameter: 500.0,
              ringWidth: 150.0,
              fabSize: 64.0,
              fabElevation: 8.0,
              fabIconBorder: CircleBorder(),
              // Also can use specific color based on wether
              // the menu is open or not:
              fabOpenColor: Colors.blueGrey,
              fabCloseColor: Colors.purple[900],
              // These properties take precedence over fabColor
              fabColor: Colors.white,
              fabOpenIcon: Icon(Icons.menu, color: Colors.white,size: 25,),
              fabCloseIcon: Icon(Icons.close, color: Colors.white),
              fabMargin: const EdgeInsets.all(16.0),
              animationDuration: const Duration(milliseconds: 800),
              animationCurve: Curves.easeInOutCirc,
              onDisplayChange: (isOpen) {

              },
              children: <Widget>[
                RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ReimbursementForm()));
                  },
                  shape: CircleBorder(),
                  padding: const EdgeInsets.all(24.0),
                  child:   RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "         Add \nReimbursement\n         ",style: TextStyle(fontFamily: "DancingScript-VariableFont_wght",color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)
                        ),
                        WidgetSpan(
                          child:   Image(image: AssetImage('assets/images/addreimb.png'),width: 30,height: 30,),

                        ),

                      ],
                    ),
                  ),
                ),

                //if(rolesApprove=='ROLE_ADMIN')

                RawMaterialButton(
                  onPressed: () {
                    return showDialog<void>(
                      context: context,
                      barrierDismissible: false,
                      // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.grey[350],
                          title: Text('Logout'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('Do you want to logout'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Yes'),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                                        Animation secondaryAnimation) {
                                      return LoginIn();
                                    }, transitionsBuilder: (BuildContext context, Animation<double> animation,
                                        Animation<double> secondaryAnimation, Widget child) {
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
                            FlatButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  shape: CircleBorder(),
                  padding: const EdgeInsets.all(24.0),
                  child:  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Logout\n  ",style: TextStyle(fontFamily: "DancingScript-VariableFont_wght",color: Colors.red[900],fontSize: 16,fontWeight: FontWeight.bold)
                        ),
                        WidgetSpan(
                          child:  Image(image: AssetImage('assets/images/logoutt.png'),width: 30,height: 30,),

                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),


    );
  }

}

Widget get bottomNavigationBar {
  return ClipRRect(

    borderRadius: BorderRadius.only(

      topRight: Radius.circular(40),
      topLeft: Radius.circular(40),
    ),
    child:Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0.0, 1.00), //(x,y)
              blurRadius: 4.00,
              color: Colors.grey[100],
              spreadRadius: 1.00),
        ],
      ),
      height: 70,
      child: ClipRRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
          child: Container(
            color: Colors.purple[900],
            child: TabBar(
              labelColor: Colors.lightGreenAccent,
              unselectedLabelColor: Colors.grey,
              indicatorWeight: 5,

              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Colors.lightGreenAccent,
              tabs: [
                Tab(
                  text: "PENDING",
                  icon: Icon(Icons.pending_actions),
                ),
                Tab(
                  text: "SUBMITTED",
                  icon: Icon(Icons.unsubscribe_sharp),
                ),
                Tab(
                  text: "APPROVED",
                  icon: Icon(Icons.assignment_turned_in),
                )
              ],
            ),
          )),
    ),


  );

}