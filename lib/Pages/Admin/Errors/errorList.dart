import 'package:fit_timesheets/Pages/Admin/Activities/activitiesEntryForm.dart';
import 'package:fit_timesheets/Pages/Admin/Errors/updateError.dart';
import 'package:fit_timesheets/models/admin/errors/deleteError.dart';
import 'package:fit_timesheets/models/admin/errors/getErrorList.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:toast/toast.dart';
import '../../footer.dart';
import 'addError.dart';

class ErrorList extends StatefulWidget {
  @override
  _ErrorListState createState() => _ErrorListState();
}
MultiSelectController controller = new MultiSelectController();

class _ErrorListState extends State<ErrorList> {

  GetErrorList getErrorList= GetErrorList();

  DeleteError deleteError= DeleteError();
  @override
  Widget build(BuildContext context) {
    getHttp2(
        'timesheetapiuat/eror/getScreen?screenName=S0052&language=E&mode=undefined&pageNum=0&pageSize=1000&searchString=&searchCriteria=&firstTime=true')
        .then((apiValue) {
      setState(() {
        getErrorList = GetErrorList.fromJson(apiValue);
      });
    });



    final ScrollController _scrollController = ScrollController();



    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Errors',
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
                        itemCount: getErrorList.body.screenData.multiOccData.length,
                        itemBuilder: (context, int position) {

                          return InkWell(
                              child: Card(
                              elevation: 8.0,
                              margin: new EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: Container(
                          decoration: BoxDecoration(
                          color: (position % 2 == 0) ? Colors.amber[300] : Colors.amber[100],),
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
                                            UpdateError(
                                                update:
                                                getErrorList.body.screenData.multiOccData[
                                                position]),
                                      )
                                  );
                                },
                                subtitle: new Row(children: <Widget>[
                                   Text('${getErrorList.body.screenData.multiOccData[position].erordesc}     '),



                                ]),
                                title: new Row(
                                  children: <Widget>[
                                    Text(
                                      '${getErrorList.body.screenData.multiOccData[position].eroreror}',
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
                                        deleteError.screenObject.erordesc=getErrorList.body.screenData.multiOccData[position].erordesc;
                                        deleteError.screenObject.eroreror=getErrorList.body.screenData.multiOccData[position].eroreror;
                                        deleteError.screenName='S0052';
                                        deleteError.language='E';
                                        deleteError.mode='delete';
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
                                            FlatButton(
                                              child: Text('Confirm'),
                                              onPressed: ()  {
                                                postHttp(
                                                    'timesheetapiuat/eror/updateScreen',
                                                    deleteError)
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
                                                                            ErrorList())
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

    })]),
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
                        AddError()));

          });
        },
      ),
      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),

    );


  }



}

