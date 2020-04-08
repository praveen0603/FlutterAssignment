import 'package:flutter/material.dart';
import '../utility/ScreenProgress.dart';
import 'PasswordScreen.dart';

class EmailScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home:  MyEmailPage(),
    );
  }
}

class MyEmailPage extends StatefulWidget {
  MyEmailPage({Key key}) : super(key: key);

  @override
  _MyEmailPageState createState() => _MyEmailPageState();
}

class _MyEmailPageState extends State<MyEmailPage>{
  TextEditingController emailController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  var validEmail = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.addListener(() {
      setState(() {
        validEmail = emailController.text.isNotEmpty &&
            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(emailController.text);
      });
    });
  }

  bool isValidEmail() {
    return validEmail;
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: CustomPaint(
              painter: ShapesPainter(),
              child: Container(
                height: 700,
              ),
            ),
          ),
          Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.0, top: 30.0, bottom: 30.0, right: 20.0),
                    child: ScreenProgress(
                      ticks: 0,
                    ),
                  ),
                  Container(
                    height: deviceHeight * 0.15,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Welcome to',
                          textScaleFactor: 1.5,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text(
                          'GIN',
                          textScaleFactor: 1.5,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          ' Finans',
                          textScaleFactor: 1.5,
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(20),
                    child: Text(
                      'Welcome to The Bank of The Future.\nManage and track your account on\nthe go.',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        new BorderRadius.all(Radius.circular(10.0))),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 16),
                      validator: (inputData) {
                        if (inputData.isEmpty) {
                          return "Please enter email address to conntinue";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail_outline),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintText: "Email",
                          fillColor: Colors.cyanAccent),
                      controller: emailController,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                    child: Container(
                      width: deviceWidth,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                      child: FlatButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PasswordScreen()));
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
              ))
        ],
      ),
    );
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the paint color to be white
    paint.color = Colors.white;
    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    // draw the rectangle using the paint
    canvas.drawRect(rect, paint);
    paint.color = Colors.blue[600];
    // create a path
    var path = Path();
    path.lineTo(0, size.height*0.35);
    path.quadraticBezierTo(
        size.width *0.1, size.height *0.01, size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    // close the path to form a bounded shape
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}