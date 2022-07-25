import 'package:flutter/material.dart';
class MyBarrier extends StatelessWidget {
  final size;
  const MyBarrier({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: size,
      decoration: BoxDecoration(
        color:  Colors.green
      ),
    );
  }
}
