import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/subscreens/homescreen.dart';
import 'package:instagram_clone/screens/subscreens/searchscreen.dart';

class instaBody extends StatelessWidget {
  final int index;
  const instaBody({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return HomeScreen();
    }

    return SearchScreen();
  }
}
