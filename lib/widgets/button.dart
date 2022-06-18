import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Color backgroudColor;
  final Color textColor;

  const Button({
    Key? key,
    this.width = 80,
    this.height = 32,
    required this.text,
    this.backgroudColor = Colors.lightBlueAccent,
    this.textColor = const Color(0xffffffff),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        child: Center(
          child: Text('$text', textAlign: TextAlign.center, style: TextStyle(color: textColor),),
        ),
        decoration: BoxDecoration(
            color: backgroudColor,
            borderRadius: BorderRadius.circular(16)
        ),
      ),
    );
  }
}

