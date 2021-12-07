import 'package:fit_timesheets/Pages/Admin/Users/viewUserList.dart';
import 'package:fit_timesheets/models/admin/users/addProjectGroup.dart';
import 'package:fit_timesheets/models/admin/users/deleteProj.dart';
import 'package:fit_timesheets/models/admin/users/projectGroupDropDown.dart';
import 'package:fit_timesheets/models/admin/users/projectGroups.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:toast/toast.dart';

import '../../footer.dart';

class ProjectGroupsUserList extends StatefulWidget {
  final int userid;

  const ProjectGroupsUserList({Key key, this.userid}) : super(key: key);
  @override
  _ProjectGroupsUserListState createState() => _ProjectGroupsUserListState(userid);
}
MultiSelectController controller = new MultiSelectController();

class _ProjectGroupsUserListState extends State<ProjectGroupsUserList> {
  final int userid;
  ProjectGroups projectGroups=ProjectGroups();
  int length = 0;
  String dropdown;
  _ProjectGroupsUserListState(this.userid);
  ProjDropDown projDropDown=ProjDropDown();
  DeleteProj delete=DeleteProj();
  AddProjGroupDrop addProjGroupDrop=  AddProjGroupDrop();

  @override
  Widget build(BuildContext context) {
    getHttp2(
        'timesheetapiuat/adminData/getScreen?screenName=S0016&language=E&userid=$userid&mode=display&pageNum=0&pageSize=1000&searchString=&searchCriteria=&firstTime=true')
        .then((apiValue) {
      setState(() {
        projectGroups = ProjectGroups.fromJson(apiValue);
      });
    });
    getHttp2(
        'timesheetapiuat/adminData/getScreen?screenName=S0013&mode=undefined&pageNum=0&pageSize=100&searchString=&searchCriteria=id&firstTime=true')
        .then((apiValue) {

      setState(() {
        projDropDown = ProjDropDown.fromJson(apiValue);
      });
    });


    final ScrollController _scrollController = ScrollController();



    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Project Groups',
          style: TextStyle(
              fontFamily: "Lobster-Regular",
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[900],
        elevation: 0.0,
      ),
      body: Column(
          children: <Widget>[


            Expanded(
                child: Scrollbar(
                    isAlwaysShown: true,
                    controller: _scrollController,
                    child: ListView.builder(
                        itemCount: projectGroups.body.screenData.multiOccData.length,
                        itemBuilder: (context, int position) {

                          return InkWell(

                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.white, width: 1),
                                  borderRadius:
                                  BorderRadius.circular(14),
                                ),
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           UpdateError(
                                  //               update:
                                  //               getErrorList.body.screenData.multiOccData[
                                  //               position]),
                                  //     )
                                  // );
                                },
                                subtitle: new Row(children: <Widget>[
                                  Text('${projectGroups.body.screenData.multiOccData[position].id}     '),



                                ]),
                                title: new Row(
                                  children: <Widget>[
                                    Text(
                                      '${projectGroups.body.screenData.multiOccData[position].name}',
                                      style: TextStyle(
                                          fontFamily: "DancingScript-VariableFont_wght",
                                          fontSize: 15,

                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                trailing: new Column(children: <Widget>[

                                  IconButton(
                                      tooltip: 'Delete',
                                      icon: Icon(
                                        Icons.delete_forever,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          delete.screenObject.userid=userid.toString();
                                          delete.screenObject.id=projectGroups.body.screenData.multiOccData[position].id;
                                          delete.screenObject.name=projectGroups.body.screenData.multiOccData[position].name;
                                          delete.screenName='S0016';
                                          delete.language='E';
                                          delete.mode='delete';
                                          return showDialog<void>(

                                              context: context,
                                              barrierDismissible: false,
                                              // user must tap button!
                                              builder: (BuildContext context) {




                                                return Screenshot(
                                                  // controller:_screenshotController ,

                                                    child: RepaintBoundary(
                                                      //key: scr1,
                                                        child:
                                                        AlertDialog(

                                                          backgroundColor: Colors.grey[350],
                                                          title: Text(
                                                              'Do you want to delete the corresponding error'),

                                                          actions: <Widget>[

                                                            FlatButton(

                                                              child: Text('Cancel'),
                                                              onPressed: () {
                                                                Navigator.pop(context);

                                                              },
                                                            ),
                                                            // FlatButton(
                                                            //   child: Text('Confirm'),
                                                            //   onPressed: ()  {
                                                            //     postHttp(
                                                            //         'timesheetapiuat/eror/updateScreen',
                                                            //         deleteError)
                                                            //         .then((value) {
                                                            //       print(value);
                                                            //       if(value['status']=='SUCCESS'){
                                                            //         return showDialog<void>(
                                                            //           context: context,
                                                            //           barrierDismissible: false,
                                                            //           // user must tap button!
                                                            //           builder: (
                                                            //               BuildContext context) {
                                                            //             return AlertDialog(
                                                            //               backgroundColor: Colors
                                                            //                   .grey[350],
                                                            //               title: Text(
                                                            //                   'Records have been successfully uploaded'),
                                                            //               content: SingleChildScrollView(
                                                            //                 child: ListBody(
                                                            //                   children: <
                                                            //                       Widget>[
                                                            //                     Text(
                                                            //                         'Thank you'),
                                                            //                   ],
                                                            //                 ),
                                                            //               ),
                                                            //               actions: <Widget>[
                                                            //                 FlatButton(
                                                            //                   child: Text(
                                                            //                       'Ok'),
                                                            //                   onPressed: () {
                                                            //                     Navigator
                                                            //                         .of(
                                                            //                         context)
                                                            //                         .push(
                                                            //                         new MaterialPageRoute(
                                                            //                             builder: (
                                                            //                                 BuildContext
                                                            //                                 context) =>
                                                            //                                 ProjectGroupsUserList())
                                                            //                     );
                                                            //                   },
                                                            //                 ),
                                                            //               ],
                                                            //             );
                                                            //           },
                                                            //         );}
                                                            //       else  if(value['status']!='SUCCESS'){
                                                            //         Toast.show("Something went wrong,please try again", context,
                                                            //             duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                                                            //
                                                            //       }
                                                            //     });
                                                            //
                                                            //
                                                            //
                                                            //
                                                            //
                                                            //
                                                            //
                                                            //   },
                                                            // ),

                                                          ],
                                                        )));

                                              });
                                        },
                                        );

                                        new Text(
                                          "",
                                          style: TextStyle(
                                              fontSize: 2,
                                              color: Colors.black),
                                        );

                                      })]),
                              )

                          );
                        })))]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: Colors.purple[900],
        onPressed: () {
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
                      'Add Project'),
                  content: SingleChildScrollView(
                    child: ListBody(
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
                                            projDropDown
                                                .body
                                                .screenData
                                                .multiOccData.length -
                                                1;
                                        length++)

                                          projDropDown
                                                  .body
                                                  .screenData
                                                  .multiOccData[length]
                                                  .id.toString() +'-'+
                                          projDropDown.body.screenData.multiOccData[length].name


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
                                      hint: "Project Group",
                                      style: TextStyle(
                                          fontFamily: "DancingScript-VariableFont_wght",
                                          color: Colors.black),
                                      searchHint: "Search Project",
                                      onChanged: (value) {
                                        setState(() {
                                          dropdown = value;
                                          var arr = dropdown.split(
                                              '-');
                                          addProjGroupDrop.screenObject
                                              .id = int.parse(arr[0]) ;
                                          addProjGroupDrop.screenObject
                                              .name = arr[1];

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
                        addProjGroupDrop.language='E';
                        addProjGroupDrop.mode='create';
                        addProjGroupDrop.screenName='S0016';
                        addProjGroupDrop.screenObject.userid=userid.toString();
                        postHttp('timesheetapiuat/adminData/updateScreen',
                            addProjGroupDrop)
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

                      },
                    ),
                  ],
                );
              },
            );

          });
        },
      ),
      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),

    );


  }



}

