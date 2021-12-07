
import 'package:fit_timesheets/models/admin/projectGroups/createProjGroup.dart';
import 'package:fit_timesheets/models/admin/projectGroups/updateProjGroup.dart';
import 'package:fit_timesheets/models/admin/users/projectGroups.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:toast/toast.dart';

import '../../footer.dart';
import 'activities.dart';

class ProjectGroupList extends StatefulWidget {
  @override
  _ProjectGroupListState createState() => _ProjectGroupListState();
}
MultiSelectController controller = new MultiSelectController();

class _ProjectGroupListState extends State<ProjectGroupList> {

  ProjectGroups projectGroups= ProjectGroups();
  CreateProjGroup create=CreateProjGroup();
  CreateProjGroup delete= CreateProjGroup();
  CreateProjGroup update=CreateProjGroup();
  TextEditingController _textFieldController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    getHttp2(
        'timesheetapiuat/adminData/getScreen?screenName=S0013&language=E&mode=undefined&pageNum=0&pageSize=1000&searchString=&searchCriteria=&firstTime=true')
        .then((apiValue) {
      setState(() {
        projectGroups = ProjectGroups.fromJson(apiValue);
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

                              child: Card(
                              elevation: 8.0,
                              margin: new EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: Container(
                          decoration: BoxDecoration(
                          color: (position % 2 == 0) ? Colors.deepPurple[400] : Colors.deepPurple[200],),
                          child: ListTile(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.white, width: 1),
                                  borderRadius:
                                  BorderRadius.circular(14),
                                ),
                                onTap: () {
                                  return showDialog(

                                    context: context,
                                    //barrierDismissible: false, // dialog is dismissible with a tap on the barrier
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Update Project Group'),
                                        content: new Column(
                                          children: [
                                                TextFormField(
                                                  enabled: false,
                                                  decoration: new InputDecoration(
                                                      labelText: 'Group Id', hintText: 'Group Id'),
                                                  onChanged: (value) {
                                                    update.screenObject.id=int.parse(value);
                                                  },
                                                  initialValue: '${projectGroups.body.screenData.multiOccData[position].id}',
                                                ),

                                              TextFormField(
                                                autofocus: true,
                                                decoration: new InputDecoration(
                                                    labelText: 'Group Name', hintText: 'Group Name'),
                                                onChanged: (value) {
                                                  update.screenObject.name = value;
                                                },
                                                initialValue: '${projectGroups.body.screenData.multiOccData[position].name}',

                                              ),

                                          ],
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            color: Colors.red,
                                            textColor: Colors.white,
                                            child: Text('CANCEL'),
                                            onPressed: () {
                                              setState(() {
                                                Navigator.pop(context);
                                              });
                                            },
                                          ),
                                          FlatButton(
                                            color: Colors.green,
                                            textColor: Colors.white,
                                            child: Text('OK'),
                                            onPressed: () {
                                              setState(() {
                                                update.screenName='S0014';
                                                update.mode='modify';
                                                update.language='E';
                                                update.screenObject.id=projectGroups.body.screenData.multiOccData[position].id;
                                                postHttp(
                                                    'timesheetapiuat/adminData/updateScreen',
                                                    update)
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
                                                                            ProjectGroupList())
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


                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
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
                                trailing:  Wrap(
                                  spacing: 1,
                                  children: <Widget>[


                                  IconButton(
                                      tooltip: 'Activities',
                                      icon: Icon(
                                        Icons.local_activity_outlined,
                                        color: Colors.green,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ActivityProjList(
                                                        id:
                                                        projectGroups.body.screenData.multiOccData[
                                                        position].id.toString()),
                                              )
                                          );

                                        },
                                        );

                                        new Text(
                                          "",
                                          style: TextStyle(
                                              fontSize: 2,
                                              color: Colors.black),
                                        );

                                      }),
                                  IconButton(
                                  tooltip: 'Delete',
                                  icon: Icon(
                                    Icons.delete_forever,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      delete.screenObject.id=projectGroups.body.screenData.multiOccData[position].id;
                                      delete.screenObject.name=projectGroups.body.screenData.multiOccData[position].name;
                                      delete.screenName='S0014';
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
                                                          'Do you want to delete the corresponding group'),

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
                                                                'timesheetapiuat/eror/updateScreen',
                                                                delete)
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
                                                                                        ProjectGroupList())
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

                                  }),


                                ],


                                ),
                              )

                          )));
                        })))]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: Colors.purple[900],
        onPressed: () {
          setState(() {
            _displayTextInputDialog(context);


          });
        },
      ),
      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),

    );


  }


  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Group'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  create.screenObject.name=value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Group Name"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    create.language='E';
                    create.screenName='S0014';
                    create.mode='create';
                    postHttp(
                        'timesheetapiuat/adminData/updateScreen',
                        create)
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
                                                ProjectGroupList())
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


                  });
                },
              ),
            ],
          );
        });
  }
}

