
import 'package:fit_timesheets/models/admin/parameters/parametersItemsList.dart';
import 'package:fit_timesheets/models/admin/parameters/parametersList.dart';
import 'package:fit_timesheets/models/admin/parameters/updatetable2.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:http/http.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:toast/toast.dart';
import '../../footer.dart';

class ParameterItemsListForm extends StatefulWidget {
  final DataUpdate update;

  const ParameterItemsListForm({Key key, this.update}) : super(key: key);
  @override
  _ParameterItemsListFormState createState() => _ParameterItemsListFormState(update);
}
MultiSelectController controller = new MultiSelectController();

class _ParameterItemsListFormState extends State<ParameterItemsListForm> {
  final DataUpdate update;
  ParametersItemsList parameter= ParametersItemsList();

  UpdateParamsTable updateTable=UpdateParamsTable();
  UpdateParamsTable add=UpdateParamsTable();
  UpdateParamsTable clone=UpdateParamsTable();

  _ParameterItemsListFormState(this.update);


  @override
  Widget build(BuildContext context) {
    TextEditingController _company=TextEditingController(text: update.itemcoy);
    TextEditingController _tabl=TextEditingController(text: update.itemtabl);
    TextEditingController _longDesc=TextEditingController();
    TextEditingController _item=TextEditingController();
    TextEditingController _short=TextEditingController();
    TextEditingController _flag=TextEditingController(text: '1');

    getHttp2(
        'timesheetapiuat/params/paramItems?pageNum=0&pageSize=1000&language=E&paramNameEquals=${update.itemtabl}&company=${update.itemcoy}&getSearchfields=true')
        .then((apiValue) {
      setState(() {
        parameter = ParametersItemsList.fromJson(apiValue);


      });
    });

    final ScrollController _scrollController = ScrollController();


    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Parameters',
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
                        itemCount: parameter.body.data.length,
                        itemBuilder: (context, int position) {

                          return InkWell(

                              child: Card(
                              elevation: 8.0,
                              margin: new EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: Container(
                          decoration: BoxDecoration(
                          color: (position % 2 == 0) ? Colors.purple[400] : Colors.purple[100],),
                          child: ListTile(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.white, width: 1),
                                  borderRadius:
                                  BorderRadius.circular(14),
                                ),
                                onTap: () {

                                },
                                subtitle: new Row(children: <Widget>[
                                  Text('${parameter.body.data[position].longdesc}' + '      '),



                                ]),
                                title: new Row(
                                  children: <Widget>[
                                    Text(
                                      '${parameter.body.data[position].shortdesc}',
                                      style: TextStyle(
                                          fontFamily: "DancingScript-VariableFont_wght",
                                          fontSize: 15,

                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                trailing:
                                Wrap(
                                  spacing: 1,
                                  children: <Widget>[


                                    IconButton(
                                        tooltip: 'Activities',
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            return showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                //context: _scaffoldKey.currentContext,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    contentPadding: EdgeInsets.only(left: 25, right: 25),
                                                    title: Center(child: Text("Edit")),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                                    content: Container(
                                                      height: 600,
                                                      width: 300,
                                                      child: SingleChildScrollView(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                          children: <Widget>[
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Theme(
                                                              child: TextFormField(
                                                                //  controller: _desc,
                                                                //keyboardType: TextInputType.number,
                                                                // cursorColor: mainColor,

                                                                onChanged: (v) {


                                                                },
                                                                enabled: false,
                                                                initialValue:parameter.body.data[position].itemcoy ,
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

                                                                  labelText: 'Company',
                                                                  hintText: 'Enter Error Description',
                                                                  prefixIcon: const Icon(
                                                                    Icons.description_outlined,
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
                                                            Theme(
                                                              child: TextFormField(
                                                                //  controller: _desc,
                                                                //keyboardType: TextInputType.number,
                                                                // cursorColor: mainColor,

                                                                onChanged: (v) {


                                                                },
                                                                enabled: false,
                                                                initialValue:parameter.body.data[position].itemtabl ,
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

                                                                  labelText: 'Parameter Name',
                                                                  hintText: 'Enter Error Description',
                                                                  prefixIcon: const Icon(
                                                                    Icons.description_outlined,
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
                                                            Theme(
                                                              child: TextFormField(
                                                                //  controller: _desc,
                                                                //keyboardType: TextInputType.number,
                                                                // cursorColor: mainColor,

                                                                onChanged: (v) {


                                                                },
                                                                enabled: false,
                                                                initialValue:parameter.body.data[position].itemitem ,
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

                                                                  labelText: 'Param Item Name',
                                                                  hintText: '',
                                                                  prefixIcon: const Icon(
                                                                    Icons.description_outlined,
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
                                                            Theme(
                                                              child: TextFormField(
                                                                //  controller: _desc,
                                                                //keyboardType: TextInputType.number,
                                                                // cursorColor: mainColor,

                                                                onChanged: (v) {
                                                                  updateTable.longdesc=v;


                                                                },
                                                                initialValue:parameter.body.data[position].longdesc ,
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

                                                                  labelText: 'Long Desc',
                                                                  hintText: 'Enter Long Desc',
                                                                  prefixIcon: const Icon(
                                                                    Icons.description_outlined,
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
                                                            Theme(
                                                              child: TextFormField(
                                                                //  controller: _desc,
                                                                //keyboardType: TextInputType.number,
                                                                // cursorColor: mainColor,

                                                                onChanged: (v) {
                                                                  updateTable.shortdesc=v;


                                                                },
                                                                initialValue:parameter.body.data[position].shortdesc ,
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

                                                                  labelText: 'Short Desc',
                                                                  hintText: 'Enter Short Desc',
                                                                  prefixIcon: const Icon(
                                                                    Icons.description_outlined,
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
                                                            Theme(
                                                              child: TextFormField(
                                                                //  controller: _desc,
                                                                //keyboardType: TextInputType.number,
                                                                // cursorColor: mainColor,

                                                                onChanged: (v) {
                                                                  updateTable.validflag=v;


                                                                },
                                                                initialValue:parameter.body.data[position].validflag,
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

                                                                  labelText: 'Valid Flag',
                                                                  hintText: 'Enter Valid Flag',
                                                                  prefixIcon: const Icon(
                                                                    Icons.description_outlined,
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

                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: <Widget>[
                                                          Container(
                                                            width: MediaQuery.of(context).size.width * 0.20,
                                                            child: RaisedButton(
                                                              child: new Text(
                                                                'Update',
                                                                style: TextStyle(color: Colors.white),
                                                              ),
                                                              color: Color(0xFF121A21),
                                                              shape: new RoundedRectangleBorder(
                                                                borderRadius: new BorderRadius.circular(30.0),
                                                              ),
                                                              onPressed: () {
                                                                setState(() {
                                                                  updateTable.itemtabl=update.itemtabl;
                                                                  updateTable.itemcoy=update.itemcoy;
                                                                  updateTable.itemitem=update.itemitem;
                                                                  updateTable.language='E';
                                                                  updateTable.itmto=update.itmto;
                                                                  updateTable.itmfrm=update.itmfrm;
                                                                  updateTable.itempfx="IT";
                                                                  updateTable.itemseq=update.itemseq;
                                                                  updateTable.longdesc=update.longdesc;
                                                                  updateTable.shortdesc=update.shortdesc;
                                                                  updateTable.validflag=update.validflag;

                                                                  putHttp(
                                                                      'timesheetapiuat/params/paramItem',
                                                                      updateTable)
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
                                                                                              ParameterItemsListForm())
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
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(context).size.width * 0.01,
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 70.0),
                                                            child: Container(
                                                              width: MediaQuery.of(context).size.width * 0.20,
                                                              child: RaisedButton(
                                                                child: new Text(
                                                                  'Cancel',
                                                                  style: TextStyle(color: Colors.white),
                                                                ),
                                                                color: Color(0xFF121A21),
                                                                shape: new RoundedRectangleBorder(
                                                                  borderRadius: new BorderRadius.circular(30.0),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.of(context).pop();
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: MediaQuery.of(context).size.height * 0.02,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  );
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

                                    IconButton(
                                        tooltip: 'Activities',
                                        icon: Icon(
                                          Icons.copy,
                                          color: Colors.green,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            return showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                //context: _scaffoldKey.currentContext,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    contentPadding: EdgeInsets.only(left: 25, right: 25),
                                                    title: Center(child: Text("Clone")),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                                    content: Container(
                                                      height: 600,
                                                      width: 300,
                                                      child: SingleChildScrollView(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                          children: <Widget>[
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Theme(
                                                              child: TextFormField(
                                                                //  controller: _desc,
                                                                //keyboardType: TextInputType.number,
                                                                // cursorColor: mainColor,

                                                                onChanged: (v) {


                                                                },
                                                                enabled: false,
                                                                initialValue:parameter.body.data[position].itemcoy ,
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

                                                                  labelText: 'Company',
                                                                  hintText: 'Enter Error Description',
                                                                  prefixIcon: const Icon(
                                                                    Icons.description_outlined,
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
                                                            Theme(
                                                              child: TextFormField(
                                                                //  controller: _desc,
                                                                //keyboardType: TextInputType.number,
                                                                // cursorColor: mainColor,

                                                                onChanged: (v) {


                                                                },
                                                                enabled: false,
                                                                initialValue:parameter.body.data[position].itemtabl ,
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

                                                                  labelText: 'Parameter Name',
                                                                  hintText: 'Enter Error Description',
                                                                  prefixIcon: const Icon(
                                                                    Icons.description_outlined,
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
                                                            Theme(
                                                              child: TextFormField(
                                                                //  controller: _desc,
                                                                //keyboardType: TextInputType.number,
                                                                // cursorColor: mainColor,

                                                                onChanged: (v) {


                                                                },
                                                                enabled: false,
                                                                initialValue:parameter.body.data[position].itemitem ,
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

                                                                  labelText: 'Param Item Name',
                                                                  hintText: '',
                                                                  prefixIcon: const Icon(
                                                                    Icons.description_outlined,
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
                                                            Theme(
                                                              child: TextFormField(
                                                                //  controller: _desc,
                                                                //keyboardType: TextInputType.number,
                                                                // cursorColor: mainColor,

                                                                onChanged: (v) {
                                                                  clone.longdesc=v;


                                                                },
                                                                initialValue:parameter.body.data[position].longdesc ,
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

                                                                  labelText: 'Long Desc',
                                                                  hintText: 'Enter Long Desc',
                                                                  prefixIcon: const Icon(
                                                                    Icons.description_outlined,
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
                                                            Theme(
                                                              child: TextFormField(
                                                                //  controller: _desc,
                                                                //keyboardType: TextInputType.number,
                                                                // cursorColor: mainColor,

                                                                onChanged: (v) {
                                                                  clone.shortdesc=v;


                                                                },
                                                                initialValue:parameter.body.data[position].shortdesc ,
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

                                                                  labelText: 'Short Desc',
                                                                  hintText: 'Enter Short Desc',
                                                                  prefixIcon: const Icon(
                                                                    Icons.description_outlined,
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
                                                            Theme(
                                                              child: TextFormField(
                                                                //  controller: _desc,
                                                                //keyboardType: TextInputType.number,
                                                                // cursorColor: mainColor,

                                                                onChanged: (v) {
                                                                  clone.validflag=v;


                                                                },
                                                                initialValue:parameter.body.data[position].validflag,
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

                                                                  labelText: 'Valid Flag',
                                                                  hintText: 'Enter Valid Flag',
                                                                  prefixIcon: const Icon(
                                                                    Icons.description_outlined,
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

                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: <Widget>[
                                                          Container(
                                                            width: MediaQuery.of(context).size.width * 0.20,
                                                            child: RaisedButton(
                                                              child: new Text(
                                                                'Update',
                                                                style: TextStyle(color: Colors.white),
                                                              ),
                                                              color: Color(0xFF121A21),
                                                              shape: new RoundedRectangleBorder(
                                                                borderRadius: new BorderRadius.circular(30.0),
                                                              ),
                                                              onPressed: () {
                                                                setState(() {
                                                                  clone.itemtabl=update.itemtabl;
                                                                  clone.itemtabl=update.itemtabl;

                                                                  clone.itemcoy=update.itemcoy;
                                                                  clone.itemitem=update.itemitem;
                                                                  clone.language='E';
                                                                  clone.itemcoy1=update.itemcoy;
                                                                  clone.itmto=update.itmto;
                                                                  clone.itmfrm=update.itmfrm;
                                                                  clone.itempfx="IT";
                                                                  clone.itemseq=update.itemseq;
                                                                  clone.longdesc=update.longdesc;
                                                                  clone.shortdesc=update.shortdesc;
                                                                  clone.validflag=update.validflag;

                                                                  putHttp(
                                                                      'timesheetapiuat/params/paramItem',
                                                                      clone)
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
                                                                                              ParameterItemsListForm())
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
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(context).size.width * 0.01,
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 70.0),
                                                            child: Container(
                                                              width: MediaQuery.of(context).size.width * 0.20,
                                                              child: RaisedButton(
                                                                child: new Text(
                                                                  'Cancel',
                                                                  style: TextStyle(color: Colors.white),
                                                                ),
                                                                color: Color(0xFF121A21),
                                                                shape: new RoundedRectangleBorder(
                                                                  borderRadius: new BorderRadius.circular(30.0),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.of(context).pop();
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: MediaQuery.of(context).size.height * 0.02,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  );
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
            return showDialog(
                context: context,
                barrierDismissible: false,
                //context: _scaffoldKey.currentContext,
                builder: (context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.only(left: 25, right: 25),
                    title: Center(child: Text("Edit")),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    content: Container(
                      height: 600,
                      width: 300,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Theme(
                              child: TextFormField(
                              controller: _company,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {


                                },
                                enabled: false,
                               // initialValue:parameter.body.data[position].itemcoy ,
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

                                  labelText: 'Company',
                                  hintText: 'Enter Error Description',
                                  prefixIcon: const Icon(
                                    Icons.description_outlined,
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
                            Theme(
                              child: TextFormField(
                           controller: _tabl,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {


                                },
                                enabled: false,
                               // initialValue:parameter.body.data[position].itemtabl ,
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

                                  labelText: 'Parameter Name',
                                  hintText: 'Enter Error Description',
                                  prefixIcon: const Icon(
                                    Icons.description_outlined,
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
                            Theme(
                              child: TextFormField(
                                 controller: _item,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                   setState(() {
                                     _item.text=v;
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

                                  labelText: 'Param Item Name',
                                  hintText: '',
                                  prefixIcon: const Icon(
                                    Icons.description_outlined,
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
                            Theme(
                              child: TextFormField(
                                controller: _longDesc,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                  setState(() {
                                    _longDesc.text=v;
                                  });


                                },
                             //   initialValue:parameter.body.data[position].longdesc ,
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

                                  labelText: 'Long Desc',
                                  hintText: 'Enter Long Desc',
                                  prefixIcon: const Icon(
                                    Icons.description_outlined,
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
                            Theme(
                              child: TextFormField(
                               controller: _short,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                 setState(() {
                                   _short.text=v;

                                 });


                                },
                              //  initialValue:parameter.body.data[position].shortdesc ,
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

                                  labelText: 'Short Desc',
                                  hintText: 'Enter Short Desc',
                                  prefixIcon: const Icon(
                                    Icons.description_outlined,
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
                            Theme(
                              child: TextFormField(
                                 controller: _flag,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                setState(() {
                                  _flag.text=v;
                                });


                                },
                             //   initialValue:parameter.body.data[position].validflag,
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

                                  labelText: 'Valid Flag',
                                  hintText: 'Enter Valid Flag',
                                  prefixIcon: const Icon(
                                    Icons.description_outlined,
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

                          ],
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.20,
                            child: RaisedButton(
                              child: new Text(
                                'Add',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Color(0xFF121A21),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              onPressed: () {
                                setState(() {
                                  add.itemtabl=update.itemtabl;
                                  add.itemcoy=update.itemcoy;
                                  add.itemitem=_item.text;
                                  add.language='E';
                                  add.itmto=update.itmto;
                                  add.itmfrm=update.itmfrm;
                                  add.itempfx="IT";
                                  add.itemseq=update.itemseq;
                                  add.longdesc=_longDesc.text;
                                  add.shortdesc=_short.text;
                                  add.validflag=_flag.text;

                                  postHttp(
                                      'timesheetapiuat/params/paramItem',
                                      add)
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
                                                              ParameterItemsListForm())
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
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 70.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: RaisedButton(
                                child: new Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Color(0xFF121A21),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ],
                      )
                    ],
                  );
                });

          });
        },
      ),
      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),

    );


  }



}

