import 'dart:async';

import 'package:flappy_bird/widget/bariers_widget.dart';
import 'package:flappy_bird/widget/bird_widget.dart';
import 'package:flappy_bird/widget/text_widget.dart';
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
 static double barrierXone = 0.0;
  double barrierXTwo = barrierXone +1.5;

  void startGame() {
    hasGameStart = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.035;
      height = -4.9 * time * time + 3 * time;
      setState(() {
        birdYaxis = initialHeight - height;

        if(barrierXone  < -2){
          barrierXone +=3.5;
        }else {
          barrierXone -= 0.05;
        }

        if(barrierXTwo  < -2){
          barrierXTwo +=3.5;
        }else {
          barrierXTwo -= 0.05;
        }

      });
      if (birdYaxis > 1) {
        timer.cancel();
        hasGameStart = false;
      }
    });
  }

  void jump() {
    time = 0;
    initialHeight = birdYaxis;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (hasGameStart) {
                        jump();
                      } else {
                        startGame();
                      }
                    },
                    child: AnimatedContainer(
                      alignment: Alignment(-0.5, birdYaxis),
                      duration: Duration(milliseconds: 0),
                      color: Colors.blue,
                      child: MyBird(),
                    ),
                  ),
                  Container(
                    alignment: Alignment(0, -0.5),
                    child: hasGameStart ? Text(" ") : Text("TAP  TO  PLAY  "),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXone, -1),
                    duration: Duration(milliseconds: 0),
                    child: MyBarrier(size: 170),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXone, 1),
                    duration: Duration(milliseconds: 0),
                    child: MyBarrier(size: 150),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXTwo, -1),
                    duration: Duration(milliseconds: 0),
                    child: MyBarrier(size: 130),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXTwo, 1),
                    duration: Duration(milliseconds: 0),
                    child: MyBarrier(size: 200),
                  ),
                ],
              )),
          Container(
            height: 20,
            color: Colors.green,
          ),
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CustomText(text: "Score", islarge: true),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(text: "0", islarge: false)
                      ],
                    ),
                    Column(
                      children: [
                        CustomText(text: "Best", islarge: true),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(text: "0", islarge: false)
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
