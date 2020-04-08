import 'package:flutter/material.dart';

class ScreenProgress extends StatelessWidget {
  final int ticks;

  ScreenProgress({@required this.ticks});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        tick1(),
        //spacer(),
        line(),
        //spacer(),
        tick2(),
        //spacer(),
        line(),
        //spacer(),
        tick3(),
        //spacer(),
        line(),
        //spacer(),
        tick4(),
      ],
    );
  }

  Widget tick(bool isChecked) {
    return isChecked
        ? Text(this.ticks.toString(), style: TextStyle(color: Colors.black))
        : Icon(
            Icons.radio_button_unchecked,
            color: Colors.black,
          );
  }

  Widget container1(bool isChecked) {
    return isChecked
        ? Container(
            padding: EdgeInsets.all(20.0),
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.black)),
            child: Text(
              '1',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          )
        : Container(
            padding: EdgeInsets.all(20.0),
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.black)),
            child: Text(
              '1',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          );
  }

  Widget container2(bool isChecked) {
    return isChecked
        ? Container(
            padding: EdgeInsets.all(20.0),
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.black)),
            child: Text(
              '2',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          )
        : Container(
            padding: EdgeInsets.all(20.0),
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.black)),
            child: Text(
              '2',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          );
  }

  Widget container3(bool isChecked) {
    return isChecked
        ? Container(
            padding: EdgeInsets.all(20.0),
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.black)),
            child: Text(
              '3',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          )
        : Container(
            padding: EdgeInsets.all(20.0),
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.black)),
            child: Text(
              '3',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          );
  }

  Widget container4(bool isChecked) {
    return isChecked
        ? Container(
            padding: EdgeInsets.all(20.0),
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.black)),
            child: Text(
              '4',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          )
        : Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.black)),
            child: Text(
              '4',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          );
  }

  Widget tick1() {
    return this.ticks > 0 ? container1(true) : container1(false);
  }

  Widget tick2() {
    return this.ticks > 1 ? container2(true) : container2(false);
  }

  Widget tick3() {
    return this.ticks > 2 ? container3(true) : container3(false);
  }

  Widget tick4() {
    return this.ticks > 3 ? container4(true) : container4(false);
  }

  Widget spacer() {
    return Container(
      width: 5.0,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 5)),
    );
  }

  Widget line() {
    return Container(
      color: Colors.black,
      height: 4.0,
      width: 45.0,
    );
  }
}
