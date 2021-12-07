import 'dart:async';
import 'dart:ui';
import 'package:fit_timesheets/Pages/Admin/ProjectGroups/activities.dart';
import 'package:fit_timesheets/models/admin/projectGroups/addActivityDropDown.dart';
import 'package:fit_timesheets/models/admin/projectGroups/addActivityProjGroup.dart';
import 'package:fit_timesheets/models/admin/projectGroups/addProjDropDown.dart';
import 'package:fit_timesheets/models/admin/projectGroups/addSubProjDropDown.dart';
import 'package:fit_timesheets/models/admin/users/addProjectGroup.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:toast/toast.dart';
import '../../footer.dart';


const Color mainColor = Color(0xFF796A9D);

class AddActivityProjGroup extends StatefulWidget {
  final String id;

  const AddActivityProjGroup({Key key, this.id}) : super(key: key);
  @override
  AddActivityProjGroupState createState() => AddActivityProjGroupState(id);
}

class AddActivityProjGroupState extends State<AddActivityProjGroup> {

  final String id;
  AddActivitiesProjGroup add =AddActivitiesProjGroup();

  DateTime date1,date2;
  TextEditingController _dateCtl = TextEditingController();
  TextEditingController _dateCtl1 = TextEditingController();
  int length = 0;
  String dropdown;
  String dropdown2;
  String dropdown3;
  AddActivitiesProjGroupDropDown activityDrop=AddActivitiesProjGroupDropDown();
  AddSubProjGroupDropDown subProjDrop=AddSubProjGroupDropDown();
  AddProjGroupDropDown projectDrop=AddProjGroupDropDown();

  AddActivityProjGroupState(this.id);
  @override
  Widget build(BuildContext context) {

    @override
    void initState() {
      super.initState();

    }

    getHttp2(
        'timesheetapiuat/adminData/getScreen?screenName=S0009&mode=undefined&pageNum=0&pageSize=1000&searchString=&searchCriteria=activityid&firstTime=true')
        .then((apiValue) {

      setState(() {
        activityDrop = AddActivitiesProjGroupDropDown.fromJson(apiValue);
      });
    });

    getHttp2(
        'timesheetapiuat/adminData/getScreen?screenName=S0007&mode=undefined&pageNum=0&pageSize=1000&searchString=&searchCriteria=subprojectid&firstTime=true')
        .then((apiValue) {

      setState(() {
        projectDrop = AddProjGroupDropDown.fromJson(apiValue);
      });
    });

    getHttp2(
        'timesheetapiuat/adminData/getScreen?screenName=S0011&mode=undefined&pageNum=0&pageSize=1000&searchString=&searchCriteria=subprojectid&firstTime=true')
        .then((apiValue) {

      setState(() {
        subProjDrop = AddSubProjGroupDropDown.fromJson(apiValue);
      });
    });


    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Activities Entry ',
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
                                  activityDrop
                                      .body
                                      .screenData
                                      .multiOccData.length -
                                      1;
                              length++)
                                activityDrop
                                    .body
                                    .screenData
                                    .multiOccData[length]
                                    .activityid + '-' +
                                    activityDrop
                                        .body
                                        .screenData
                                        .multiOccData[length]
                                        .name


                            ].map<DropdownMenuItem<String>>(

                                    (String value) {
                                  return DropdownMenuItem<
                                      String>(

                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontFamily: "DancingScript-VariableFont_wght",
                                          color: Colors
                                              .black,
                                          fontSize: 16),
                                    ),
                                  );
                                }).toList(),
                            value: dropdown,
                            hint: "Activity",
                            style: TextStyle(
                                fontFamily: "DancingScript-VariableFont_wght",
                                color: Colors.black),
                            searchHint: "Search Activity",
                            onChanged: (value) {
                              setState(() {
                                dropdown = value;
                                var arr = dropdown.split(
                                    '-');
                                add.screenObject
                                    .activityid = arr[0];
                                add.screenObject
                                    .activityname = arr[1];

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
              ), Row(
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
                                  subProjDrop
                                      .body
                                      .screenData
                                      .multiOccData.length -
                                      1;
                              length++)
                                subProjDrop
                                    .body
                                    .screenData
                                    .multiOccData[length]
                                    .subprojectid + '-' +
                                    subProjDrop
                                        .body
                                        .screenData
                                        .multiOccData[length]
                                        .name


                            ].map<DropdownMenuItem<String>>(

                                    (String value) {
                                  return DropdownMenuItem<
                                      String>(

                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontFamily: "DancingScript-VariableFont_wght",
                                          color: Colors
                                              .black,
                                          fontSize: 16),
                                    ),
                                  );
                                }).toList(),
                            value: dropdown2,
                            hint: "SubProject",
                            style: TextStyle(
                                fontFamily: "DancingScript-VariableFont_wght",
                                color: Colors.black),
                            searchHint: "Search SubProject",
                            onChanged: (value) {
                              setState(() {
                                dropdown2 = value;
                                var arr = dropdown2.split(
                                    '-');
                                add.screenObject
                                    .subprojectid = arr[0];
                                add.screenObject
                                    .subprojectname = arr[1];

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
                                  projectDrop
                                      .body
                                      .screenData
                                      .multiOccData.length -
                                      1;
                              length++)
                                projectDrop
                                    .body
                                    .screenData
                                    .multiOccData[length]
                                    .projectid + '-' +
                                    projectDrop
                                        .body
                                        .screenData
                                        .multiOccData[length]
                                        .name


                            ].map<DropdownMenuItem<String>>(

                                    (String value) {
                                  return DropdownMenuItem<
                                      String>(

                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontFamily: "DancingScript-VariableFont_wght",
                                          color: Colors
                                              .black,
                                          fontSize: 16),
                                    ),
                                  );
                                }).toList(),
                            value: dropdown3,
                            hint: "Project",
                            style: TextStyle(
                                fontFamily: "DancingScript-VariableFont_wght",
                                color: Colors.black),
                            searchHint: "Search Project",
                            onChanged: (value) {
                              setState(() {
                                dropdown3 = value;
                                var arr = dropdown3.split(
                                    '-');
                                add.screenObject
                                    .projectid = arr[0];
                                add.screenObject
                                    .projectname = arr[1];

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

                              add.screenObject.startdate=year+month+day;
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

                              add.screenObject.enddate=year+month+day;
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
                            child:  ProgressButton(


                              // color: Colors.purple[900],
                              defaultWidget:
                              const Text('Submit', style: TextStyle(color: Colors.black)),
                              progressWidget: const CircularProgressIndicator(
                                  backgroundColor: Colors.red,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple)),
                              width: 114,



                              onPressed: () async {
                                await Future.delayed(
                                    const Duration(milliseconds: 1000), () {
                                  return showDialog<void>(

                                    context: context,
                                    barrierDismissible: false,
                                    // user must tap button!
                                    builder: (BuildContext context) {
                                      add.language='E';
                                      add.mode='create';
                                      add.screenName='S0015';
                                      add.headerMode='display';
                                      add.screenObject.userid= id;






                                      return Screenshot(
                                          //ontroller:_screenshotController ,

                                          child: RepaintBoundary(
                                            //  key: scr1,
                                              child: AlertDialog(

                                                backgroundColor: Colors.grey[350],
                                                title: Text(
                                                    'Confirm Details'),
                                                content: SingleChildScrollView(
                                                    child: ListBody(
                                                        children: <Widget>[ ])),
                                                actions: <Widget>[

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
                                                          'timesheetapiuat/adminData/updateScreen',
                                                          add)
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
                                                                                  ActivityProjList())
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


}
