
import 'package:fit_timesheets/Pages/TimeSheet/timesheetMainPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../footer.dart';

const Color mainColor = Color(0xFF796A9D);

class TimeSheetUpdateForm extends StatefulWidget {
  @override
  TimeSheetUpdateFormState createState() => TimeSheetUpdateFormState();
}



class TimeSheetUpdateFormState extends State<TimeSheetUpdateForm> {


  bool enabled=false;

  List<TimesheetCard> timeSheetCard=[];
  @override
  Widget build(BuildContext context) {


    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Entry ',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[900],
        elevation: 0.0,
      ),
      body:SingleChildScrollView(child:



      Flexible(child: Column(
        children: <Widget>[
          Card(
            child: Container(
              padding: EdgeInsets.all(12),
              child:SingleChildScrollView(child:



              Flexible(child: Column(
                children: <Widget>[
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.purple[900], width: 3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: <Widget>[

                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 60,
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        color: Colors.purple,
                                        style: BorderStyle.solid,
                                        width: 1.5),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      DropdownButton(
                                        underline: SizedBox(),
                                        isExpanded: true,
                                        // value: models.reimb,
                                        // items: items2,
                                        hint: Container(
                                          width: 200, //and here
                                          child: Text(
                                            "Select Project Type",
                                            style: TextStyle(color: Colors.grey),
                                            textAlign: TextAlign.start,
                                          ),


                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            //models.reimb = value;
                                          });
                                        },

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
                            height: 10,
                          ),
                          Theme(
                            child: TextField(
                              // controller: _amount,
                              keyboardType: TextInputType.number,
                              cursorColor: mainColor,
                              onChanged: (v) {
                                //  models.amount = double.parse(v);
                                //  models.status="PENDING";
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
                                labelText: 'Project/Sub-Project Name',
                                hintText: 'Project/Sub-Project Name',
                                prefixIcon: const Icon(
                                  Icons.assignment,
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
                          // new Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: <Widget>[
                          //     new Flexible(
                          //       child: new   Theme(
                          //         child: DateTimePickerFormField(
                          //           //  controller: _dateCtl,
                          //           inputType: InputType.date,
                          //           format: DateFormat("dd-MM-yyyy"),
                          //           editable: false,
                          //           decoration: InputDecoration(
                          //             disabledBorder: OutlineInputBorder(
                          //               borderRadius: BorderRadius.circular(25.0),
                          //               borderSide: BorderSide(color: Colors.purple, width: 1.5),
                          //             ),
                          //             enabledBorder: OutlineInputBorder(
                          //               borderRadius: BorderRadius.circular(25.0),
                          //               borderSide: BorderSide(color: Colors.purple, width: 1.5),
                          //             ),
                          //             border: OutlineInputBorder(
                          //               borderRadius: BorderRadius.circular(25.0),
                          //               borderSide: BorderSide(color: Colors.purple, width: 2.0),
                          //             ),
                          //             labelText: 'Date',
                          //             prefixIcon: const Icon(
                          //               Icons.calendar_today,
                          //               color: Colors.black,
                          //             ),
                          //           ),
                          //           onChanged: (v) {
                          //             setState(() {
                          //               // date2 = v;
                          //               // models.date = _dateCtl.text;
                          //             });
                          //           },
                          //         ),
                          //         data: Theme.of(context).copyWith(
                          //           primaryColor: Colors.redAccent,
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(width: 20.0,),
                          //     new Flexible(
                          //       child: new  Theme(
                          //         child:  Row(
                          //           children: [
                          //             SizedBox(
                          //               width: 5,
                          //             ),
                          //             Expanded(
                          //               child: Theme(
                          //                 data: ThemeData(primaryColor: Colors.purple),
                          //                 child:  SpinBox(
                          //                   min: 0,
                          //                   max: 15,
                          //                   value: 0,
                          //                   direction: Axis.horizontal,
                          //                   textStyle: TextStyle(fontSize: 20),
                          //                   incrementIcon: Icon(Icons.keyboard_arrow_up, size: 20),
                          //                   decrementIcon: Icon(Icons.keyboard_arrow_down, size: 20),
                          //                   onChanged: (v){
                          //
                          //                     //     model.noc2= _noc2.text;
                          //
                          //                   },
                          //                   decoration: InputDecoration(
                          //                     disabledBorder: OutlineInputBorder(
                          //                       borderRadius: BorderRadius.circular(25.0),
                          //                       borderSide: BorderSide(color: Colors.purple, width: 1.5),
                          //                     ),
                          //                     enabledBorder: OutlineInputBorder(
                          //                       borderRadius: BorderRadius.circular(25.0),
                          //                       borderSide: BorderSide(color: Colors.purple, width: 1.5),
                          //                     ),
                          //                     border: OutlineInputBorder(
                          //                       borderRadius: BorderRadius.circular(25.0),
                          //                     ),
                          //
                          //
                          //                   ),
                          //                 ),
                          //
                          //               ),
                          //
                          //             ),
                          //             SizedBox(
                          //               width: 5,
                          //             ),
                          //
                          //           ],
                          //         ),
                          //         data: Theme.of(context).copyWith(
                          //           primaryColor: Colors.redAccent,
                          //         ),
                          //       ),
                          //     ),
                          //
                          //
                          //
                          //
                          //   ],
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          Theme(
                            child: TextField(
                              // controller: _amount,
                              keyboardType: TextInputType.number,
                              cursorColor: mainColor,
                              onChanged: (v) {
                                //  models.amount = double.parse(v);
                                //  models.status="PENDING";
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
                                labelText: 'Comments',
                                hintText: 'Comments',
                                prefixIcon: const Icon(
                                  Icons.comment,
                                  color: Colors.black,
                                ),

                              ),


                            ),
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.redAccent,
                            ),
                          ),

                          Text('\n'),
                        ],
                      ),

                    ),
                  ),

                ],
              ),)



              ),
            ),
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
                      child: FlatButton(
                        color: Colors.grey[350],
                        onPressed: () {
                          setState(() {

                          });
                        },
                        child: Text(
                          'Clear',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  )),
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
                              // postHttp('updateScreen',
                              //     models)
                              //     .then((value) {
                              //   return showDialog<void>(
                              //     context: context,
                              //     barrierDismissible: false,
                              //     // user must tap button!
                              //     builder: (BuildContext context) {
                              //       return AlertDialog(
                              //         backgroundColor: Colors.grey[350],
                              //         title: Text(
                              //             'Records have been successfully uploaded'),
                              //         content: SingleChildScrollView(
                              //           child: ListBody(
                              //             children: <Widget>[
                              //               Text('Thank you'),
                              //             ],
                              //           ),
                              //         ),
                              //         actions: <Widget>[
                              //           FlatButton(
                              //             child: Text('Ok'),
                              //             onPressed: () {
                              //               // Navigator.of(context).push(
                              //               //     new MaterialPageRoute(
                              //               //         builder: (BuildContext
                              //               //         context) =>
                              //               //            );
                              //             },
                              //           ),
                              //         ],
                              //       );
                              //     },
                              //   );
                              // });
                            });
                          },
                          child: Text(
                            'Submit',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ))),
            ],
          ),


        ],
      ),)



      ),
      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),

    );
  }

}