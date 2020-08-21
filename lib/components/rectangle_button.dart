import 'package:flash_chat/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  RectangleButton({@required this.onPressed, this.title});

  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: FadeAnimation(
        2,
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(143, 148, 251, 1),
              Color.fromRGBO(143, 148, 251, .6)
            ]),
          ),
          child: Center(
            child: Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
