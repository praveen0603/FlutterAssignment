import 'package:flutter/material.dart';
import 'ScreenProgress.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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
    /*final dateFormat = DateFormat("dd/mm/yyyy");
    final timeFormat = DateFormat("hh:mm a");*/
    DateTime date;
    var dateSelected = false;
    var time = "";

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
                          padding: EdgeInsets.all(2),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Date",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ),
                        FlatButton(
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2000, 1, 1),
                                  maxTime: DateTime(2022, 12, 31),
                                  onChanged: (confdate) {
                                    setState(() {
                                      dateSelected = true;
                                      date = confdate;
                                    });
                                print('change $date');
                              }, onConfirm: (confdate) {
                                setState(() {
                                  dateSelected = true;
                                  date = confdate;
                                });

                                print('conf $date');
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            },
                            padding: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    dateSelected ? date.toString():"- Choose Date -",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )),
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
                          padding: EdgeInsets.all(2),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Time",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ),
                        FlatButton(
                            onPressed: () {
                              DatePicker.showTimePicker(
                                  context,
                                showTitleActions: true,
                                currentTime: DateTime.now(),
                                onChanged: (date) {
                                  print('change $date in time zone ' +
                                      date.timeZoneOffset.inHours.toString());
                                }, onConfirm: (date) {
                                print('confirm $date');
                              },
                              );
                            },
                            padding: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "- Choose Time -",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )),
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
