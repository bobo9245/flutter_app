import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainScreen> {
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${NumberFormat('00').format(min)} : ${NumberFormat('00').format(sec)} : ${NumberFormat('00').format(milisec)}',
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                    // 추가된 부분: 랩 타임을 표시할 부분
                    if (lapTimes.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: lapTimes.map((lap) => Text(lap)).toList(),
                      ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: startTimer,
                  iconSize: 30,
                ),
                IconButton(
                  icon: const Icon(Icons.pause),
                  onPressed: pauseTimer,
                ),
                IconButton(
                  icon: const Icon(Icons.stop),
                  onPressed: resetTimer,
                ),
                // 추가된 부분: 클릭할 때 랩 타임 기록 버튼
                IconButton(
                  icon: const Icon(Icons.pets),
                  onPressed: recordLapTime,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 30,
        color: Colors.lightBlueAccent[100],
      ),
    );
  }
}
