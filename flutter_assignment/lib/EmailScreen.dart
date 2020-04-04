import 'package:flutter/material.dart';

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
  var validEmail = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.addListener(() {
      setState(() {
        validEmail = emailController.text.isNotEmpty &&
            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text);
      });
    });
  }

  bool isValidEmail(){
    return validEmail;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              child: CustomPaint(
                painter: ShapesPainter(),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Welcome to',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 36,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                              child: Text(
                                                'GIN',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 36,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                ' Finans',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 36,
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
                                              borderRadius: new BorderRadius.all(Radius.circular(10.0))
                                          ),
                                          child: TextFormField(
                                            keyboardType: TextInputType.emailAddress,
                                            style: TextStyle(fontSize: 16),
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
                                                fillColor: Colors.cyanAccent
                                            ),
                                            controller: emailController,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            )
          ],
        ));
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