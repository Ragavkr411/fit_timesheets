import 'package:fit_timesheets/Pages/footer.dart';
import 'package:fit_timesheets/models/admin/subprojects/deleteSubProject.dart';
import 'package:fit_timesheets/models/admin/subprojects/getSubProjectList.dart';
import 'package:fit_timesheets/models/admin/subprojects/retrieveSubProject.dart';
import 'package:fit_timesheets/models/admin/subprojects/updateSubProject.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';
import 'getSubProject.dart';

class SubProjectRetrieve extends StatefulWidget {
  final SubProjectMultiOccData subProjList;

  const SubProjectRetrieve({Key key, this.subProjList}) : super(key: key);

  @override
  _SubProjectRetrieveState createState() => _SubProjectRetrieveState(subProjList);
}

class _SubProjectRetrieveState extends State<SubProjectRetrieve> {
  final SubProjectMultiOccData subProjList;



  bool checked = false;
  bool unchecked= true;
  bool drop = true;

  _SubProjectRetrieveState(this.subProjList);

  String buttonText = "Edit";
  DateTime date2;
  DateTime date1;
  TextEditingController _dateCtl = TextEditingController();
  TextEditingController _dateCtl1 = TextEditingController();
  String year;
  String month;
  String day;
  String endYear;
  String endMonth,endDay;

  int total;
  RetrieveSubProject retrieveList=RetrieveSubProject();
  UpdateSubProject updateRetrieve=UpdateSubProject();
  DeleteSubProj deleteSubProj=DeleteSubProj();


  String name,desc,sponsor;


  @override
  Widget build(BuildContext context) {


    getHttp2(
      //   http://103.14.123.116:8080/timesheetapiuat/adminData/getScreen?screenName=S0008&projectid=1&mode=display
        'timesheetapiuat/adminData/getScreen?screenName=S0012&subprojectid=${subProjList.subprojectid}&mode=display')
        .then((apiValue) {

      setState(() {
        retrieveList = RetrieveSubProject.fromJson(apiValue);

      });

    });

    String reversed=retrieveList.body.screenData.enddate;
    String singleYear=reversed.substring(0,4);
    String singleMonth=reversed.substring(4,6);
    String singleDat=reversed.substring(6,8);
    String totalDate=singleDat+'/'+singleMonth+'/'+singleYear;


    String Startreversed=retrieveList.body.screenData.startdate;
    String StartsingleYear=Startreversed.substring(0,4);
    String StartsingleMonth=Startreversed.substring(4,6);
    String startsingleDat=Startreversed.substring(6,8);
    String starttotalDate=startsingleDat+'/'+StartsingleMonth+'/'+StartsingleYear;


    name=retrieveList.body.screenData.name;
    desc=retrieveList.body.screenData.description;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(
              fontFamily: "Lobster-Regular",
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[900],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Card(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(children: <Widget>[
                Theme(
                  child: TextFormField(
                    enabled: false,
                    initialValue: '${retrieveList.body.screenData.subprojectid}',
                    keyboardType: TextInputType.number,
                    onChanged: (v) {
                      // update.screenObject.rimbtypeid=v;
                      updateRetrieve.screenObject.subprojectid=v;

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
                      labelText: 'SubProject Id',
                      hintText: 'Enter SubProject Id',
                      prefixIcon: const Icon(
                        Icons.all_inbox_outlined,
                        color: Colors.black,
                      ),
                     labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght"),
                    ),

                    //controller: fieldText,
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
                    initialValue: '$name',
                    //keyboardType: TextInputType.number,
                    enabled: checked,
                    onChanged: (v) {
                      setState(() {
                        name=v;
                        updateRetrieve.screenObject.name=v;

                      });

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
                      labelText: 'SubProject Name',
                      hintText: 'Enter SubProject Name',
                      prefixIcon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght"),
                    ),

                    //controller: fieldText,
                  ),
                  data: Theme.of(context).copyWith(
                    primaryColor: Colors.redAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // if (checked == false)
                Theme(
                  child: TextFormField(
                    initialValue: '$desc',
                    // keyboardType: TextInputType.number,
                    enabled: checked,
                    onChanged: (v) {
                      setState(() {
                        desc=v;
                        updateRetrieve.screenObject.description=v;

                      });

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
                      labelText: 'SubProject Description',
                      hintText: 'Enter SubProject Description',
                      prefixIcon: const Icon(
                        Icons.attach_money,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght"),
                    ),

                    //controller: fieldText,
                  ),
                  data: Theme.of(context).copyWith(
                    primaryColor: Colors.redAccent,
                  ),
                ),


                SizedBox(
                  height: 10,
                ),

                if(checked==false)
                  Theme(
                    child: TextFormField(
                      enabled: checked,
                      initialValue: '$starttotalDate',
                      keyboardType: TextInputType.number,
                      onChanged: (v) {
                        // update.screenObject.rimbtypeid=v;

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
                        hintText: 'Enter Activity Id',
                        prefixIcon: const Icon(
                          Icons.all_inbox_outlined,
                          color: Colors.black,
                        ),
                        labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght"),
                      ),

                      //controller: fieldText,
                    ),
                    data: Theme.of(context).copyWith(
                      primaryColor: Colors.redAccent,
                    ),
                  ),
                if(unchecked==false)
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

                                  updateRetrieve.screenObject.startdate=year+month+day;
                                  deleteSubProj.screenObject.startdate=year+month+day;
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
                  height: 10,
                ),
                if(checked==false)
                  Theme(
                    child: TextFormField(
                      enabled: checked,
                      initialValue: '${totalDate}',
                      keyboardType: TextInputType.number,
                      onChanged: (v) {
                        // update.screenObject.rimbtypeid=v;

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
                        hintText: 'Enter Activity Id',
                        prefixIcon: const Icon(
                          Icons.all_inbox_outlined,
                          color: Colors.black,
                        ),
                        labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght",)
                      ),

                      //controller: fieldText,
                    ),
                    data: Theme.of(context).copyWith(
                      primaryColor: Colors.redAccent,
                    ),
                  ),
                if(unchecked==false)
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
                                  _dateCtl.text=formattedDate;
                                  date2 = date;
                                  String finals=_dateCtl.text;
                                  String year=  finals.substring(6,10);
                                  String month= finals.substring(3,5);
                                  String day= finals.substring(0,2);

                                  updateRetrieve.screenObject.enddate=year+month+day;
                                  deleteSubProj.screenObject.enddate=year+month+day;

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
                  height: 10,
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

                                  {
                                    if (checked == false ) {

                                      checked = true;
                                      unchecked = false;
                                      checked == true
                                          ? buttonText = "Cancel"
                                          : buttonText = "Cancel";
                                    } else {
                                      checked = false;
                                      unchecked = true;
                                      checked == false
                                          ? buttonText = "Edit"
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
                if(checked==true)

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
                                    updateRetrieve.mode='modify';
                                    updateRetrieve.screenName='S0012';
                                    updateRetrieve.language="E";
                                   updateRetrieve.screenObject.subprojectid=subProjList.subprojectid;
                                    updateRetrieve.screenObject.description=desc;
                                    updateRetrieve.screenObject.name=name;
                                 //   updateRetrieve.screenObject.projectsponsor=sponsor;
                                    //http://103.14.123.116:8080/timesheetapiuat/adminData/updateScreen
                                    postHttp('timesheetapiuat/adminData/updateScreen',
                                        updateRetrieve)
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
                                                                SubProjectListForm()));
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
                                    deleteSubProj.mode='delete';
                                    deleteSubProj.screenName='S0012';
                                    deleteSubProj.language="E";
                                    deleteSubProj.screenObject.subprojectid=subProjList.subprojectid;
                                    deleteSubProj.screenObject.description=desc;
                                    deleteSubProj.screenObject.name=name;
                                   // deleteSubProj.screenObject.projectsponsor=sponsor;
                                    deleteSubProj.screenObject.enddate=subProjList.enddate;
                                    deleteSubProj.screenObject.startdate=subProjList.startdate;

                                    //http://103.14.123.116:8080/timesheetapiuat/adminData/updateScreen
                                    postHttp('timesheetapiuat/adminData/updateScreen',
                                        deleteSubProj)
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
                                                              SubProjectListForm()));
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
                          )),

                    ],
                  ),

              ]),
            )),
      ),
      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),

      // This trailing comma makes auto-formatting nicer for build methods.

    );
  }


}
