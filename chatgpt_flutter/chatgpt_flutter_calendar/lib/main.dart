import 'package:flutter/material.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.navigate_before, color: Colors.blueAccent),
          title:
              const Text('제목입니다', style: TextStyle(color: Colors.blueAccent)),
          centerTitle: true,
          shape: const Border(
            bottom: BorderSide(
              color: Colors.blueAccent,
              width: 1,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: const Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
