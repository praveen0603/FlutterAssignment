import 'package:flutter/material.dart';
import '../utility/ScreenProgress.dart';
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
  final formKey = new GlobalKey<FormState>();
  var _goalForActivation = ["Saving", "Pension", "Study", "Travelling"];
  var _monthlyIncome = [
    "Less than 15000",
    "15000 - 30000",
    "30000 - 45000",
    "45000 - 60000",
    "More than 60000"
  ];
  var _monthlyExpense = [
    "Less than 10000",
    "10000 - 20000",
    "20000 - 30000",
    "30000 - 40000",
    "More than 40000"
  ];
  var _currentSelectedGoal = "";
  var _currentSelectedIncome = "";
  var _currentSelectedExpense = "";

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
              ticks: 2,
            ),
          ),
          Container(
            height: deviceHeight * 0.05,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(
              'Personal Information',
              textScaleFactor: 1.5,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
            child: Text(
              'Please fill in the information below and your goal for digital saving.',
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
                    _showGoalForActivationDialog(context);
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
                              "Goal for activation",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, top: 5.0, bottom: 10.0),
                            child: Text(
                              _currentSelectedGoal.isEmpty
                                  ? "- Choose Option -"
                                  : _currentSelectedGoal,
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
                    _showMonthlyIncomeDialog(context);
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
                              "Monthly income",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, top: 5.0, bottom: 10.0),
                            child: Text(
                              _currentSelectedIncome.isEmpty
                                  ? "- Choose Option -"
                                  : _currentSelectedIncome,
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
                    _showMonthlyExpenseDialog(context);
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
                              "Monthly expense",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, top: 5.0, bottom: 10.0),
                            child: Text(
                              _currentSelectedExpense.isEmpty
                                  ? "- Choose Option -"
                                  : _currentSelectedExpense,
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
                  if (_currentSelectedGoal.isNotEmpty &&
                      _currentSelectedIncome.isNotEmpty &&
                      _currentSelectedExpense.isNotEmpty) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScheduleVideoCallScreen()));
                  } else {
                    _showSnackBar(context, "Please select all options.");
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

  void _showGoalForActivationDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Goal for activation",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: _goalForActivation.length,
                itemBuilder: (BuildContext context, int position) {
                  return SimpleDialogOption(
                    onPressed: () {
                      setState(() {
                        _currentSelectedGoal = _goalForActivation[position];
                        Navigator.pop(context);
                      });
                    },
                    child: Text(_goalForActivation[position]),
                  );
                },
              ),
            ),
          );
        });
  }

  void _showMonthlyIncomeDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Monthly Income",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: _monthlyIncome.length,
                itemBuilder: (BuildContext context, int position) {
                  return SimpleDialogOption(
                    onPressed: () {
                      setState(() {
                        _currentSelectedIncome = _monthlyIncome[position];
                        Navigator.pop(context);
                      });
                    },
                    child: Text(_monthlyIncome[position]),
                  );
                },
              ),
            ),
          );
        });
  }

  void _showMonthlyExpenseDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Goal for activation",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: _monthlyExpense.length,
                itemBuilder: (BuildContext context, int position) {
                  return SimpleDialogOption(
                    onPressed: () {
                      setState(() {
                        _currentSelectedExpense = _monthlyExpense[position];
                        Navigator.pop(context);
                      });
                    },
                    child: Text(_monthlyExpense[position]),
                  );
                },
              ),
            ),
          );
        });
  }

  void _showSnackBar(BuildContext context, String message){
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
