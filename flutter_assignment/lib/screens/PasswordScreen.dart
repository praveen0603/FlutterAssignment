import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import '../utility/PasswordValidator.dart';
import '../utility/PasswordField.dart';
import '../utility/ScreenProgress.dart';
import 'PersonalInformationScreen.dart';

class PasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.white,
      body: MyPasswordPage(),
    );
  }
}

class MyPasswordPage extends StatefulWidget {
  MyPasswordPage({Key key}) : super(key: key);

  @override
  _MyPasswordPageState createState() => new _MyPasswordPageState();
}

class _MyPasswordPageState extends State<MyPasswordPage>
    with TickerProviderStateMixin {
  TextEditingController textController = TextEditingController();
  AnimationController _controller;
  Animation<double> _fabScale;
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  var passwordComplexity = 'Very Weak';

  var nineChar = false, lowerCase = false, upperCase = false, number = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController.addListener(() {
      setState(() {
        nineChar = textController.text.length > 9;
        lowerCase = textController.text.isNotEmpty &&
            textController.text.contains(RegExp('[a-z]'), 0);
        upperCase = textController.text.isNotEmpty &&
            textController.text.contains(RegExp('[A-Z]'), 0);
        number = textController.text.isNotEmpty &&
            textController.text.contains(RegExp('[0-9]'), 0);
      });
    });

    _controller = new AnimationController(
        vsync: this, duration: const Duration(microseconds: 500));

    _fabScale = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));

    _fabScale.addListener(() {
      setState(() {});
    });
    if (_allValid()) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  bool _allValid() {

    return (nineChar && lowerCase && upperCase && number);
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: Form(
          key: _formKey,
          child: ListView(
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
                  ticks: 1,
                ),
              ),
              Container(
                height: deviceHeight * 0.1,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Text(
                  'Create Password',
                  textScaleFactor: 1.5,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                child: Text(
                  'Password will be used to login to account',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 40.0, left: 15.0, bottom: 20.0, right: 15.0),
                child: PasswordField(
                  textController: textController,
                  fieldKey: _passwordFieldKey,
                  hintText: 'Create Password',
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please enter password to continue.";
                    }
                    return null;
                  },
                  onChanged: (value){
                    if(value.length == 0){
                      setState(() {
                        passwordComplexity = "Very Weak";
                      });
                    } else if(value.length > 0 && value.length < 9){
                      setState(() {
                        passwordComplexity = "Weak";
                      });
                    } else if(value.length >= 9 && value.length <=12){
                      setState(() {
                        passwordComplexity = "Strong";
                      });
                    } else if(value.length >= 13){
                      setState(() {
                        passwordComplexity = "Very Strong";
                      });
                    }
                  },
                  onSaved: (input) => _password = input,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Complexity: ',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Text(
                      passwordComplexity,
                      style: TextStyle(fontSize: 15, color: Colors.orangeAccent.shade100),
                    )
                  ],
                ),
              ),
              Container(
                height: deviceHeight * 0.05,
              ),
              Padding(
                padding: EdgeInsets.only(left: 0, right: 0),
                child: renderValidation(),
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
                      if (_formKey.currentState.validate() && _allValid()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PersonalInformationScreen()));
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
          )),
    );
  }

  renderValidation() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
              color: Colors.blue[600],
              elevation: 0,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      PasswordValidator("a", "Lowercase", lowerCase),
                      PasswordValidator("A", "Uppercase", upperCase),
                      PasswordValidator("123", "Numbers", number),
                      PasswordValidator("9+", "Characters", nineChar),
                    ],
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
