import 'dart:async';
import 'dart:ui';
import 'package:fit_timesheets/Pages/Admin/Activities/activitiesList.dart';
import 'package:fit_timesheets/Pages/Admin/Projects/prjectListForm.dart';
import 'package:fit_timesheets/models/admin/projects/createProject.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';
import 'package:toast/toast.dart';
import '../../footer.dart';

const Color mainColor = Color(0xFF796A9D);

class ProjectEntry extends StatefulWidget {
  @override
  ProjectEntryFormState createState() => ProjectEntryFormState();
}

class ProjectEntryFormState extends State<ProjectEntry> {

  final _screenshotController = ScreenshotController();
  bool screenshot=true;
  GlobalKey scr = GlobalKey();
  GlobalKey scr1 = GlobalKey();



  DateTime date2;
  TextEditingController _projectId = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _sponsor = TextEditingController();


  DateTime date1;
  TextEditingController _dateCtl = TextEditingController();
  TextEditingController _dateCtl1 = TextEditingController();

  AddProject addProject=AddProject();
  @override
  Widget build(BuildContext context) {



    @override
    void initState() {
      super.initState();

    }


    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Project Entry ',
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


              Theme(
                child: TextField(
                  controller: _projectId,
                  keyboardType: TextInputType.number,
                  cursorColor: mainColor,
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
                    labelText: 'Project ID',
                    hintText: 'Enter Project ID',
                    prefixIcon: const Icon(
                      Icons.confirmation_number_outlined,
                      color: Colors.black,
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
                child: TextField(
                  controller: _name,
                  //keyboardType: TextInputType.number,
                  cursorColor: mainColor,
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
                    labelText: 'Project Name',
                    hintText: 'Enter Project Name',
                    prefixIcon: const Icon(
                      Icons.confirmation_number_outlined,
                      color: Colors.black,
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
                child: TextField(
                  controller: _description,
                  // keyboardType: TextInputType.number,
                  cursorColor: mainColor,
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
                    labelText: 'Project Description',
                    hintText: 'Enter Project Description',
                    prefixIcon: const Icon(
                      Icons.confirmation_number_outlined,
                      color: Colors.black,
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
                child: TextField(
                  controller: _sponsor,
                  // keyboardType: TextInputType.number,
                  cursorColor: mainColor,
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
                    labelText: 'Project Sponsor',
                    hintText: 'Enter Project Sponsor',
                    prefixIcon: const Icon(
                      Icons.confirmation_number_outlined,
                      color: Colors.black,
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

                              addProject.screenObject.startdate=year+month+day;
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

                              addProject.screenObject.enddate=year+month+day;
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
                                      addProject.language='E';
                                      addProject.mode='create';
                                      addProject.screenName='S0008';
                                      addProject.screenObject.projectid=_projectId.text;
                                      addProject.screenObject.name=_name.text;
                                      addProject.screenObject.description=_description.text;
                                      addProject.screenObject.projectsponsor=_sponsor.text;





                                      return Screenshot(
                                          controller:_screenshotController ,

                                          child: RepaintBoundary(
                                              key: scr1,
                                              child: AlertDialog(

                                                backgroundColor: Colors.grey[350],
                                                title: Text(
                                                    'Confirm Details'),
                                                content: SingleChildScrollView(
                                                    child: ListBody(
                                                        children: <Widget>[Text('Project id: ${_projectId.text}'),
                                                          Text('Project Name: ${_name.text}'),
                                                          Text('Project Description: ${_description.text}'),
                                                          Text('Project Sponsor: ${_sponsor.text}'),
                                                          Text('Start Date: ${_dateCtl1.text}'),
                                                          Text('End Date: ${_dateCtl.text}'), ])),
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
                                                          addProject)
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
                                                                                  ProjectListForm())
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
