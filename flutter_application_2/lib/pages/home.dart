import 'package:flutter/material.dart';
import 'subs/settings.dart';
import 'subs/writepage.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeStates();
}

const mainColor = Color(0xFF1E1F23);
const subColor = Color(0xFFFFFFFF);
const boxColor = Color(0xFF6FEAC8);

final List<String> dates = <String>['2023-11-30', '2023-11-26', '2023-11-23'];
final List<String> titles = <String>['즐거운날', '시험본날', '알바갔던날'];
final List<String> emotions = <String>['happy', 'anxious', 'annoyed'];

class _MyHomeStates extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
            shape: Border(
              bottom: BorderSide(width: 0.3, color: Colors.grey),
            ),
            elevation: 5,
            titleTextStyle: TextStyle(color: subColor, fontSize: 22),
            title: Text('감정일기'),
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: subColor, //색변경
            ),
            backgroundColor: mainColor,
            // leading: IconButton(
            //   onPressed: () {
            //     // Navigator.pop(context);
            //   },
            //   icon: Icon(Icons.menu),
            // ),
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => WritePage()));
                },
              ),
              IconButton(
                icon: Icon(Icons.brightness_low),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
              ),
            ]),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: mainColor,
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(10),
                  //   bottomRight: Radius.circular(10),
                  // ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profileimage.png'),
                ),
                accountName: Text('서윤하'),
                accountEmail: Text('bobo9245@naver.com'),
              ),
              ListTile(
                leading: Icon(
                  Icons.analytics,
                  color: Colors.deepPurple[300],
                ),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.navigate_next)),
                title: const Text('이번달 분석 보기'),
                onTap: () {
                  Navigator.pop(context); //Drawer을 닫는 역할을 해줌.
                },
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.deepPurple[300]),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.navigate_next)),
                title: const Text('만든사람 보기'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: ListView.builder(
          padding:
              const EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 20),
          itemCount: titles.length,
          itemBuilder: (BuildContext context, int index) {
            return Theme(
              data: ThemeData(
                primarySwatch: Colors.blue,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ), //InkWell 애니메이션을 없애기 위한 작업.
              child: InkWell(
                onTap: () {
                  // ignore: avoid_print
                  print(titles[index]);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(8),
                  height: 80,
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dates[index]),
                      Text(titles[index]),
                      if (emotions[index] == 'annoyed')
                        Text('😡')
                      else if (emotions[index] == 'happy')
                        Text('😍')
                      else if (emotions[index] == 'anxious')
                        Text('😬')
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
