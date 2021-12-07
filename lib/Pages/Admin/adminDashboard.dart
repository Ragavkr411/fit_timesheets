import 'package:fit_timesheets/Pages/Admin/Activities/activitiesList.dart';
import 'package:fit_timesheets/Pages/Admin/Errors/errorList.dart';
import 'package:fit_timesheets/Pages/Admin/ProjectGroups/projectGroupsList.dart';
import 'package:fit_timesheets/Pages/Admin/Projects/prjectListForm.dart';
import 'package:fit_timesheets/Pages/Admin/Users/viewUserList.dart';
import 'package:fit_timesheets/models/admin/projects/projectList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../footer.dart';
import 'Parameters/parametersList.dart';
import 'SubProject/getSubProject.dart';

class AdminDashBoard extends StatefulWidget {
//   final OrderItem orderItem;

//   OrderItemTile(this.title);

  @override
  _ItemTileState createState() => _ItemTileState();
}

class _ItemTileState extends State<AdminDashBoard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        title: Text(
          'Admin',
          style: TextStyle(
              fontFamily: "Lobster-Regular",
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),

      ),
    body:   AnimatedContainer(
      duration: Duration(milliseconds: 300),


      child: Card(
        elevation: 5,
        color: Theme.of(context).canvasColor,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: <Widget>[
            ListTile(
              onTap: (){
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UserListForm()),

                  );

                });
              },
              title: (Text(
                'Users',
                style: TextStyle(
                    fontFamily: "Lobster-Regular",
                    fontSize: 22, fontWeight: FontWeight.bold),
              )),
              leading: IconButton(
                tooltip: 'Menu bar',
                icon: Icon(
                  Icons.supervised_user_circle_sharp,
                  color: Colors.purple[900],
                ),
                onPressed: () {
                  setState(() {

                  });
                },
              ),
              trailing:  IconButton(
                tooltip: 'Users',
                icon: Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {

                  });
                },
              ),

            ),
            Divider(),
            ListTile(
              onTap: (){
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProjectListForm()),

                  );

                });
              },
              title: (Text(
                'Projects',
                style: TextStyle(
                    fontFamily: "Lobster-Regular",
                    fontSize: 22, fontWeight: FontWeight.bold),
              )),
              leading: IconButton(
                tooltip: 'Menu bar',
                icon: Icon(
                  Icons.paste_rounded,
                  color: Colors.purple[900],
                ),
                onPressed: () {
                  setState(() {

                  });
                },
              ),
              trailing:  IconButton(
                tooltip: 'Projects',
                icon: Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {

                  });
                },
              ),

            ),
            Divider(),
            ListTile(
              onTap: (){
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SubProjectListForm()),

                  );

                });
              },
              leading: IconButton(
                tooltip: 'Menu bar',
                icon: Icon(
                  Icons.subject_outlined,
                  color: Colors.purple[900],
                ),
                onPressed: () {
                  setState(() {
                  });
                },
              ),
              title: (Text(
                'Subprojects',
                style: TextStyle(
                    fontFamily: "Lobster-Regular",
                    fontSize: 22, fontWeight: FontWeight.bold),
              )),
              trailing:  IconButton(
                tooltip: 'Subprojects',
                icon: Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {

                  });
                },
              ),

            ),
            Divider(),
            ListTile(
              onTap: (){
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                    ActivitiesList()),

                  );

                });
              },
              title: (Text(
                'Activities',
                style: TextStyle(
                    fontFamily: "Lobster-Regular",
                    fontSize: 22, fontWeight: FontWeight.bold),
              )),
              leading: IconButton(
                tooltip: 'Menu bar',
                icon: Icon(
                  Icons.local_activity_outlined,
                  color: Colors.purple[900],
                ),
                onPressed: () {
                  setState(() {

                  });
                },
              ),
              trailing:  IconButton(
                tooltip: 'Activities',
                icon: Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {

                  });
                },
              ),

            ),
            Divider(),
            ListTile(
              onTap: (){
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProjectGroupList()),

                  );
                });
              },
              leading: IconButton(
                tooltip: 'Menu bar',
                icon: Icon(
                  Icons.group_work_rounded,
                  color: Colors.purple[900],
                ),
                onPressed: () {
                  setState(() {

                  });
                },
              ),
              title: (Text(
                'Project Groups',
                style: TextStyle(
                    fontFamily: "Lobster-Regular",
                    fontSize: 22, fontWeight: FontWeight.bold),
              )),
              trailing:  IconButton(
                tooltip: 'Project Groups',
                icon: Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {

                  });
                },
              ),

            ),
            Divider(),
            ListTile(
              onTap: (){
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ParameterListForm()),

                  );

                });
              },
              leading: IconButton(
                tooltip: 'Menu bar',
                icon: Icon(
                  Icons.compare_arrows,
                  color: Colors.purple[900],
                ),
                onPressed: () {
                  setState(() {
                  });
                },
              ),
              title: (Text(
                'Parameters',
                style: TextStyle(
                    fontFamily: "Lobster-Regular",
                    fontSize: 22, fontWeight: FontWeight.bold),
              )),
              trailing:  IconButton(
                tooltip: 'Parameters',
                icon: Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {

                  });
                },
              ),

            ),
            Divider(),
            ListTile(
              onTap: (){
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ErrorList()),

                  );
                });
              },
              leading: IconButton(
                tooltip: 'Menu bar',
                icon: Icon(
                  Icons.error_outline_sharp,
                  color: Colors.purple[900],
                ),
                onPressed: () {
                  setState(() {

                  });
                },
              ),
              title: (Text(
                'Errors',
                style: TextStyle(
                    fontFamily: "Lobster-Regular",
                    fontSize: 22, fontWeight: FontWeight.bold),
              )),
              trailing:  IconButton(
                tooltip: 'Errors',
                icon: Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {

                  });
                },
              ),

            ),
            Divider(),
            ListTile(
              onTap: (){
                setState(() {

                });
              },
              leading: IconButton(
                tooltip: 'Menu bar',
                icon: Icon(
                  Icons.format_align_justify_outlined,
                  color: Colors.purple[900],
                ),
                onPressed: () {
                  setState(() {
                  });
                },
              ),
              title: (Text(
                'Jobs',
                style: TextStyle(fontFamily: "Lobster-Regular",
                    fontSize: 22, fontWeight: FontWeight.bold),
              )),
              trailing:  IconButton(
              tooltip: 'Jobs',
              icon: Icon(
                Icons.arrow_right,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {

                });
              },
            ),

            ),
            Divider(),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: _expanded
                  ? 300
                  : 0,
              width: MediaQuery.of(context).size.width,
              // child: ItemExpandedTile(),
            )
          ],
        ),
      ),
    ),
      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),

    );

  }
}
// class ItemExpandedTile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       child: Stack(
//         children: <Widget>[
//           Positioned(
//             top: 5,
//             child: Container(
//               height: 90,
//               width: MediaQuery.of(context).size.width - 75,
//               padding: EdgeInsets.all(10),
//               decoration: new BoxDecoration(
//                 color: Theme.of(context).canvasColor,
//                 borderRadius: BorderRadius.circular(15),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey,
//                     blurRadius: 15.0,
//                     spreadRadius: 0.5,
//                     offset: Offset(
//                       1.0,
//                       1.0,
//                     ),
//                   )
//                 ],
//               ),
//               child: Row(
//                 children: <Widget>[
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       Text(
//                         'Title',
//                         style: TextStyle(
//                             fontSize: 12, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }