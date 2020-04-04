import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'PasswordValidator.dart';
import 'PasswordField.dart';
import 'ScreenProgress.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
    return nineChar;
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Header Container
            Container(
              padding: const EdgeInsets.all(8.0),
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
                    ticks: 1,
                  )
                ],
              ),
            ),

            //Body Container
            Expanded(
              child: SingleChildScrollView(

                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: deviceHeight,
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: deviceHeight * 0.1,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(15, 0, 5, 0),
                        child: Text(
                          'Create Password',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(15, 0, 5, 5),
                        child: Text(
                          'Password will be used to login to account',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 15, 5, 15),
                        padding: EdgeInsets.all(10),
                        child: PasswordField(
                          textController: textController,
                          fieldKey: _passwordFieldKey,
                          hintText: 'Create Password',
                          onSaved: (input) => _password = input,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 5, 5),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Complexity: ',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              passwordComplexity,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.green),
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: renderValidation()),
                    ],
                  ),
                ),
              ),
            ),

            //Footer Container
            //Here you will get unexpected behaviour when keyboard pops-up.
            //So its better to use `bottomNavigationBar` to avoid this.
            Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Container(
                width: deviceWidth,
                decoration: BoxDecoration(color: Colors.lightBlue,
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalInformationScreen()));
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
      ),
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
