import 'package:fit_timesheets/Pages/Admin/Activities/activitiesEntryForm.dart';
import 'package:fit_timesheets/Pages/Admin/Projects/projectRetrieve.dart';
import 'package:fit_timesheets/Pages/Admin/Users/addUser.dart';
import 'package:fit_timesheets/Pages/Admin/Users/modifyUser.dart';
import 'package:fit_timesheets/Pages/footer.dart';
import 'package:fit_timesheets/models/admin/projects/projectList.dart';
import 'package:fit_timesheets/models/admin/users/getUsersList.dart';
import 'package:fit_timesheets/models/admin/users/viewUser.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class UserListForm extends StatefulWidget {
  @override
  _UserListFormState createState() => _UserListFormState();
}
MultiSelectController controller = new MultiSelectController();

class _UserListFormState extends State<UserListForm> {

  GetUsersList usersList= GetUsersList();
  @override
  Widget build(BuildContext context) {
    getHttp2(
        'timesheetapiuat/adminData/getScreen?screenName=S0001&language=E&mode=undefined&pageNum=0&pageSize=1000&searchString=&searchCriteria=&firstTime=true')
        .then((apiValue) {
      setState(() {
        usersList = GetUsersList.fromJson(apiValue);
      });
    });
    print(usersList.body.screenData.multiOccData.length);


    final ScrollController _scrollController = ScrollController();



    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
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
                        itemCount: usersList.body.screenData.multiOccData.length,
                        itemBuilder: (context, int position) {

                          return InkWell(
                              child: Card(
                              elevation: 18.0,
                              margin: new EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 6.0),
                          child: Container(
                          decoration: BoxDecoration(
                            color: (position % 2 == 0) ? Colors.purple[900] : Colors.purple[400],),
                          child:
                          ListTile(
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
                                            ModifyUserForm(
                                                activitiesList:
                                                usersList.body.screenData.multiOccData[
                                                position]),
                                      )
                                  );
                                },
                                subtitle: new Row(children: <Widget>[
                                  Text('${usersList.body.screenData.multiOccData[position].email}', style: TextStyle(

                                      fontFamily: "DancingScript-VariableFont_wght",
                                      fontSize: 14,


                                      color: Colors.white),),



                                ]),
                                title: new Row(
                                  children: <Widget>[
                                Container(
                                margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            width: 32,
                            height: 35,
                            child: Center(
                              child:  Text(
                                '${usersList.body.screenData.multiOccData[position].id}',
                                style: TextStyle(
                                    fontFamily: "DancingScript-VariableFont_wght",
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,

                                    color: Colors.white),
                              ),





                              ),

                            decoration: BoxDecoration(
                              border:Border.all(width:3),
                              borderRadius: BorderRadius.all(

                                Radius.circular(50),
                              ),
                              color: Colors.purpleAccent,
                            ),
                          ),
                                    Text(
                                      '${usersList.body.screenData.multiOccData[position].name}',
                                      style: TextStyle(
                                          fontFamily: "DancingScript-VariableFont_wght",
                                          fontSize: 16,

                                          color: Colors.white),
                                    ), ]),





                                trailing: new Column(children: <Widget>[
                                  new Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 6,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '${usersList.body.screenData.multiOccData[position].phone}',
                                    style: TextStyle(
                                        fontFamily: "DancingScript-VariableFont_wght",
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white),
                                  ),
                                  new Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 2,
                                        color: Colors.black),
                                  ),
                                  new Text(
                                    '${usersList.body.screenData.multiOccData[position].userStatus}',
                                    style: TextStyle(
                                        fontFamily: "DancingScript-VariableFont_wght",
                                        fontSize: 15,
                                        color: Colors.white),
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
                        AddUser()));

          });
        },
      ),
      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),

    );


  }



}

