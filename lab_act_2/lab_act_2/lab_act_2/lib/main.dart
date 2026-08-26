import 'package:flutter/material.dart';

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                width: 20,
                'assets/dice-images/dice-iamges/dice-2.png'
                ),
                SizedBox(width: 50),
              TextButton(onPressed: () {}, 
              child: Text(
                style: TextStyle(
                  fontSize: 28
                ),
                "Roll Dice"
                )
                ),
            ],
            )
            ))),
      ),
    ),
  );
}
