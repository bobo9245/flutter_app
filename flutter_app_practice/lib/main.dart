import 'package:flutter/material.dart';
import 'package:flutter_app_practice/screens/mainScreen.dart';

void main() {
  runApp(
    MaterialApp(
      home: mainScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 28,
          ),
        ),
        // const ColorScheme(
        //   brightness: Brightness.light,
        //   primary: Colors.indigo,
        //   onPrimary: Colors.indigo,
        //   secondary: Colors.green,
        //   onSecondary: Colors.green,
        //   error: Colors.redAccent,
        //   onError: Colors.redAccent,
        //   background: Colors.black12,
        //   onBackground: Colors.black12,
        //   surface: Colors.deepPurple,
        //   onSurface: Colors.white,
        // ),
        //
      ),
    ),
  );
}
