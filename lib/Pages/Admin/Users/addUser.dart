import 'dart:async';
import 'dart:ui';
import 'package:fit_timesheets/Pages/Admin/SubProject/getSubProject.dart';
import 'package:fit_timesheets/Pages/Admin/Users/viewUserList.dart';
import 'package:fit_timesheets/models/admin/subprojects/createSubproject.dart';
import 'package:fit_timesheets/models/admin/users/addUser.dart';
import 'package:fit_timesheets/models/admin/users/reportsTo.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:toast/toast.dart';
import '../../footer.dart';

const Color mainColor = Color(0xFF796A9D);

class AddUser extends StatefulWidget {
  @override
  AddUserState createState() => AddUserState();
}

class AddUserState extends State<AddUser> {

  final _screenshotController = ScreenshotController();
  bool screenshot=true;
  GlobalKey scr = GlobalKey();
  GlobalKey scr1 = GlobalKey();
  int length = 0;
  String dropdown;
  ReportsTo reportsTO=ReportsTo();




  DateTime date2;
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _pan = TextEditingController();
  TextEditingController _bankName = TextEditingController();
  TextEditingController _accNo = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _status = TextEditingController(text: 'Pending Approval');
  TextEditingController _aadhar = TextEditingController();
  TextEditingController _ifsc = TextEditingController();


  DateTime date1;
  TextEditingController _dateCtl = TextEditingController();
  TextEditingController _dateCtl1 = TextEditingController();

  CreateSubProject addSubProject=CreateSubProject();
  AddUserModel addUser=AddUserModel();
  @override
  Widget build(BuildContext context) {



    @override
    void initState() {
      super.initState();

    }
    getHttp2(
        'timesheetapiuat/adminData/getScreen?screenName=S0001&mode=undefined&pageNum=0&pageSize=1000&searchString=&searchCriteria=id&firstTime=true')
        .then((apiValue) {

      setState(() {
        reportsTO = ReportsTo.fromJson(apiValue);
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add User ',
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
                  controller: _name,
                  //keyboardType: TextInputType.number,
                  cursorColor: mainColor,
                  onChanged: (v) {
                    setState(() {
                      addUser.screenObject.name=_name.text;
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
                    labelText: 'User Name',
                    hintText: 'Enter User Name',
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
                  controller: _email,
                  //keyboardType: TextInputType.number,
                  cursorColor: mainColor,
                  onChanged: (v) {
                    addUser.screenObject.email=_email.text;


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
                    labelText: 'Email Id',
                    hintText: 'Enter Email Id',
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
                  controller: _phone,
                  // keyboardType: TextInputType.number,
                  cursorColor: mainColor,
                  onChanged: (v) {
                    addUser.screenObject.phone=_phone.text;


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
                    labelText: 'Phone Number',
                    hintText: 'Enter Phone Number',
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
                  controller: _status,
                  // keyboardType: TextInputType.number,
                  cursorColor: mainColor,
                  onChanged: (v) {
                    addUser.screenObject.userStatus=_status.text;


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
                    labelText: 'Status',
                    hintText: 'Enter Phone Number',
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
                height: 20,
              ),
              Theme(
                child: TextField(
                  controller: _pan,
                  // keyboardType: TextInputType.number,
                  cursorColor: mainColor,
                  onChanged: (v) {
                    addUser.screenObject.pannumber=_pan.text;


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
                    labelText: 'PAN Number',
                    hintText: 'Enter PAN Number',
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
                height: 20,
              ),
              Theme(
                child: TextField(
                  controller: _aadhar,
                  // keyboardType: TextInputType.number,
                  cursorColor: mainColor,
                  onChanged: (v) {
                    addUser.screenObject.aadharid=_aadhar.text;


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
                    labelText: 'Aadhar Number',
                    hintText: 'Enter Aadhar Number',
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
                height: 20,
              ),
              Theme(
                child: TextField(
                  controller: _bankName,
                  // keyboardType: TextInputType.number,
                  cursorColor: mainColor,
                  onChanged: (v) {
                    addUser.screenObject.bankname=_bankName.text;


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
                    labelText: 'Bank Name',
                    hintText: 'Enter Bank Name',
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
                height: 20,
              ),
              Theme(
                child: TextField(
                  controller: _ifsc,
                  // keyboardType: TextInputType.number,
                  cursorColor: mainColor,
                  onChanged: (v) {
                    addUser.screenObject.ifsccode=_ifsc.text;


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
                    labelText: 'IFSC',
                    hintText: 'Enter IFSC',
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
                height: 20,
              ),
              Theme(
                child: TextField(
                  controller: _accNo,
                  // keyboardType: TextInputType.number,
                  cursorColor: mainColor,
                  onChanged: (v) {
                    addUser.screenObject.bankAccountNum=_accNo.text;


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
                    labelText: 'Account Number',
                    hintText: 'Enter Account Number',
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
                                  reportsTO
                                      .body
                                      .screenData
                                      .multiOccData.length -
                                      1;
                              length++)
                                reportsTO
                                    .body
                                    .screenData
                                    .multiOccData[length]
                                    .id + '-' +
                                    reportsTO
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
                            hint: "Reports To",
                            style: TextStyle(
                                fontFamily: "DancingScript-VariableFont_wght",
                                color: Colors.black),
                            searchHint: "Search User",
                            onChanged: (value) {
                              setState(() {
                                dropdown = value;
                                var arr = dropdown.split(
                                    '-');
                                addUser.screenObject
                                    .reportsToId = arr[0];
                                addUser.screenObject
                                    .reportsToName = arr[1];

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
                                                        children: <Widget>[
                                                          Text('Name: ${_name.text}'),
                                                          Text('Phone: ${_phone.text}'),
                                                          Text('Email: ${_email.text}'),
                                                          //Text('Project Sponsor: ${_sponsor.text}'),
                                                          Text('Status: ${_status.text}'),
                                                          Text('PAN: ${_pan.text}'),
                                                          Text('Aadhar: ${_aadhar.text}'),
                                                          Text('Bank Name: ${_bankName.text}'),
                                                          Text('IFSC: ${_ifsc.text}'),
                                                          Text('Account Number: ${_accNo.text}'),
                                                          //Text('Reports To: ${_name.text}'),
                                                        ])),

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
                                                      addUser.mode='create';
                                                      addUser.language='E';
                                                      addUser.screenName='S0002';
                                                      addUser.screenObject.name=_name.text;
                                                      addUser.screenObject.phone=_phone.text;
                                                      addUser.screenObject.email=_email.text;
                                                      addUser.screenObject.userStatus=_status.text;
                                                      addUser.screenObject.pannumber=_pan.text;
                                                      addUser.screenObject.aadharid=_aadhar.text;
                                                      addUser.screenObject.bankname=_bankName.text;
                                                      addUser.screenObject.ifsccode=_ifsc.text;

                                                      addUser.screenObject.bankAccountNum=_accNo.text;
                                                      postHttp(
                                                          'timesheetapiuat/adminData/updateScreen',
                                                          addUser)
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
                                                                                  UserListForm())
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
