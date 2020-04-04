import 'package:flutter/material.dart';
import 'ScreenProgress.dart';
import 'ScheduleVideoCallScreen.dart';

class PersonalInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.white,
      body: MyPersonalInfoPage(),
    );
  }
}

class MyPersonalInfoPage extends StatefulWidget {
  MyPersonalInfoPage({Key key}) : super(key: key);

  @override
  _MyPersonalInfoPageState createState() => new _MyPersonalInfoPageState();
}

class _MyPersonalInfoPageState extends State<MyPersonalInfoPage> {
  String _myActivity;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: deviceHeight * 0.25,
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.arrow_back, color: Colors.white,),
                        Text('Create Account', style: TextStyle(color: Colors.white),)
                      ],
                    )),
                ScreenProgress(
                  ticks: 2,
                )
              ],
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Personal Information',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Please fill in the information below and your goal for digital saving.',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Goal for activation",
                            style: TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ),
                        DropdownButton(
                            underline:
                            DropdownButtonHideUnderline(child: DropdownButton()),
                            isExpanded: true,
                            hint: Text(
                              "- Choose Option -",
                            ),
                            items: [
                              DropdownMenuItem(
                                value: "1",
                                child: Text(
                                  "First",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2",
                                child: Text(
                                  "Second",
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _myActivity = value;
                              });
                            }),
                      ],
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Monthly income",
                            style: TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ),
                        DropdownButton(
                            underline:
                            DropdownButtonHideUnderline(child: DropdownButton()),
                            isExpanded: true,
                            hint: Text(
                              "- Choose Option -",
                            ),
                            items: [
                              DropdownMenuItem(
                                value: "1",
                                child: Text(
                                  "First",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2",
                                child: Text(
                                  "Second",
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _myActivity = value;
                              });
                            }),
                      ],
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Monthly expenses",
                            style: TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ),
                        DropdownButton(
                            underline:
                            DropdownButtonHideUnderline(child: DropdownButton()),
                            isExpanded: true,
                            hint: Text(
                              "- Choose Option -",
                            ),
                            items: [
                              DropdownMenuItem(
                                value: "1",
                                child: Text(
                                  "First",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2",
                                child: Text(
                                  "Second",
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _myActivity = value;
                              });
                            }),
                      ],
                    )),
              ],
            ),
          )),
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Container(
              width: deviceWidth,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  color: Colors.lightBlue
              ),
              child: FlatButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleVideoCallScreen()));
              },
                color: Colors.lightBlue,
                child: Text('Next', style: TextStyle(color: Colors.white),),),
            ),
          ),
        ],
      )),
    );
  }
}
