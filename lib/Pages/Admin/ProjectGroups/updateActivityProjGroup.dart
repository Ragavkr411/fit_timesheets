import 'package:fit_timesheets/models/admin/projectGroups/activitiesProjGroup.dart';
import 'package:fit_timesheets/models/admin/projectGroups/deleteActivityProjGroup.dart';
import 'package:fit_timesheets/models/admin/projectGroups/updateActivityProjGroup.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';
import 'activities.dart';
import 'addActivityProjGroup.dart';


const Color mainColor = Color(0xFF796A9D);

class UpdateActivityProjList extends StatefulWidget {
  final MultiOccDataRetrieve retrieveObject;

  const UpdateActivityProjList({Key key, this.retrieveObject}) : super(key: key);
  @override
  _UpdateActivityProjListState createState() => _UpdateActivityProjListState(retrieveObject);
}

String formattedDate2;

class _UpdateActivityProjListState extends State<UpdateActivityProjList> {

  final MultiOccDataRetrieve retrieveObject;
  ActivitiesProjGroupModel activityObject = ActivitiesProjGroupModel();
  _UpdateActivityProjListState(this.retrieveObject);
  String buttonText = "Edit";
  DateTime date1,date2;
  TextEditingController _dateCtl = TextEditingController();
  TextEditingController _dateCtl1 = TextEditingController();
  UpdateActivityProjGroup update=UpdateActivityProjGroup();
  DeleteActivityProjGroup delete=DeleteActivityProjGroup();
  @override
  void initState() {
    super.initState();
    // Setting the initial value for the field.
  }
  bool checked = true;
  bool unchecked= true;

  @override
  Widget build(BuildContext context) {


    String endDate= retrieveObject.enddate;

    String finalEndDate=endDate.substring(6,8)+'/'+endDate.substring(4,6)+'/'+endDate.substring(0,4);
    String startDate= retrieveObject.startdate;

    String finalStartDate=startDate.substring(6,8)+'/'+startDate.substring(4,6)+'/'+startDate.substring(0,4);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        title: Text(
          'Activities',
          style: TextStyle(
              fontFamily: "Lobster-Regular",
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),

      ),
      body:
     SingleChildScrollView(child: Column(
                        children: [
                          Container(
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => EditForm(
                                  //         getTimeSheetModel: getTimeSheetModel
                                  //             .body
                                  //             .screenData
                                  //             .multiOccData[position]),
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
                                                            fontWeight:
                                                            FontWeight.bold),
                                                        initialValue:
                                                        '${retrieveObject.activityid}' +
                                                            '-${retrieveObject.activityname}',
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
                                                            fontFamily: "DancingScript-VariableFont_wght",
                                                            fontWeight:
                                                            FontWeight.bold),
                                                        initialValue:
                                                        '${retrieveObject.subprojectid}' +
                                                            '-${retrieveObject.subprojectname}',
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
                                                              fontFamily: "DancingScript-VariableFont_wght",
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
                                                            fontFamily: "DancingScript-VariableFont_wght",
                                                            fontWeight:
                                                            FontWeight.bold),
                                                        initialValue:
                                                        '${retrieveObject.projectid}' +
                                                            '-${retrieveObject.projectname}',
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
                                                              fontFamily: "DancingScript-VariableFont_wght",
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
                                                      height: 10,
                                                    ),
if(checked==true)
                                                    Theme(
                                                      child: TextFormField(
                                                        enabled: false,
                                                        style: TextStyle(
                                                            fontFamily: "DancingScript-VariableFont_wght",
                                                            fontWeight:
                                                            FontWeight.bold),
                                                        initialValue:
                                                        '$finalStartDate',
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
                                                          'Start Date',
                                                          labelStyle: TextStyle(
                                                              fontFamily: "DancingScript-VariableFont_wght",
                                                              fontWeight:
                                                              FontWeight.bold),
                                                          hintText:
                                                          'Activity id and Name',
                                                          prefixIcon: const Icon(
                                                            Icons.date_range_sharp,
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
                                                    // last entry box
                                                    if(checked==true)
                                                      Theme(
                                                      child: TextFormField(
                                                        enabled: false,
                                                        style: TextStyle(
                                                            fontFamily: "DancingScript-VariableFont_wght",
                                                            fontWeight:
                                                            FontWeight.bold),
                                                        initialValue:
                                                        '$finalEndDate',
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
                                                          'End Date',
                                                          labelStyle: TextStyle(
                                                              fontFamily: "DancingScript-VariableFont_wght",
                                                              fontWeight:
                                                              FontWeight.bold),
                                                          hintText:
                                                          'Activity id and Name',
                                                          prefixIcon: const Icon(
                                                            Icons.date_range_sharp,
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
                                                    if(checked==false)
                                                    Theme(
                                                      child: TextField(
                                                        onTap: (){
                                                          setState(() {
                                                            DatePicker.showDatePicker(context,
                                                                showTitleActions: true,
                                                                theme: DatePickerTheme(
                                                                    headerColor: Colors.indigoAccent,
                                                                    backgroundColor: Colors.purple[900],
                                                                    itemStyle: TextStyle(
                                                                        fontFamily: "DancingScript-VariableFont_wght",
                                                                        color: Colors.white,
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 25),
                                                                    cancelStyle: TextStyle(
                                                                        fontFamily: "DancingScript-VariableFont_wght",
                                                                        color: Colors.white,
                                                                        fontSize: 20),
                                                                    doneStyle: TextStyle(
                                                                        fontFamily: "DancingScript-VariableFont_wght",
                                                                        color: Colors.white,
                                                                        fontSize: 20)),
                                                                minTime: DateTime(2018, 3, 5),
                                                                maxTime: DateTime.now(),
                                                                onChanged: (date) {

                                                                }, onConfirm: (date) {
                                                                  setState(() {

                                                                    String formattedDate =
                                                                    DateFormat('dd-MM-yyyy').format(date);
                                                                    _dateCtl1.text=formattedDate;
                                                                    date1 = date;
                                                                    String finals=_dateCtl1.text;
                                                                    String year=  finals.substring(6,10);
                                                                    String month= finals.substring(3,5);
                                                                    String day= finals.substring(0,2);

                                                                    update.screenObject.startdate=year+month+day;
                                                                    // deleteActivity.screenObject.startdate=year+month+day;
                                                                  });


                                                                },
                                                                currentTime: DateTime.now(),
                                                                locale: LocaleType.en);
                                                          });
                                                        },
                                                        controller: _dateCtl1,
                                                        //   cursorColor: mainColor,
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
                                                          labelText: 'Start Date',
                                                          hintText: 'Enter Start Date',
                                                          prefixIcon: IconButton(
                                                            icon: const Icon(Icons.calendar_today_outlined),
                                                            color: Colors.black,
                                                            onPressed: () {

                                                            },
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
                                                    if(checked==false)
                                                    Theme(
                                                      child: TextField(
                                                        onTap: (){
                                                          setState(() {
                                                            DatePicker.showDatePicker(context,
                                                                showTitleActions: true,
                                                                theme: DatePickerTheme(
                                                                    headerColor: Colors.indigoAccent,
                                                                    backgroundColor: Colors.purple[900],
                                                                    itemStyle: TextStyle(
                                                                        fontFamily: "DancingScript-VariableFont_wght",
                                                                        color: Colors.white,
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 25),
                                                                    cancelStyle: TextStyle(
                                                                        fontFamily: "DancingScript-VariableFont_wght",
                                                                        color: Colors.white,
                                                                        fontSize: 20),
                                                                    doneStyle: TextStyle(
                                                                        fontFamily: "DancingScript-VariableFont_wght",
                                                                        color: Colors.white,
                                                                        fontSize: 20)),
                                                                minTime: DateTime(2018, 3, 5),
                                                                maxTime: DateTime(2999, 3, 5),
                                                                onChanged: (date) {

                                                                }, onConfirm: (date) {
                                                                  setState(() {

                                                                    String formattedDate =
                                                                    DateFormat('dd-MM-yyyy').format(date);
                                                                    _dateCtl.text=formattedDate;
                                                                    date2 = date;
                                                                    String finals=_dateCtl.text;
                                                                    String year=  finals.substring(6,10);
                                                                    String month= finals.substring(3,5);
                                                                    String day= finals.substring(0,2);
                                                                    print('dai dai ${year+month+day}');

                                                                    update.screenObject.enddate=year+month+day;
                                                                    // deleteActivity.screenObject.enddate=year+month+day;

                                                                    //  models.date = _dateCtl.text;

                                                                  });


                                                                },
                                                                currentTime: DateTime.now(),
                                                                locale: LocaleType.en);
                                                          });
                                                        },
                                                        controller: _dateCtl,
                                                        //   cursorColor: mainColor,
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
                                                          labelText: 'End Date',
                                                          hintText: 'Enter End Date',
                                                          prefixIcon: IconButton(
                                                            icon: const Icon(Icons.calendar_today_outlined),
                                                            color: Colors.black,
                                                            onPressed: () {

                                                            },
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

                                            {
                                              if (checked == false ) {

                                                checked = true;
                                                unchecked = false;
                                                checked == true
                                                    ? buttonText = "Edit"
                                                    : buttonText = "Cancel";
                                              } else {
                                                checked = false;
                                                unchecked = true;
                                                checked == false
                                                    ? buttonText = "Cancel"
                                                    : buttonText = "Cancel";
                                              }
                                            }

                                          });
                                        },
                                        child: Text(
                                          buttonText,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),

                            ],
                          ),
                          if(checked==false)

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
                                              update.mode='modify';
                                              update.screenName='S0015';
                                              update.language="E";
                                              update.screenObject.userid=retrieveObject.userid;
                                              update.screenObject.activityid=retrieveObject.activityid;
                                              update.screenObject.activityname=retrieveObject.activityname;
                                              update.screenObject.projectname=retrieveObject.projectname;
                                              update.screenObject.projectid=retrieveObject.projectid;
                                              update.screenObject.subprojectid=retrieveObject.subprojectid;
                                              update.screenObject.subprojectname=retrieveObject.subprojectname;
                                              //http://103.14.123.116:8080/timesheetapiuat/adminData/updateScreen
                                              postHttp('timesheetapiuat/adminData/updateScreen',
                                                  update)
                                                  .then((value) {
                                                    print(value);



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
                                                                      context) =>
                                                                          ActivityProjList()));
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                                else  if(value['status']!='SUCCESS'){
                                                  Toast.show("Please enter all fields", context,
                                                      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

                                                }
                                              });



                                            });
                                          },
                                          child: Text(
                                            'Update',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    )),

                              ],
                            ),
                          if(checked==false)

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
                                              delete.mode='delete';
                                              delete.screenName='S0015';
                                              delete.language="E";
                                              delete.screenObject.activityid=retrieveObject.activityid;
                                              delete.screenObject.activityname=retrieveObject.activityname;
                                              delete.screenObject.projectname=retrieveObject.projectname;
                                              delete.screenObject.projectid=retrieveObject.projectid;
                                              delete.screenObject.subprojectid=retrieveObject.subprojectid;
                                              delete.screenObject.subprojectname=retrieveObject.subprojectname;
                                              delete.screenObject.startdate=retrieveObject.startdate;
                                              delete.screenObject.enddate=retrieveObject.enddate;
                                              delete.screenObject.userid=retrieveObject.userid;


                                              //http://103.14.123.116:8080/timesheetapiuat/adminData/updateScreen
                                              postHttp('timesheetapiuat/adminData/updateScreen',
                                                  delete)
                                                  .then((value) {
                                                    print(value);


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
                                                                    context) =>
                                                                        ActivityProjList()));
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              });



                                            });
                                          },
                                          child: Text(
                                            'Delete',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
)                                    )]),

                              ],
                            ),


                      )
    );

  }



}
