import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:fit_timesheets/Pages/Reimbursement/reimbursementTab.dart';
import 'package:fit_timesheets/models/reimbursement/delete/delete.dart';
import 'package:fit_timesheets/models/reimbursement/getReimbursementMultiOccData.dart';
import 'package:fit_timesheets/models/reimbursement/modify.dart';
import 'package:fit_timesheets/models/reimbursement/update/update.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../footer.dart';


class RetrieveList extends StatefulWidget {
  final ReimbMultiOccData reimbList;

  const RetrieveList({Key key, this.reimbList}) : super(key: key);

  @override
  _RetrieveListState createState() => _RetrieveListState(reimbList);
}

class _RetrieveListState extends State<RetrieveList> {
  final ReimbMultiOccData reimbList;
  File local_images;
  String generatedPdfFilePath;
  Future getImage() async {
    File picture = (await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50));
    setState(() {
      local_images = picture;
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this.local_images = image;
      print("FILENAME: " + basename(image.path));
      reimbList.image = basename(image.path);

      final encode = base64Encode(local_images.readAsBytesSync());
      //reimbList.image = "data:image/jpeg;base64,$encode";
    });
  }

  bool checked = false;
  bool drop = true;

  _RetrieveListState(this.reimbList);

  String buttonText = "Edit";
  DateTime date2;
  int total;
  ModifyReimbursement retrieveList=ModifyReimbursement();
  Delete delete=Delete();
  Update update=Update();
  @override
  Widget build(BuildContext context) {
    print('month ${reimbList.month}');
    String month =reimbList.month;

    String uri = 'data:image/gif;base64,${reimbList.image}';
    Uint8List _bytes;
    _bytes = base64.decode(uri.split(',').last);

    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    getHttp2(
        'timesheet/getScreen?screenName=S0018&userid=6&year=${reimbList.year}&month=${reimbList.month}&language=E&mode=modify&pageNum=0&pageSize=5&searchString=&searchCriteria=&firstTime=true')
        .then((apiValue) {

      setState(() {
        retrieveList = ModifyReimbursement.fromJson(apiValue);

      });

    });

    for(int i=0;i<=retrieveList.body.screenData.multiOccData.length-1;i++){
      total =i;
    }

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
      ),
      body: SingleChildScrollView(
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(children: <Widget>[
            Theme(
              child: TextFormField(
                enabled: true,
                initialValue: '${retrieveList.body.screenData.multiOccData[total].rimbtypeid}',
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  update.screenObject.rimbtypeid=v;

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
                  labelText: 'Reimbursement',
                  hintText: 'Enter Amount',
                  prefixIcon: const Icon(
                    Icons.all_inbox_outlined,
                    color: Colors.black,
                  ),
                   labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght",)
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
                initialValue: '${retrieveList.body.screenData.multiOccData[total].rimbtypedesc}',
                //keyboardType: TextInputType.number,
                enabled: true,
                onChanged: (v) {
                  setState(() {
                  update.screenObject.rimbtypedesc=v;

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
                  labelText: 'Reimbursement Description',
                  hintText: 'Enter Comments',
                  prefixIcon: const Icon(
                    Icons.comment,
                    color: Colors.black,
                  ),
                  labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght",)
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
                  initialValue: '${retrieveList.body.screenData.multiOccData[total].examount}',
                  keyboardType: TextInputType.number,
                  enabled: checked,
                  onChanged: (v) {
                    setState(() {
                      update.screenObject.examount=v;

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
                    labelText: 'Amount',
                    hintText: 'Enter Amount',
                    prefixIcon: const Icon(
                      Icons.attach_money,
                      color: Colors.black,
                    ),
                  labelStyle: TextStyle(fontFamily: "DancingScript-VariableFont_wght",)
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
            Column(
              children: <Widget>[
                if (checked == false)
                  IconButton(
                    icon: const Icon(Icons.volume_up),
                    tooltip: 'Increase volume by 10',
                    onPressed: () {
                      setState(() {






    //                     return showDialog<void>(
    //                       context: context,
    //                       barrierDismissible: false,
    //                       // user must tap button!
    //                       builder: (BuildContext context) {
    //                         // return AlertDialog(
    //                         //   backgroundColor: Colors.grey[350],
    //                         //   title: Text(
    //                         //       'Records have been successfully updated'),
    //                         //   content: SingleChildScrollView(
    //                         //     child: ListBody(
    //                         //       children: <Widget>[
    //                         //         GestureDetector(
    //                         //           onTap: () {
    //                         //
    //                         //           },
    //                         //           child: Image.network('timesheet/getImage?year=2021&month=09&rimbtypeid=ISP&mode=display',
    //                         //               fit: BoxFit.cover,
    //                         //               height: 60.0, width: 60.0)) ,
    //                         //       ],
    //                         //     ),
    //                         //   ),
    //                         //   actions: <Widget>[
    //                         //     FlatButton(
    //                         //       child: Text('Ok'),
    //                         //       onPressed: () {
    //                         //         Navigator.of(context).push(
    //                         //             new MaterialPageRoute(
    //                         //                 builder: (BuildContext
    //                         //                 context) =>
    //                         //                     ReimbursementTabView()));
    //                         //       },
    //                         //     ),
    //                         //   ],
    //                         // );
    //                       },
    //
    //
    // );
                      });
                      },
                  ),

                  // GestureDetector(
                  //   onTap: () {
                  //
                  //   },
                  //   child: Container(
                  //     height: 300,
                  //     width: halfMediaWidth * 1.5,
                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.purple),
                  //       borderRadius: BorderRadius.circular(25.0),
                  //     ), //             <--- BoxDecoration here
                  //     child: Container(
                  //       margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  //       width: 500.0,
                  //       height: 500.0,
                  //       child: Image.memory(_bytes),
                  //     ),
                  //   ),
                  // ),
                if (checked == true)
                  GestureDetector(
                    onTap: () {
                      getImageFromGallery();
                    },
                    child: Container(
                      height: 400,
                      width: halfMediaWidth * 1.9,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple,width: 2),
                        //borderRadius: BorderRadius.circular(25.0),
                      ), //             <--- BoxDecoration here
                      child: local_images == null
                          ? Row(
                              children: [
                                Icon(Icons.image),
                                Text("Click to select image")
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            )
                          : Image.file(
                              local_images,
                              width: halfMediaWidth,
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
              ],
            ),



            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            if (reimbList.status != 'APPROVED')
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

                                if (reimbList.status != 'APPROVED') {
                                  if (checked == false || drop == true) {

                                    checked = true;
                                    drop = false;
                                    checked == true
                                        ? buttonText = "Cancel"
                                        : buttonText = "Cancel";
                                  } else {
                                    checked = false;
                                    drop = true;
                                    checked == false
                                        ? buttonText = "Edit"
                                        : buttonText = "Cancel";
                                  }
                                }

                               });
                            },
                            child: Text(
                              buttonText,
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      )),

                ],
              ),
            if (checked==true)
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
                  child:
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ProgressButton(


                      // color: Colors.purple[900],
                      defaultWidget:
                      const Text('Update', style: TextStyle(color: Colors.black)),
                      progressWidget: const CircularProgressIndicator(
                          backgroundColor: Colors.red,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.purple)),
                      width: 114,



                      onPressed: () async {
                        await Future.delayed(
                            const Duration(milliseconds: 4000), () {
                          if (reimbList.status != 'APPROVED') {
                            if (checked == true) {


                              setState(() {


                                update.screenName='S0018';
                                update.mode='modify';
                                update.language='E';
                                update.screenObject.proofDocumentExist=true;
                                update.headerMode='modify';
                                update.headerFieldMap.month=reimbList.month;
                                update.headerFieldMap.year=reimbList.year;
                                update.respondWithSummary=true;
                                update.screenObject.rimbtypeid=retrieveList.body.screenData.multiOccData[total].rimbtypeid;
                                update.screenObject.rimbtypedesc=retrieveList.body.screenData.multiOccData[total].rimbtypedesc;
                                postHttp('timesheet/updateScreen',
                                    update)
                                    .then((value) {
                                  print('helllo ${update.screenObject.examount}');
                                  print('hello $value');

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
                                                          ReimbursementTabView()));
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                });
                              });
                            }
                          }

                        });
                      },
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            if (checked==true)
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
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: ProgressButton(


                        // color: Colors.purple[900],
                        defaultWidget:
                        const Text('Delete', style: TextStyle(color: Colors.black)),
                        progressWidget: const CircularProgressIndicator(
                            backgroundColor: Colors.red,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.purple)),
                        width: 114,



                        onPressed: () async {

                          await Future.delayed(
                              const Duration(milliseconds: 10), () {
                            if (reimbList.status != 'APPROVED') {
                              if (checked == true) {

                                setState(() {
                                  delete.headerFieldMap.month=reimbList.month;
                                  delete.mode='delete';
                                  delete.headerFieldMap.year=reimbList.year;
                                  delete.screenName='S0018';
                                  delete.headerMode='modify';
                                  delete.respondWithSummary=true;
                                  delete.language='E';
                                  delete.screenObject.rimbtypeid=retrieveList.body.screenData.multiOccData[total].rimbtypeid;
                                  delete.screenObject.examount=retrieveList.body.screenData.multiOccData[total].examount;





                                  postHttp('timesheet/updateScreen',
                                      delete)
                                      .then((value) {


                                    print('hell $value');
                                    return showDialog<void>(
                                      context: context,
                                      barrierDismissible: false,
                                      // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.grey[350],
                                          title: Text(
                                              'Record is successfully deleted'),
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
                                                            ReimbursementTabView()));
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  });
                                });
                              }
                            }

                          });
                        },
                      ),
                    ),
                  ))
          ]),
        )),
      ),
      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),

       // This trailing comma makes auto-formatting nicer for build methods.

    );
  }


}
