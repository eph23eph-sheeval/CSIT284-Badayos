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
            child: Text("Hello World")))),
      ),
    ),
  );
}
