import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:intl/intl.dart';

//intl 라이브러리를 통해서 오늘의 날짜를 받아옴
String getToday() {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  String strToday = formatter.format(now);
  return strToday;
}

class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
          backgroundColor: mainColor,
          iconTheme: IconThemeData(color: subColor),
          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5.0),
                child: Text(
                  '오늘의 일기 쓰기',
                  style: TextStyle(
                    color: subColor,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                getToday(),
                style: TextStyle(
                  color: subColor,
                  fontSize: 16,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.save_as_outlined),
              onPressed: () {},
            ),
          ]),
    );
  }
}
