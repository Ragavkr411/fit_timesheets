import 'package:fit_timesheets/Pages/Admin/ProjectGroups/updateActivityProjGroup.dart';
import 'package:fit_timesheets/models/admin/projectGroups/activitiesProjGroup.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'addActivityProjGroup.dart';


const Color mainColor = Color(0xFF796A9D);

class ActivityProjList extends StatefulWidget {
  final String id;

  const ActivityProjList({Key key, this.id}) : super(key: key);
  @override
  _ActivityProjListState createState() => _ActivityProjListState(id);
}

String formattedDate2;

class _ActivityProjListState extends State<ActivityProjList> {

final String id;
  ActivitiesProjGroupModel activityObject = ActivitiesProjGroupModel();
  _ActivityProjListState(this.id);

  @override
  void initState() {
    super.initState();
    // Setting the initial value for the field.
  }

  @override
  Widget build(BuildContext context) {

    getHttp2(
        'timesheetapiuat/adminData/getScreen?screenName=S0015&groupid=$id&language=E&mode=display&pageNum=0&pageSize=1000&searchString=&searchCriteria=&firstTime=true')
        .then((apiValue) {
      setState(() {
        activityObject = ActivitiesProjGroupModel.fromJson(apiValue);
      });
    });

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
      body: Column(
        children: [
          Flexible(
            child: Scrollbar(
                isAlwaysShown: true,
                //  controller: _scrollController,
                child: ListView.builder(
                    itemCount:
                    activityObject.body.screenData.multiOccData.length,
                    itemBuilder: (context, int position) {
                     String endDate= activityObject.body.screenData.multiOccData[position].enddate;

                     String finalEndDate=endDate.substring(6,8)+'/'+endDate.substring(4,6)+'/'+endDate.substring(0,4);
                     String startDate= activityObject.body.screenData.multiOccData[position].startdate;

                     String finalStartDate=startDate.substring(6,8)+'/'+startDate.substring(4,6)+'/'+startDate.substring(0,4);
                     return Column(
                        children: [
                          Container(
                              child: InkWell(
                                onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UpdateActivityProjList(
                                            retrieveObject: activityObject
                                                .body
                                                .screenData
                                                .multiOccData[position]),
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
                                                        '${activityObject.body.screenData.multiOccData[position].activityid}' +
                                                            '-${activityObject.body.screenData.multiOccData[position].activityname}',
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
                                                        '${activityObject.body.screenData.multiOccData[position].subprojectid}' +
                                                            '-${activityObject.body.screenData.multiOccData[position].subprojectname}',
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
                                                        '${activityObject.body.screenData.multiOccData[position].projectid}' +
                                                            '-${activityObject.body.screenData.multiOccData[position].projectname}',
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

                        ],
                      );
                    })),
          ),

        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: Colors.purple[900],
        onPressed: () {
          setState(() {
            Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        AddActivityProjGroup(
                          id: id
                        )));

          });
        },
      ),

    );
  }



}
