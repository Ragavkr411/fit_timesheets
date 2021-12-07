import 'package:fit_timesheets/Pages/Admin/Activities/activitiesEntryForm.dart';
import 'package:fit_timesheets/Pages/Admin/Projects/projectRetrieve.dart';
import 'package:fit_timesheets/Pages/footer.dart';
import 'package:fit_timesheets/models/admin/projects/projectList.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addProject.dart';

class ProjectListForm extends StatefulWidget {
  @override
  _ProjectFormListState createState() => _ProjectFormListState();
}
MultiSelectController controller = new MultiSelectController();

class _ProjectFormListState extends State<ProjectListForm> {

  ProjectList projects= ProjectList();
  @override
  Widget build(BuildContext context) {
    getHttp2(
        'timesheetapiuat/adminData/getScreen?screenName=S0007&language=E&mode=undefined&pageNum=0&pageSize=1000&searchString=&searchCriteria=&firstTime=true')
        .then((apiValue) {
      setState(() {
        projects = ProjectList.fromJson(apiValue);
      });
    });
    print(projects.body.screenData.multiOccData.length);


    final ScrollController _scrollController = ScrollController();



    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Projects',
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
                        itemCount: projects.body.screenData.multiOccData.length,
                        itemBuilder: (context, int position) {

                          return InkWell(
                              child: Card(
                              elevation: 8.0,
                              margin: new EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: Container(
                          decoration: BoxDecoration(
                          color: (position % 2 == 0) ? Colors.indigo[400] : Colors.indigo[100],),
                          child: ListTile(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.white, width: 1),
                                  borderRadius:
                                  BorderRadius.circular(14),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProjectRetrieve(
                                                activitiesList:
                                                projects.body.screenData.multiOccData[
                                                position]),
                                      )
                                  );
                                },
                                subtitle: new Row(children: <Widget>[
                                  Text('${projects.body.screenData.multiOccData[position].startdate}     '),



                                ]),
                                title: new Row(
                                  children: <Widget>[
                                    Text(
                                      '${projects.body.screenData.multiOccData[position].name}',
                                      style: TextStyle(
                                          fontFamily: "DancingScript-VariableFont_wght",
                                          fontSize: 15,

                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                trailing: new Column(children: <Widget>[
                                  new Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 6,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '${projects.body.screenData.multiOccData[position].projectid}',
                                    style: TextStyle(
                                        fontFamily: "DancingScript-VariableFont_wght",
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                  new Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 2,
                                        color: Colors.black),
                                  ),
                                  new Text(
                                    '${projects.body.screenData.multiOccData[position].enddate}',
                                    style: TextStyle(
                                        fontFamily: "DancingScript-VariableFont_wght",
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                ]),
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
            Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ProjectEntry()));

          });
        },
      ),
      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),

    );


  }



}

