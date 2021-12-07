
import 'package:fit_timesheets/Pages/Admin/Parameters/parametersItemsList.dart';
import 'package:fit_timesheets/models/admin/parameters/parametersList.dart';
import 'package:fit_timesheets/models/admin/parameters/updateParams.dart';
import 'package:fit_timesheets/services/http_service.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../../footer.dart';

class ParameterListForm extends StatefulWidget {
  @override
  _ParameterListFormState createState() => _ParameterListFormState();
}
MultiSelectController controller = new MultiSelectController();

class _ParameterListFormState extends State<ParameterListForm> {

  ParametersList parameter= ParametersList();
  TextEditingController _company=TextEditingController();
  TextEditingController _paramName=TextEditingController();
  TextEditingController _longDesc=TextEditingController();
  TextEditingController _flag=TextEditingController(text: '1');
  TextEditingController _tblProg=TextEditingController();
  TextEditingController _minLe=TextEditingController(text: '2');
  TextEditingController _maxLe=TextEditingController(text: '5');
  TextEditingController _praGroup=TextEditingController();
  TextEditingController _paramType=TextEditingController(text: '0');
  TextEditingController _prodCode=TextEditingController();
  TextEditingController _tb1=TextEditingController();
  TextEditingController _tb2=TextEditingController();
  TextEditingController _tb3=TextEditingController();
  TextEditingController _tb4=TextEditingController();
  TextEditingController _tb5=TextEditingController();
  TextEditingController _tb6=TextEditingController();
  TextEditingController _tb7=TextEditingController();
  TextEditingController _tb8=TextEditingController();
  TextEditingController _tb9=TextEditingController();
  TextEditingController _tb10=TextEditingController();
  UpdateParams update=UpdateParams();


  @override
  Widget build(BuildContext context) {
    getHttp2(
        'timesheetapiuat/params/paramHeaders?pageNum=0&pageSize=1000&language=E&getSearchfields=true')
        .then((apiValue) {
      setState(() {
        parameter = ParametersList.fromJson(apiValue);


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
                          color: (position % 2 == 0) ? Colors.lightBlue[400] : Colors.lightBlue[100],),
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
                                      '${parameter.body.data[position].itemtabl}',
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
                                                                  update.validflag=v;


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
                                                                  update.validflag=v;


                                                                },
                                                                initialValue:parameter.body.data[position].validflag ,
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
                                                            Theme(
                                                              child: TextFormField(
                                                                //  controller: _desc,
                                                                //keyboardType: TextInputType.number,
                                                                // cursorColor: mainColor,

                                                                onChanged: (v) {
                                                                  update.tableprog=v;


                                                                },
                                                                initialValue:parameter.body.data[position].tableprog,
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

                                                                  labelText: 'Table Program',
                                                                  hintText: 'Enter Table Program',
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
                                                                initialValue:parameter.body.data[position].itmfrm ,
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

                                                                  labelText: 'Min Item Length',
                                                                  hintText: 'Enter Min Item Length',
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
                                                                initialValue:parameter.body.data[position].itmto ,
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

                                                                  labelText: 'Max Item Length',
                                                                  hintText: 'Enter Max Item Length',
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
                                                                  update.itemcoy=parameter.body.data[position].itemcoy;
                                                                  update.itemtabl=parameter.body.data[position].itemtabl;
                                                                  postHttp(
                                                                      'timesheetapiuat/params/paramHeader',
                                                                      update)
                                                                      .then((value) {

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
                                                                                'Records have been successfully updated'),
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
                                                                                              ParameterListForm())
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
                                        tooltip: 'Items',
                                        icon: Icon(
                                          Icons.details_outlined,
                                          color: Colors.purple,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ParameterItemsListForm(
                                                          update:
                                                          parameter.body.data[
                                                          position]),
                                                )
                                            );
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
                    title: Center(child: Text("Add")),
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
                                   _company.text=v;


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
                                  hintText: 'Enter Company',
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
                                 controller: _paramName,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
_paramName.text=v;

                                },
                                enabled: false,
                                //initialValue:parameter.body.data[position].itemtabl ,
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
                                  hintText: 'Enter Param Name',
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
_longDesc.text=v;

                                },
                               // initialValue:parameter.body.data[position].longdesc ,
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

                                  labelText: 'Long Description',
                                  hintText: 'Enter Long Description',
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
                                keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                    _flag.text=v;


                                },
                               // initialValue:parameter.body.data[position].longdesc ,
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
                            Theme(
                              child: TextFormField(
                                  controller: _tblProg,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                    _tblProg.text=v;


                                },
                               // initialValue:parameter.body.data[position].validflag ,
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

                                  labelText: 'Table Prog',
                                  hintText: 'Enter Table Prog',
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
                                  controller: _minLe,
                                keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                    _minLe.text=v;


                                },
                               // initialValue:parameter.body.data[position].tableprog,
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

                                  labelText: 'Min Item Length',
                                  hintText: 'Enter Min Item Length',
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
                                  controller: _maxLe,
                              keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {


                                },
                               // initialValue:parameter.body.data[position].itmfrm ,
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

                                  labelText: 'Min Max Length',
                                  hintText: 'Enter Max Item Length',
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
                                 controller: _praGroup,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                  _praGroup.text=v;


                                },
                                //initialValue:parameter.body.data[position].itmto ,
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

                                  labelText: 'Max Param Group',
                                  hintText: 'Enter Param Group',
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
                                controller: _paramType,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                  _paramType.text=v;


                                },
                                // initialValue:parameter.body.data[position].genarea.paramGroup.toString(),
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

                                  labelText: 'Param Type',
                                  hintText: 'Enter Param Type',
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
                                 controller: _prodCode,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                   _prodCode.text=v;


                                },
                               // initialValue:parameter.body.data[position].longdesc ,
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

                                  labelText: 'Product Code',
                                  hintText: 'Enter Product Code',
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
                                  controller: _tb2,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                    _tb2.text=v;


                                },
                                //initialValue:parameter.body.data[position].longdesc ,
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

                                  labelText: 'Table Program 2',
                                  hintText: 'Enter Table Program 2',
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
                                controller: _tb3,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                  _tb3.text=v;


                                },
                                //initialValue:parameter.body.data[position].longdesc ,
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

                                  labelText: 'Table Program 3',
                                  hintText: 'Enter Table Program 3',
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
                                controller: _tb4,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                  _tb4.text=v;


                                },
                                //initialValue:parameter.body.data[position].longdesc ,
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

                                  labelText: 'Table Program 4',
                                  hintText: 'Enter Table Program 4',
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
                                controller: _tb5,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                  _tb5.text=v;


                                },
                                //initialValue:parameter.body.data[position].longdesc ,
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

                                  labelText: 'Table Program 5',
                                  hintText: 'Enter Table Program 5',
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
                                controller: _tb6,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                  _tb6.text=v;


                                },
                                //initialValue:parameter.body.data[position].longdesc ,
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

                                  labelText: 'Table Program 6',
                                  hintText: 'Enter Table Program 6',
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
                                controller: _tb7,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                  _tb7.text=v;


                                },
                                //initialValue:parameter.body.data[position].longdesc ,
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

                                  labelText: 'Table Program 7',
                                  hintText: 'Enter Table Program 7',
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
                                controller: _tb8,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                  _tb8.text=v;


                                },
                                //initialValue:parameter.body.data[position].longdesc ,
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

                                  labelText: 'Table Program 8',
                                  hintText: 'Enter Table Program 8',
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
                                controller: _tb9,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                  _tb9.text=v;


                                },
                                //initialValue:parameter.body.data[position].longdesc ,
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

                                  labelText: 'Table Program 9',
                                  hintText: 'Enter Table Program 9',
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
                                controller: _tb10,
                                //keyboardType: TextInputType.number,
                                // cursorColor: mainColor,

                                onChanged: (v) {
                                  _tb10.text=v;


                                },
                                //initialValue:parameter.body.data[position].longdesc ,
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

                                  labelText: 'Table Program 10',
                                  hintText: 'Enter Table Program 10',
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

