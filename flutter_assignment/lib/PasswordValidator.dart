import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class PasswordValidator extends StatefulWidget {
  PasswordValidator(this.title, this.text, this.valid);

  final String title;
  final String text;
  final bool valid;

  @override
  State<StatefulWidget> createState() => ValidationState();
}

class ValidationState extends State<PasswordValidator> {
  AnimationController _controller;
  AnimationController _animatedStrike;

  @override
  void didUpdateWidget(PasswordValidator oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    if (oldWidget.valid != widget.valid) {
      if (widget.valid) {
        startAnim(true);
      } else {
        startAnim(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      //width: MediaQuery.of(context).size.width *0.2235,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              getWidget(widget.valid),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  widget.text,
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future startAnim(bool animationDone) async {
    try {
      if (animationDone) {
        _animatedStrike.forward().orCancel;
      } else {
        _animatedStrike.reverse().orCancel;
      }

      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  Widget getWidget(bool validation) {
    return validation
        ? Icon(Icons.check_circle, color: Colors.green)
        : Text(
            widget.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white),
          );
  }
}
