import 'package:flutter/material.dart';
class MyBird extends StatelessWidget {
  const MyBird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("img/bird.png", height: 20, width: 20,);
  }
}
