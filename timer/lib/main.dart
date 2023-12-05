import 'package:flutter/material.dart';
import 'package:timer/screens/main_screen.dart';
import 'package:timer/screens/timerexample.dart';

void main() {
  runApp(MaterialApp(home: MainScreen()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
