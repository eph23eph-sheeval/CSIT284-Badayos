import 'package:flutter/material.dart';
import 'package:lab_act_2/dice_roller.dart';



void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: (Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.red,
              Colors.blue,
            ])
          ),
          child: Center(
            child: DiceRoller()
      ))),
      ),
    ),
  );
}
