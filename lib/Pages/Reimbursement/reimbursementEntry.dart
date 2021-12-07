import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:path/path.dart';
import 'package:fit_timesheets/Pages/Reimbursement/reimbursementTab.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:fit_timesheets/models/reimbursement/addReimb/addItems.dart';
import 'package:fit_timesheets/models/reimbursement/addReimb/dropdown.dart';
import 'package:fit_timesheets/models/reimbursement/addReimb/month.dart';
import 'package:fit_timesheets/models/reimbursement/addReimb/year.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import '../footer.dart';

const Color mainColor = Color(0xFF796A9D);

class ReimbursementForm extends StatefulWidget {
  @override
  ReimbursementFormState createState() => ReimbursementFormState();
}

class ReimbursementFormState extends State<ReimbursementForm> {

  final _screenshotController = ScreenshotController();
  bool screenshot=true;
  GlobalKey scr = GlobalKey();
  GlobalKey scr1 = GlobalKey();
  File local_imagess;
  Image imagea;
String yearReimb;
String monthReimb;
String reimb;
String reimbDesc;
  Future getImage() async {
    File picture = (await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50));
    setState(() {
      local_imagess = picture;
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this.local_imagess = image;

     addItems.screenObject.image = basename(image.path);

      final encode = base64Encode(local_imagess.readAsBytesSync());
      addItems.screenObject.image = "data:image/jpeg;base64,$encode";
    });
  }

  DateTime date2;
  TextEditingController _amount = TextEditingController();
  TextEditingController _comment = TextEditingController();
  TextEditingController _reimType = TextEditingController();
  TextEditingController _employee = TextEditingController();
  TextEditingController _image = TextEditingController();

  TextEditingController _dateCtl = TextEditingController();
Year year=Year();
Month month=Month();
AddItems addItems=AddItems();
  ReimbDropDown reimbDropDown=ReimbDropDown();
  @override
  Widget build(BuildContext context) {
    int length = 0;
    getHttp2(
        'timesheetapiuat/params/paramItemsForDropdown?pageNum=0&pageSize=5&language=E&paramNameEquals=T0004&company=2&getSearchfields=true&descType=short')
        .then((apiValue) {


      setState(() {
        year = Year.fromJson(apiValue);});

    });
    getHttp2(
        'timesheetapiuat/params/paramItemsForDropdown?pageNum=0&pageSize=5&language=E&paramNameEquals=T0003&company=2&getSearchfields=true&descType=short')
        .then((apiValue) {


      setState(() {
        month = Month.fromJson(apiValue);});

    });
    getHttp2(
        'timesheetapiuat/params/paramItemsForDropdown?pageNum=0&pageSize=5&language=E&paramNameEquals=T0005&company=2&getSearchfields=true&descType=short')
        .then((apiValue) {


      setState(() {
        reimbDropDown = ReimbDropDown.fromJson(apiValue);});

    });
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;



    @override
    void initState() {
      super.initState();

    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reimbursement ',
          style: TextStyle(
              fontFamily: "Lobster-Regular",
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[900],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
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
                                  year.body.data.length-1;
                              length++)
                                year.body.data[length].itemitem



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
                          //  value: dropdown,
                            hint: "Select Reimbursement Year",
                            style: TextStyle(
                                fontFamily: "DancingScript-VariableFont_wght",
                                color: Colors.black),
                            searchHint: "Search year",
                            onChanged: (value) {
                              setState(() {
                                yearReimb=value;

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
              SizedBox(
                height: 10,
              ),
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
                                  month.body.data.length-1;
                              length++)
                                month.body.data[length].itemitem+' '+
                                    month.body.data[length].description




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
                            //  value: dropdown,
                            hint: "Select Reimbursement Month",
                            style: TextStyle(
                                fontFamily: "DancingScript-VariableFont_wght",
                                color: Colors.black),
                            searchHint: "Search month",
                            onChanged: (value) {
                              setState(() {
                                monthReimb=value;

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
              SizedBox(
                height: 10,
              ),
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
                                  reimbDropDown.body.data.length-1;
                              length++)
                                reimbDropDown.body.data[length].itemitem+' '+
                                    reimbDropDown.body.data[length].description




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
                            //  value: dropdown,
                            hint: "Select Reimbursement Code",
                            style: TextStyle(
                                fontFamily: "DancingScript-VariableFont_wght",
                                color: Colors.black),
                            searchHint: "Search code",
                            onChanged: (value) {
                              setState(() {
                                reimb=value;

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

              SizedBox(
                height: 10,
              ),
              Theme(
                child: TextField(
                  controller: _amount,
                  keyboardType: TextInputType.number,
                  cursorColor: mainColor,
                  onChanged: (v) {


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

                  ),


                ),
                data: Theme.of(context).copyWith(
                  primaryColor: Colors.redAccent,
                ),
              ),
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 10,
              ),
              // Theme(
              //   child: TextField(
              //     onTap: (){
              //       setState(() {
              //         DatePicker.showDatePicker(context,
              //             showTitleActions: true,
              //             theme: DatePickerTheme(
              //                 headerColor: Colors.indigoAccent,
              //                 backgroundColor: Colors.purple[900],
              //                 itemStyle: TextStyle(
              //                     color: Colors.white,
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 25),
              //                 cancelStyle: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 20),
              //                 doneStyle: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 20)),
              //             minTime: DateTime(2018, 3, 5),
              //             maxTime: DateTime.now(),
              //             onChanged: (date) {
              //               print('change $date');
              //             }, onConfirm: (date) {
              //               setState(() {
              //                 print(date);
              //                 String formattedDate =
              //                 DateFormat('dd-MM-yyyy').format(date);
              //                 _dateCtl.text=formattedDate;
              //                 date2 = date;
              //
              //
              //               });
              //
              //
              //             },
              //             currentTime: DateTime.now(),
              //             locale: LocaleType.en);
              //       });
              //     },
              //     controller: _dateCtl,
              //     cursorColor: mainColor,
              //     onChanged: (v) {
              //     },
              //     decoration: InputDecoration(
              //       disabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(25.0),
              //         borderSide: BorderSide(color: Colors.purple, width: 1.5),
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(25.0),
              //         borderSide: BorderSide(color: Colors.purple, width: 1.5),
              //       ),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(25.0),
              //       ),
              //       labelText: 'Date',
              //       hintText: 'Enter Date',
              //       prefixIcon: IconButton(
              //         icon: const Icon(Icons.calendar_today_outlined),
              //         color: Colors.black,
              //         onPressed: () {
              //
              //         },
              //       ),
              //
              //     ),
              //
              //
              //   ),
              //   data: Theme.of(context).copyWith(
              //     primaryColor: Colors.redAccent,
              //   ),
              // ),
              //  TextButton(
              //         onPressed: () {
              //
              //
              //         },
              //         child: Text(
              //            '${_dateCtl.text}',
              //
              //           //initialValue: _dateCtl.text,
              //           style: TextStyle(color: Colors.blue),
              //
              //         )),
              // SizedBox(
              //   height: 10,
              // ),
              // Theme(
              //   child: DateTimePickerFormField(
              //     controller: _dateCtl,
              //     inputType: InputType.date,
              //     format: DateFormat("dd-MM-yyyy"),
              //     editable: false,
              //     decoration: InputDecoration(
              //       disabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(25.0),
              //         borderSide: BorderSide(color: Colors.purple, width: 1.5),
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(25.0),
              //         borderSide: BorderSide(color: Colors.purple, width: 1.5),
              //       ),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(25.0),
              //         borderSide: BorderSide(color: Colors.purple, width: 2.0),
              //       ),
              //       labelText: 'Reimbursement Date',
              //       prefixIcon: const Icon(
              //         Icons.calendar_today,
              //         color: Colors.black,
              //       ),
              //     ),
              //     onChanged: (v) {
              //       setState(() {
              //         date2 = v;
              //         models.date = _dateCtl.text;
              //       });
              //     },
              //   ),
              //   data: Theme.of(context).copyWith(
              //     primaryColor: Colors.redAccent,
              //   ),
              // ),

              SizedBox(
                height: 10,
              ),

              GestureDetector(
                onTap: () {
                  getImageFromGallery();
                },
                child: Container(
                  height: 400,
                  width: halfMediaWidth * 1.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.purple,
                        width: 2
                    ),
                    // borderRadius: BorderRadius.circular(25.0),
                  ), //             <--- BoxDecoration here
                  child: local_imagess == null
                      ? Row(
                    children: [
                      Icon(Icons.image),
                      Text("Click to select image")
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )
                      : Image.file(
                    local_imagess,
                    width: halfMediaWidth * 1.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
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
                                print('heeee$yearReimb');
                                print('heeee$monthReimb');
                                print('heeee$reimb');
                                print('heeee$reimbDesc');

                                _employee.text = '';
                                _comment.text = '';
                                _dateCtl.text = '';
                                _reimType.text = ' ';
                                _image.text = '';
                                _amount.text = '';
                                this.local_imagess = null;
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
                            child:  ProgressButton(


                              // color: Colors.purple[900],
                              defaultWidget:
                              const Text('Submit', style: TextStyle(color: Colors.black)),
                              progressWidget: const CircularProgressIndicator(
                                  backgroundColor: Colors.red,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple)),
                              width: 114,



                              onPressed: () async {
                                String finalMonth;
                                var mon=monthReimb.split(' ');
                                finalMonth=mon[0];
                                String finalId;
                                var rid=reimb.split(' ');
                                finalId=rid[0];
                                reimbDesc=rid[1];

                                await Future.delayed(
                                    const Duration(milliseconds: 20), () {
                                  return showDialog<void>(

                                    context: context,
                                    barrierDismissible: false,
                                    // user must tap button!
                                    builder: (BuildContext context) {




                                      return Screenshot(
                                          controller:_screenshotController ,

                                          child: RepaintBoundary(
                                              key: scr1,
                                              child: AlertDialog(

                                                backgroundColor: Colors.grey[350],
                                                title: Text(
                                                    'Confirm Details'),
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: <Widget>[
                                                      Text('Total Amount: ${_amount.text}'),
                                                      Text('Year: ${yearReimb.toString()}'),
                                                      Text('Month: ${reimb.toString()}'),

                                                      Text('\nImage:'),
                                                      if(local_imagess!=null)
                                                        Container(
                                                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                                          width: 500.0,
                                                          height: 500.0,
                                                          child: Image.file(local_imagess),
                                                        ),


                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  // if(screenshot=true)
                                                  // IconButton(
                                                  //   icon: const  Image(image: AssetImage('assets/icons/ss.png'),width: 30,height: 30,),
                                                  //
                                                  //   color: Colors.green,
                                                  //   tooltip: 'Take Screenshot',
                                                  //   onPressed: () {
                                                  //     setState(() {
                                                  //
                                                  //
                                                  //     });
                                                  //   },
                                                  // ),

                                                  // IconButton(
                                                  //   icon: const  Image(image: AssetImage('assets/icons/share4.png'),width: 30,height: 30,),
                                                  //
                                                  //   color: Colors.green,
                                                  //   tooltip: 'Share Details',
                                                  //   onPressed: () {
                                                  //     setState(() {
                                                  //      // saveScreen1();
                                                  //          _takeScreenshot();
                                                  //     });
                                                  //   },
                                                  // ),
                                                  FlatButton(

                                                    child: Text('Cancel'),
                                                    onPressed: () {
                                                      Navigator.pop(context);

                                                    },
                                                  ),
                                                  FlatButton(
                                                    child: Text('Confirm'),
                                                    onPressed: () async {
                                                      var month=monthReimb.split(' ');
                                                      var rei=reimb.split(' ');

                                                      addItems.screenName='S0018';
                                                      addItems.language='E';
                                                      addItems.mode='create';
                                                      addItems.screenObject.examount=_amount.text;
                                                      addItems.screenObject.rimbtypedesc=rei[1];
                                                      addItems.screenObject.rimbtypeid=rei[0];
                                                      addItems.headerMode='create';
                                                      addItems.headerFieldMap.month=month[0];
                                                      addItems.headerFieldMap.year=yearReimb;
                                                   //   addItems.screenObject.image=local_imagess.toString();
                                                      postHttp('timesheetapiuat/timesheet/updateScreen',
                                                          addItems)
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


                                                    },
                                                  ),

                                                ],
                                              )) );
                                    },
                                  );

                                });
                              },
                            ),
                          ))),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),
    );
  }

  multipartProdecudre() async {
    var request =  http.MultipartRequest(
        'POST', Uri.parse("http://103.14.123.116:8080/timesheetapi/timesheet/updateScreenWithMultiPart")

    );
    request.headers['Authorization'] ='Bearer ${user.accessToken}';
    request.fields['body'] = "$addItems";

    request.files.add(await http.MultipartFile.fromPath(
        'file',
        local_imagess.path
    )
    );
    var response = await request.send();
    print(response.stream);
    print(response.statusCode);
    final res = await http.Response.fromStream(response);
    print(res.body);


//     var postUri = Uri.parse("http://103.14.123.116:8080/timesheetapi/timesheet/updateScreenWithMultiPart");
//     var headers = {
//       'Authorization': 'Bearer ${user.accessToken}'
//     };
//     http.MultipartRequest request = new http.MultipartRequest("POST", postUri);
//     request.headers.addAll(headers);
//     http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
//         'file', local_imagess.path);
// request.fields['body']='$addItems';
//     request.files.add(multipartFile);
//
//     http.StreamedResponse response = await request.send();
//
//
//     print(response.statusCode);
    // var postUri = Uri.parse("<APIUrl>");
    // var request = new http.MultipartRequest("POST", postUri);
    // request.fields['body'] = "$addItems";
    // request.files.add(new http.MultipartFile.fromBytes('file', await File.fromRawPath(local_imagess.readAsBytesSync()).readAsBytes()));
    //
    // request.send().then((response) {
    //   if (response.statusCode == 200) print("Uploaded!");
    // });
    // var headers = {
    //   'Authorization': 'Bearer ${user.accessToken}'
    // };
    // var request = http.MultipartRequest('POST', Uri.parse('http://103.14.123.116:8080/timesheetapi/timesheet/updateScreenWithMultiPart'));
    // request.fields.addAll({
    //   'body': '{"screenName":"S0018","language":"E","mode":"create","screenObject":{"rimbtypedesc":"Petrol Reimbursement","image":null,"examount":"300","rimbtypeid":"Pet","inlineActionDisabled":"","proofDocumentExist":true},"headerMode":"create","headerFieldMap":{"month":"10","year":"2021","userid":"6","status":"PN","monthdesc":"October"},"respondWithSummary":true}'
    // });
    // request.files.add(await http.MultipartFile.fromBytes('file',local_imagess.writeAsBytesSync()));
    // request.headers.addAll(headers);
    //
    // http.StreamedResponse response = await request.send();
    //
    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    // }
    // else {
    //   print(response.statusCode);
    // }
    //
    //
    //
    // final uri = 'http://103.14.123.116:8080/timesheetapi/timesheet/updateScreenWithMultiPart';
    // var map = new Map<String, dynamic>();
    // map['body'] = '{"screenName":"S0018","language":"E","mode":"create","screenObject":{"rimbtypedesc":"Petrol Reimbursement","image":null,"examount":"300","rimbtypeid":"Pet","inlineActionDisabled":"","proofDocumentExist":true},"headerMode":"create","headerFieldMap":{"month":"10","year":"2021","userid":"6","status":"PN","monthdesc":"October"},"respondWithSummary":true}';
    // map['file'] = local_imagess.toString();
    // http.Response response = await http.post(
    //   uri,
    //   body: map,
    // );
    // print(response.body);

  }
  // launchWhatsApp() async {
  //   final link = WhatsAppUnilink(
  //     phoneNumber: '+918825761193',
  //     text: "Hi sir i have submitted my reimbursement for ${models.reimb.name} with the total ₹${_amount.text}.\n Thanks & Regards,\n ${user.username}",
  //
  //   );
  //   await launch('$link');
}
