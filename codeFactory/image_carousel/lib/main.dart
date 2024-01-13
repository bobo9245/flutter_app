import 'package:flutter/material.dart';
import 'package:image_carousel/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(home: HomeScreen()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.black26),
          child: Center(
            child: Text('Hello World!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                )),
          ),
        ),
      ),
    );
  }
}
