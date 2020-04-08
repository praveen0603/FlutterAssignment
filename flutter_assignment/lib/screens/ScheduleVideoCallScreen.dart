import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utility/ScreenProgress.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class ScheduleVideoCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.blue[600],
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
  var _currentSelectedDate = "";
  var _currentSelectedTime = "";

  DateTime _date;
  TimeOfDay _time;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Create Account',
                            style: TextStyle(color: Colors.white),
                            textScaleFactor: 1.25,
                          ),
                        )
                      ],
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: ScreenProgress(
              ticks: 3,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 20, top: 10.0),
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
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30),
            child: Text(
              'Schedule Video Call',
              textScaleFactor: 1.5,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 15.0, top: 5.0),
            child: Text(
              'Choose the date and time that you preferred, we will send a link via email to make a video call on the scheduled date and time.',
              textScaleFactor: 1.0,
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 17.0,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            height: deviceHeight * 0.05,
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(Radius.circular(10.0))),
                child: GestureDetector(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1970),
                            lastDate: DateTime(2270))
                        .then((date) {
                      setState(() {
                        _date = date;
                      });
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15.0, top: 8),
                            child: Text(
                              "Date",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, top: 5.0, bottom: 10.0),
                            child: Text(
                              _date == null
                                  ? "- Choose Date -"
                                  : DateFormat('dd MMM yyyy').format(_date),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(Radius.circular(10.0))),
                child: GestureDetector(
                  onTap: () {
                    showTimePicker(
                            context: context, initialTime: TimeOfDay.now())
                        .then((time) {
                      setState(() {
                        _time = time;
                      });
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15.0, top: 8),
                            child: Text(
                              "Time",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, top: 5.0, bottom: 10.0),
                            child: Text(
                              _time == null
                                  ? "- Choose Time -"
                                  : "${_time.hour}:${_time.minute}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                )),
          ),
          Container(
            height: deviceHeight * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: deviceWidth,
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(6.0))),
              child: FlatButton(
                onPressed: () {
                  if (_date != null && _time != null) {
                    _showSnackBar(context, 'Update your code on next click.');
                  }
                },
                textColor: Colors.white,
                color: Colors.lightBlue,
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
