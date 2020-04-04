import 'package:flutter/material.dart';
import 'ScreenProgress.dart';

class ScheduleVideoCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.white,
      body: MyVideoCallPage(),
    );
  }
}

class MyVideoCallPage extends StatefulWidget {
  MyVideoCallPage({Key key}) : super(key: key);

  @override
  _MyVideoCallPageState createState() => _MyVideoCallPageState();
}

class _MyVideoCallPageState extends State<MyVideoCallPage> {
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
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        Text(
                          'Create Account',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
                ScreenProgress(
                  ticks: 3,
                ),
                Container(
                    margin: const EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white30, shape: BoxShape.circle),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Icon(
                          Icons.event,
                          color: Colors.blue[600],
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Schedule Video Call',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Choose the date and time that you preferred, we will send a link via email to make a video call on the scheduled date and time.',
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
                        borderRadius:
                            new BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Date",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ),
                        DropdownButton(
                            underline: DropdownButtonHideUnderline(
                                child: DropdownButton()),
                            isExpanded: true,
                            hint: Text(
                              "- Choose Date -",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                        borderRadius:
                            new BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Time",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ),
                        DropdownButton(
                            underline: DropdownButtonHideUnderline(
                                child: DropdownButton()),
                            isExpanded: true,
                            hint: Text(
                              "- Choose Time -",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                  color: Colors.lightBlue),
              child: FlatButton(
                onPressed: null,
                color: Colors.lightBlue,
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
