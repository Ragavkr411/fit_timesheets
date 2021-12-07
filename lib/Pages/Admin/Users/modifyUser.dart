import 'package:fit_timesheets/Pages/Admin/Users/projectGroupsList.dart';
import 'package:fit_timesheets/Pages/Admin/Users/viewUserList.dart';
import 'package:fit_timesheets/models/admin/projects/projectList.dart';
import 'package:fit_timesheets/models/admin/users/activateUser.dart';
import 'package:fit_timesheets/models/admin/users/deleteUser.dart';
import 'package:fit_timesheets/models/admin/users/getUsersList.dart';
import 'package:fit_timesheets/models/admin/users/modifyUser.dart';
import 'package:fit_timesheets/models/admin/users/projectGroups.dart';
import 'package:fit_timesheets/models/admin/users/resetAuth.dart';
import 'package:fit_timesheets/models/admin/users/updateUser.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:toast/toast.dart';
import '../../footer.dart';



class ModifyUserForm extends StatefulWidget {
  final MultiOccDataUser activitiesList;

  const ModifyUserForm({Key key, this.activitiesList}) : super(key: key);

  @override
  _ModifyUserState createState() => _ModifyUserState(activitiesList);
}

class _ModifyUserState extends State<ModifyUserForm> {
  final MultiOccDataUser activitiesList;
  bool checked = false;
  bool unchecked= true;
  bool drop = true;

  _ModifyUserState(this.activitiesList);


  int total;
  ModifyUser retrieveList=ModifyUser();
  UpdateUser userUpdate=UpdateUser();
  UpdateUser disable=UpdateUser();
  DeleteUser deleteUser=DeleteUser();
  UpdateUser decline=UpdateUser();
  UpdateUser approve=UpdateUser();
  ActivateUser activate=ActivateUser();
  ProjectGroups projectGroups=ProjectGroups();
TextEditingController _password=TextEditingController();
  ResetAuth resetAuth=ResetAuth();
  ResetAuth password=ResetAuth();
  @override
  Widget build(BuildContext context) {


    getHttp2(
      //   http://103.14.123.116:8080/timesheetapiuat/adminData/getScreen?screenName=S0008&projectid=1&mode=display
        'timesheetapiuat/adminData/getScreen?screenName=S0002&id=${activitiesList.id}&language=E&mode=modify')
        .then((apiValue) {

      setState(() {
        retrieveList = ModifyUser.fromJson(apiValue);

      });

    });


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
        actions:[ IconButton(
          onPressed: () {
            setState(() {
              if(activitiesList.userStatus=='Active')
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProjectGroupsUserList(
                            userid: retrieveList.body.screenData.id
                            ),
                  )
              );

            });
          },
          icon: Icon(Icons.paste_rounded),
        ),
        ] ),
      body: SingleChildScrollView(
        child: Card(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(children: <Widget>[
                Theme(
                  child: TextFormField(
                    enabled: false,
                    initialValue: '${retrieveList.body.screenData.id}',
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
                      labelText: 'ID',
                      hintText: 'Enter Project Id',
                      prefixIcon: const Icon(
                        Icons.all_inbox_outlined,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght")
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
                    initialValue: '${retrieveList.body.screenData.name}',
                    //keyboardType: TextInputType.number,
                    enabled: false,
                    onChanged: (v) {
                      setState(() {


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
                      labelText: 'Name',
                      hintText: 'Enter Project Name',
                      prefixIcon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                        labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght")
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
                    initialValue: '${retrieveList.body.screenData.userStatus}',
                    //keyboardType: TextInputType.number,
                    enabled: false,
                    onChanged: (v) {
                      setState(() {


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
                      labelText: 'Status',
                      hintText: 'Enter Project Name',
                      prefixIcon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                        labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght")
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
                    initialValue: '${retrieveList.body.screenData.dateOfRegistration}',
                    //keyboardType: TextInputType.number,
                    enabled: false,
                    onChanged: (v) {
                      setState(() {


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
                      labelText: 'Date of Registration',
                      hintText: 'Enter Project Name',
                      prefixIcon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                        labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght")
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
                    initialValue: '${retrieveList.body.screenData.email}',
                    //keyboardType: TextInputType.number,
                    enabled: false,
                    onChanged: (v) {
                      setState(() {


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
                      labelText: 'Email',
                      hintText: 'Enter Project Name',
                      prefixIcon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                        labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght")
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
                    initialValue: '${retrieveList.body.screenData.phone}',
                    //keyboardType: TextInputType.number,
                    enabled: false,
                    onChanged: (v) {
                      setState(() {


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
                      labelText: 'Phone',
                      hintText: 'Enter Project Name',
                      prefixIcon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                        labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght")
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
                    initialValue: '${retrieveList.body.screenData.isAdminApproved}',
                    //keyboardType: TextInputType.number,
                    enabled: false,
                    onChanged: (v) {
                      setState(() {


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
                      labelText: 'Is Approved',
                      hintText: 'Enter Project Name',
                      prefixIcon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                        labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght")
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
                    initialValue: '${retrieveList.body.screenData.dateOfAdminApproval}',
                    //keyboardType: TextInputType.number,
                    enabled: false,
                    onChanged: (v) {
                      setState(() {


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
                      labelText: 'Date of Approval',
                      hintText: 'Enter Project Name',
                      prefixIcon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                        labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght")
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
                    initialValue: '${retrieveList.body.screenData.emailVerified}',
                    //keyboardType: TextInputType.number,
                    enabled: false,
                    onChanged: (v) {
                      setState(() {


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
                      labelText: 'Email Verified',
                      hintText: 'Enter Project Name',
                      prefixIcon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                        labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght")
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
                    initialValue: '${retrieveList.body.screenData.isPhoneVerified}',
                    //keyboardType: TextInputType.number,
                    enabled: false,
                    onChanged: (v) {
                      setState(() {


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
                      labelText: 'Phone Verified',
                      hintText: 'Enter Project Name',
                      prefixIcon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                        labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght")
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
                    initialValue: '${retrieveList.body.screenData.pannumber}',
                    //keyboardType: TextInputType.number,
                    //enabled: false,
                    onChanged: (v) {
                      setState(() {
                        userUpdate.screenObject.pannumber=v;

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
                      labelText: 'PAN Number',
                      hintText: 'Enter PAN Number',
                      prefixIcon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                        labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght")
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
                    initialValue: '${retrieveList.body.screenData.aadharid}',
                    //keyboardType: TextInputType.number,
                   // enabled: false,
                    onChanged: (v) {
                      setState(() {
                        userUpdate.screenObject.aadharid=v;


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
                      labelText: 'Aadhar Id',
                      hintText: 'Enter Aadhar Id',
                      prefixIcon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                        labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght")
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
                    initialValue: '${retrieveList.body.screenData.bankname}',
                    //keyboardType: TextInputType.number,
                    //enabled: false,
                    onChanged: (v) {
                      setState(() {
                        userUpdate.screenObject.bankname=v;

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
                      labelText: 'Bank Name',
                      hintText: 'Enter Bank Name',
                      prefixIcon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                        labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght")
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
                    initialValue: '${retrieveList.body.screenData.ifsccode}',
                    //keyboardType: TextInputType.number,
                    //enabled: false,
                    onChanged: (v) {
                      setState(() {
                        userUpdate.screenObject.ifsccode=v;

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
                      labelText: 'IFSC Code',
                      hintText: 'Enter IFSC Code',
                      prefixIcon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                        labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght")
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
                    initialValue: '${retrieveList.body.screenData.bankAccountNum}',
                    //keyboardType: TextInputType.number,
                    //enabled: false,
                    onChanged: (v) {
                      setState(() {
                        userUpdate.screenObject.bankAccountNum=v;

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
                      labelText: 'Bank Account Number',
                      hintText: 'Enter Bank Account Number',
                      prefixIcon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                        labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght")
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
                    initialValue: '${retrieveList.body.screenData.reportsToName}',
                    //keyboardType: TextInputType.number,
                    enabled: false,
                    onChanged: (v) {
                      setState(() {


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
                      labelText: 'Reports To',
                      hintText: 'Enter Project Name',
                      prefixIcon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                        labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght")
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
                if(retrieveList.body.screenData.userStatus=='Pending Approval')
                  Theme(
                    child: TextFormField(
                     // initialValue: '${retrieveList.body.screenData.reportsToName}',
                      //keyboardType: TextInputType.number,
                     controller: _password,
                    //  enabled: false,
                      onChanged: (v) {
                        setState(() {
                          _password.text=v;


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
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        prefixIcon: const Icon(
                          Icons.comment,
                          color: Colors.black,
                        ),
                          labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght")
                      ),

                      //controller: fieldText,
                    ),
                    data: Theme.of(context).copyWith(
                      primaryColor: Colors.redAccent,
                    ),
                  ),
               // String decline=retrieveList.body.screenData.isAdminApproved;
                if(retrieveList.body.screenData.userStatus=='Pending Approval'||retrieveList.body.screenData.userStatus=='Active')
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
                                    userUpdate.language='E';
                                    userUpdate.mode='modify';
                                    userUpdate.screenName='S0002';
                                    userUpdate.screenObject.id=retrieveList.body.screenData.id;
                                    userUpdate.screenObject.name=retrieveList.body.screenData.name;
                                    userUpdate.screenObject.userStatus=retrieveList.body.screenData.userStatus;
                                    userUpdate.screenObject.dateOfRegistration=retrieveList.body.screenData.dateOfRegistration;
                                    userUpdate.screenObject.email=retrieveList.body.screenData.email;
                                    userUpdate.screenObject.phone=retrieveList.body.screenData.phone;
                                    userUpdate.screenObject.isAdminApproved=retrieveList.body.screenData.isAdminApproved;
                                    userUpdate.screenObject.dateOfAdminApproval=retrieveList.body.screenData.dateOfAdminApproval;
                                    userUpdate.screenObject.emailVerified=retrieveList.body.screenData.emailVerified;
                                    userUpdate.screenObject.isPhoneVerified=retrieveList.body.screenData.isPhoneVerified;
                                    userUpdate.screenObject.reportsToName=retrieveList.body.screenData.reportsToName;
                                    userUpdate.screenObject.reportsToId=retrieveList.body.screenData.reportsToId;

                                    // http://103.14.123.116:8080/timesheetapiuat/adminData/updateScreen
                                    postHttp('timesheetapiuat/adminData/updateScreen',
                                        userUpdate)
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
                                                                UserListForm()));
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
                // ButtonBar(
                //   alignment: MainAxisAlignment.center,
                //   buttonMinWidth: 80,
                //   children: <Widget>[
                //     new SizedBox(
                //         width: 120.0,
                //         height: 50.0,
                //         child: Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(25),
                //             border: Border.all(
                //                 color: Colors.purple,
                //                 style: BorderStyle.solid,
                //                 width: 2),
                //           ),
                //           child: ClipRRect(
                //             borderRadius: BorderRadius.circular(30),
                //             child: FlatButton(
                //               color: Colors.grey[350],
                //               onPressed: () {
                //                 setState(() {
                //                   userUpdate.language='E';
                //                   userUpdate.mode='modify';
                //                   userUpdate.screenName='S0002';
                //                   userUpdate.screenObject.id=retrieveList.body.screenData.id;
                //                   userUpdate.screenObject.name=retrieveList.body.screenData.name;
                //                   userUpdate.screenObject.userStatus=retrieveList.body.screenData.userStatus;
                //                   userUpdate.screenObject.dateOfRegistration=retrieveList.body.screenData.dateOfRegistration;
                //                   userUpdate.screenObject.email=retrieveList.body.screenData.email;
                //                   userUpdate.screenObject.phone=retrieveList.body.screenData.phone;
                //                   userUpdate.screenObject.isAdminApproved=retrieveList.body.screenData.isAdminApproved;
                //                   userUpdate.screenObject.dateOfAdminApproval=retrieveList.body.screenData.dateOfAdminApproval;
                //                   userUpdate.screenObject.emailVerified=retrieveList.body.screenData.emailVerified;
                //                   userUpdate.screenObject.isPhoneVerified=retrieveList.body.screenData.isPhoneVerified;
                //                   userUpdate.screenObject.reportsToName=retrieveList.body.screenData.reportsToName;
                //                   userUpdate.screenObject.reportsToId=retrieveList.body.screenData.reportsToId;
                //
                //                   // http://103.14.123.116:8080/timesheetapiuat/adminData/updateScreen
                //                   postHttp('timesheetapiuat/adminData/updateScreen',
                //                       userUpdate)
                //                       .then((value) {
                //                     print(value);
                //
                //
                //
                //                     if(value['status']=='SUCCESS') {
                //                       return showDialog<void>(
                //                         context: context,
                //                         barrierDismissible: false,
                //                         // user must tap button!
                //                         builder: (BuildContext context) {
                //                           return AlertDialog(
                //                             backgroundColor: Colors.grey[350],
                //                             title: Text(
                //                                 'Records have been successfully updated'),
                //                             content: SingleChildScrollView(
                //                               child: ListBody(
                //                                 children: <Widget>[
                //                                   Text('Thank you'),
                //                                 ],
                //                               ),
                //                             ),
                //                             actions: <Widget>[
                //                               FlatButton(
                //                                 child: Text('Ok'),
                //                                 onPressed: () {
                //                                   Navigator.of(context).push(
                //                                       new MaterialPageRoute(
                //                                           builder: (BuildContext
                //                                           context) =>
                //                                               UserListForm()));
                //                                 },
                //                               ),
                //                             ],
                //                           );
                //                         },
                //                       );
                //                     }
                //                     else  if(value['status']!='SUCCESS'){
                //                       Toast.show("Please enter all fields", context,
                //                           duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                //
                //                     }
                //                   });
                //
                //                 });
                //               },
                //               child: Text(
                //                 'Disable',
                //                 textAlign: TextAlign.left,
                //                 style: TextStyle(color: Colors.black),
                //               ),
                //             ),
                //           ),
                //         )),
                //
                //   ],
                // ),
                if(retrieveList.body.screenData.userStatus=='Active')
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
                                    disable.language='E';
                                    disable.mode='disable';
                                    disable.screenName='SM001';
                                    disable.screenObject.id=retrieveList.body.screenData.id;
                                    disable.screenObject.phone=retrieveList.body.screenData.phone;

                                    // http://103.14.123.116:8080/timesheetapiuat/adminData/updateScreen
                                    postHttp('timesheetapiuat/adminData/updateScreen',
                                        disable)
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
                                                                UserListForm()));
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
                                  'Disable',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          )),

                    ],
                  ),

                if(retrieveList.body.screenData.userStatus=='Pending Approval'
                    '')
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
                                    decline.mode='decline';
                                    decline.screenName='S0002';
                                    decline.language="E";
                                    decline.screenObject.id=retrieveList.body.screenData.id;
                                    decline.screenObject.name=retrieveList.body.screenData.name;
                                    decline.screenObject.email=retrieveList.body.screenData.email;
                                    decline.screenObject.phone=retrieveList.body.screenData.phone;
                                    decline.screenObject.isAdminApproved=retrieveList.body.screenData.isAdminApproved;
                                    decline.screenObject.emailVerified=retrieveList.body.screenData.emailVerified;
                                    decline.screenObject.isPhoneVerified=retrieveList.body.screenData.isPhoneVerified;
                                    decline.screenObject.dateOfRegistration=retrieveList.body.screenData.dateOfRegistration;
                                    decline.screenObject.dateOfAdminApproval=retrieveList.body.screenData.dateOfAdminApproval;
                                    decline.screenObject.userStatus=retrieveList.body.screenData.userStatus;
                                    decline.screenObject.reportsToId=retrieveList.body.screenData.reportsToId;
                                    decline.screenObject.reportsToName=retrieveList.body.screenData.reportsToName;
                                    decline.screenObject.pannumber=retrieveList.body.screenData.pannumber;
                                    decline.screenObject.aadharid=retrieveList.body.screenData.aadharid;
                                    decline.screenObject.bankname=retrieveList.body.screenData.bankname;
                                    decline.screenObject.ifsccode=retrieveList.body.screenData.ifsccode;
                                    decline.screenObject.bankAccountNum=retrieveList.body.screenData.bankAccountNum;
                                    decline.screenObject.password=_password.text;


                                    //http://103.14.123.116:8080/timesheetapiuat/adminData/updateScreen
                                    postHttp('timesheetapiuat/adminData/updateScreen',
                                        decline)
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
                                                              UserListForm()));
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
                                  'Decline',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          )),

                    ],
                  ),
                SizedBox(
                  height: 10,
                ),

                if(retrieveList.body.screenData.userStatus=='Pending Approval')
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
                                  print("Helleo ${_password.text}");
                                  approve.mode='approve';
                                  approve.screenName='S0002';
                                  approve.language="E";
                                  approve.screenObject.id=retrieveList.body.screenData.id;
                                  approve.screenObject.name=retrieveList.body.screenData.name;
                                  approve.screenObject.email=retrieveList.body.screenData.email;
                                  approve.screenObject.phone=retrieveList.body.screenData.phone;
                                  approve.screenObject.isAdminApproved=retrieveList.body.screenData.isAdminApproved;
                                  approve.screenObject.emailVerified=retrieveList.body.screenData.emailVerified;
                                  approve.screenObject.isPhoneVerified=retrieveList.body.screenData.isPhoneVerified;
                                  approve.screenObject.dateOfRegistration=retrieveList.body.screenData.dateOfRegistration;
                                  approve.screenObject.dateOfAdminApproval=retrieveList.body.screenData.dateOfAdminApproval;
                                  approve.screenObject.userStatus=retrieveList.body.screenData.userStatus;
                                  approve.screenObject.reportsToId=retrieveList.body.screenData.reportsToId;
                                  approve.screenObject.reportsToName=retrieveList.body.screenData.reportsToName;
                                  approve.screenObject.pannumber=retrieveList.body.screenData.pannumber;
                                  approve.screenObject.aadharid=retrieveList.body.screenData.aadharid;
                                  approve.screenObject.bankname=retrieveList.body.screenData.bankname;
                                 approve.screenObject.ifsccode=retrieveList.body.screenData.ifsccode;
                                 approve.screenObject.bankAccountNum=retrieveList.body.screenData.bankAccountNum;
                                  approve.screenObject.password=_password.text;


                                  //http://103.14.123.116:8080/timesheetapiuat/adminData/updateScreen
                                  postHttp('timesheetapiuat/adminData/updateScreen',
                                      approve)
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
                                                            UserListForm()));
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
                                'Approve',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        )),

                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                if(retrieveList.body.screenData.userStatus=='Declined')
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
                                    deleteUser.mode='delete';
                                    deleteUser.screenName='S0002';
                                    deleteUser.language="E";
                                    deleteUser.screenObject.id=retrieveList.body.screenData.id;
                                    deleteUser.screenObject.name=retrieveList.body.screenData.name;
                                    deleteUser.screenObject.email=retrieveList.body.screenData.email;
                                    deleteUser.screenObject.phone=retrieveList.body.screenData.phone;
                                    deleteUser.screenObject.isAdminApproved=retrieveList.body.screenData.isAdminApproved;
                                    deleteUser.screenObject.emailVerified=retrieveList.body.screenData.emailVerified;
                                    deleteUser.screenObject.isPhoneVerified=retrieveList.body.screenData.isPhoneVerified;
                                    deleteUser.screenObject.dateOfRegistration=retrieveList.body.screenData.dateOfRegistration;
                                    deleteUser.screenObject.dateOfAdminApproval=retrieveList.body.screenData.dateOfAdminApproval;
                                    deleteUser.screenObject.userStatus=retrieveList.body.screenData.userStatus;
                                    deleteUser.screenObject.reportsToId=retrieveList.body.screenData.reportsToId;
                                    deleteUser.screenObject.reportsToName=retrieveList.body.screenData.reportsToName;
                                    deleteUser.screenObject.pannumber=retrieveList.body.screenData.pannumber;
                                    deleteUser.screenObject.aadharid=retrieveList.body.screenData.aadharid;
                                    deleteUser.screenObject.bankname=retrieveList.body.screenData.bankname;
                                    deleteUser.screenObject.ifsccode=retrieveList.body.screenData.ifsccode;
                                    deleteUser.screenObject.bankAccountNum=retrieveList.body.screenData.bankAccountNum;
                                    deleteUser.screenObject.password=_password.text;


                                    //http://103.14.123.116:8080/timesheetapiuat/adminData/updateScreen
                                    postHttp('timesheetapiuat/adminData/updateScreen',
                                        deleteUser)
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
                                                              UserListForm()));
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
                SizedBox(
                  height: 10,
                ),
                if(retrieveList.body.screenData.userStatus=='Pending Verify')
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
                                    activate.mode='activate';
                                    activate.screenName='SM001';
                                    activate.language="E";
                                    activate.screenObject.id=retrieveList.body.screenData.id;
                                    activate.screenObject.phone=retrieveList.body.screenData.phone;


                                    //http://103.14.123.116:8080/timesheetapiuat/adminData/updateScreen
                                    postHttp('timesheetapiuat/adminData/updateScreen',
                                        activate)
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
                                                              UserListForm()));
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
                                  'Activate',
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

      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22),
        backgroundColor: Color(0xFF801E48),
        visible: true,
        curve: Curves.bounceIn,
        children: [
          // FAB 1
          SpeedDialChild(
              child: Icon(Icons.login),
              backgroundColor: Color(0xFF801E48),
              onTap: () {
                setState(() {
                  return showDialog<void>(

                    context: context,
                    barrierDismissible: false,
                    // user must tap button!
                    builder: (BuildContext context) {

                      return AlertDialog(
                        insetPadding: EdgeInsets.symmetric(horizontal: 100,vertical: 100),
                        backgroundColor: Colors.grey[350],
                        title: Text(
                            'Reset 2FA'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('This will send a 2FA to their registered mail'),

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
                              resetAuth.language='E';
                              resetAuth.mode='resetPassword';
                              resetAuth.screenName='SM001';
                              resetAuth.screenObject.id=retrieveList.body.screenData.id.toString();
                              resetAuth.screenObject.phone=retrieveList.body.screenData.phone;

                              postHttp('timesheetapiuat/adminData/updateScreen',
                                  resetAuth)
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
                                            'Successfully sent'),
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
                                                          UserListForm()));
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

                            },
                          ),
                        ],
                      );
                    },
                  );
                });
              },
              label: 'Reset 2FA',
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 16.0),
              labelBackgroundColor: Color(0xFF801E48)),
          // FAB 2
          SpeedDialChild(
              child: Icon(Icons.paste_sharp),
              backgroundColor: Color(0xFF801E48),
              onTap: () {
                setState(() {
                  password.language='E';
                  password.mode='enable';
                  password.screenName='SM001';
                  password.screenObject.id=retrieveList.body.screenData.id.toString();
                  password.screenObject.phone=retrieveList.body.screenData.phone;

                  postHttp('timesheetapiuat/adminData/updateScreen',
                      password)
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
                                'Successfully sent'),
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
                                              UserListForm()));
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
              label: 'Reset Password',
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 16.0),
              labelBackgroundColor: Color(0xFF801E48))
        ],
      ),

      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),

      // This trailing comma makes auto-formatting nicer for build methods.

    );
  }


}
