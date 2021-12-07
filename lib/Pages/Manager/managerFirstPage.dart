import 'package:fit_timesheets/Pages/Manager/ManagerApproval.dart';
import 'package:fit_timesheets/models/getTimeSheet/getDetails.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color mainColor = Color(0xFF796A9D);

class ManagerFirstPage extends StatefulWidget {
  @override
  _ManagerFirstPageState createState() => _ManagerFirstPageState();
}

String formattedDate2;

class _ManagerFirstPageState extends State<ManagerFirstPage> {
  GetTimeSheet getTimeSheetModel = GetTimeSheet();

  @override
  Widget build(BuildContext context) {
    getHttp2(
        'timesheet/getScreen?screenName=S0006&language=E&mode=undefined&pageNum=0&pageSize=5&searchString=&searchCriteria=&firstTime=true')
        .then((apiValue) {
      getTimeSheetModel = GetTimeSheet.fromJson(apiValue);

      setState(() {});
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        title: Text(
          'TimeSheet Search',
          style: TextStyle(
              fontFamily: "Lobster-Regular",
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Scrollbar(
            isAlwaysShown: true,
            //  controller: _scrollController,
            child: ListView.builder(
                itemCount:
                getTimeSheetModel.body.screenData.multiOccData.length,
                itemBuilder: (context, int position) {
                  DateTime todayDate = DateTime.parse(getTimeSheetModel
                      .body.screenData.multiOccData[position].enddate);
                  final DateFormat formatter = DateFormat('dd-MM-yyyy');
                  final String formatted = formatter.format(todayDate);
                  return Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.indigo),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.white24))),
                            child: Text(
                              " ${getTimeSheetModel.body.screenData.multiOccData[position].userid}",
                              style: TextStyle(
                                  fontFamily: "DancingScript-VariableFont_wght",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text(
                            " ${getTimeSheetModel.body.screenData.multiOccData[position].name}",
                            style: TextStyle(
                                fontFamily: "DancingScript-VariableFont_wght",
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                          subtitle:  Column(
                              children:[
                                Row(
                                  children: <Widget>[
                                    if(getTimeSheetModel.body.screenData.multiOccData[position].status=='Approved')
                                      IconButton(
                                        icon: Image.asset('assets/icons/aoo.png'),

                                      ),
                                    if(getTimeSheetModel.body.screenData.multiOccData[position].status=='Pending')
                                      IconButton(
                                        icon: Image.asset('assets/icons/pen.png'),

                                      ),

                                    if(getTimeSheetModel.body.screenData.multiOccData[position].status=='Submitted')
                                      IconButton(
                                        icon: Image.asset('assets/icons/submitted.png'),

                                      ),

                                    Text(
                                        " ${getTimeSheetModel.body.screenData.multiOccData[position].approvedBy}",
                                        style: TextStyle(fontFamily: "DancingScript-VariableFont_wght",color: Colors.white)),
                                  ],
                                ),
                                Text(
                                    "             ${getTimeSheetModel.body.screenData.multiOccData[position].statusDate}",
                                    style: TextStyle(fontFamily: "DancingScript-VariableFont_wght",color: Colors.white)),

                              ]
                          ),

                          trailing: IconButton(
                            icon: const Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ManagerApproval(
                                      getTimeSheetModel: getTimeSheetModel.body
                                          .screenData.multiOccData[position]),
                                ),
                              );
                            },
                          ),
                        ),
                      ));
                })),
      ),
    );
  }
}
