import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo'),
        ),
        body: Center(
          child: const Text('this is child'),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '메인',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '검색',
              ),
            ],
            selectedItemColor: Colors.blueGrey,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.shifting,
          ),
        ),
      ),
    );
  }
}
