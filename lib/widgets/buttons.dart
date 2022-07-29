// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String child;
  final VoidCallback? onTap;
  var buttonColor = Colors.deepPurple[400];
  MyButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (child == 'C') {
      buttonColor = Colors.green;
    } else if (child == 'DEL') {
      buttonColor = Colors.red;
    } else if (child == '=') {
      buttonColor = Colors.deepPurple;
    }
    return Padding(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          //color: Colors.white,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              child,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
