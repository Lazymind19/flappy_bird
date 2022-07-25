import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  final String text;
   bool islarge = false;
   CustomText({Key? key, required this.text, required this.islarge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: islarge ? FontWeight.bold : FontWeight.w500
    ),);
  }
}
