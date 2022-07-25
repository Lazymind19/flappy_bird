import 'dart:async';

import 'package:flappy_bird/widget/bird_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool hasGameStart = false;

  void startGame() {
    hasGameStart = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.04;
      height = -4.9 * time * time + 3 * time;
      setState(() {
        birdYaxis = initialHeight - height;
      });
      if (birdYaxis > 1) {
        timer.cancel();
        hasGameStart = false;
      }
    });
  }

  void jump() {
    time = 0;
    initialHeight =  birdYaxis;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  if (hasGameStart) {
                    jump();
                  } else {
                    startGame();
                  }
                },
                child: AnimatedContainer(
                  alignment: Alignment(0, birdYaxis),
                  duration: Duration(milliseconds: 0),
                  color: Colors.blue,
                  child: MyBird(),
                ),
              )),
          Expanded(
              child: Container(
            color: Colors.green,
          ))
        ],
      ),
    );
  }
}
