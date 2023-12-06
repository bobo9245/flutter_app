import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MyWidgetState();
}

final lba800 = Colors.lightBlueAccent[800];

final class _MyWidgetState extends State<MainScreen> {
  int min = 0;
  int sec = 0;
  int milisec = 0;
  bool _isRunning = false;
  late Timer timer;
  List<String> lapTimes = []; // 추가된 부분: 랩 타임을 저장할 리스트

  void startTimer() {
    if (!_isRunning) {
      timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        setState(() {
          if (milisec != 99)
            milisec++;
          else {
            if (sec != 59)
              sec++;
            else {
              min++;
              sec = 0;
            }
            milisec = 0;
          }
        });
      });
      setState(() {
        _isRunning = true;
      });
    }
  }

  void resetTimer() {
    min = 0;
    sec = 0;
    milisec = 0;
    lapTimes.clear(); // 추가된 부분: 리셋 시 랩 타임 초기화
    timer.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void pauseTimer() {
    setState(() {
      _isRunning = !_isRunning;
    });

    if (_isRunning) {
      startTimer();
    } else {
      timer.cancel();
    }
  }

  void recordLapTime() {
    String lapTime =
        '${NumberFormat('00').format(min)} : ${NumberFormat('00').format(sec)} : ${NumberFormat('00').format(milisec)}';
    setState(() {
      lapTimes.insert(0, lapTime); // 추가된 부분: 현재 타이머 시간을 리스트 맨 앞에 추가
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[200],
        title: Text(
          'This is Stopwatch',
          style: TextStyle(color: Colors.lightBlueAccent[900]),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.lightBlueAccent[100]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Expanded(
                      child: Text(
                        '${NumberFormat('00').format(min)} : ${NumberFormat('00').format(sec)} : ${NumberFormat('00').format(milisec)}',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                          color: Colors.lightBlueAccent[800],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.play_arrow,
                    color: lba800,
                  ),
                  onPressed: startTimer,
                  iconSize: 40,
                  color: Colors.lightBlueAccent[800],
                ),
                IconButton(
                  icon: Icon(
                    Icons.pause,
                    color: lba800,
                  ),
                  onPressed: pauseTimer,
                  iconSize: 40,
                  color: lba800,
                ),
                IconButton(
                  icon: Icon(
                    Icons.stop,
                    color: lba800,
                  ),
                  onPressed: resetTimer,
                  iconSize: 40,
                ),
                // 추가된 부분: 클릭할 때 랩 타임 기록 버튼
                IconButton(
                  icon: Icon(
                    Icons.pets,
                    color: lba800,
                  ),
                  onPressed: recordLapTime,
                  iconSize: 40,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 추가된 부분: 랩 타임을 표시할 부분
                    if (lapTimes.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: lapTimes
                            .map(
                              (lap) => Column(
                                children: [
                                  Text(lap,
                                      style: TextStyle(
                                        color: Colors.lightBlueAccent[800],
                                        fontSize: 20,
                                      )),
                                  const SizedBox(height: 4),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 30,
        color: Colors.lightBlueAccent[100],
        elevation: 0,
      ),
    );
  }
}
