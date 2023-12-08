import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../utils.dart';

// ignore: camel_case_types
class calScreen extends StatefulWidget {
  const calScreen({super.key});

  @override
  State<calScreen> createState() => _calScreenState();
}

// ignore: camel_case_types
class _calScreenState extends State<calScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('캘린더입니다.')),
      body: Column(
        children: [
          TableCalendar(
            //버튼 없애고, 년월 가운데로 + 현재년월 한글로 변경
            headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextFormatter: (date, locale) {
                  final koreanFormat = DateFormat.yMMM('ko_KR');
                  return koreanFormat.format(date);
                }),
            calendarStyle: const CalendarStyle(
              selectedDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(126, 87, 198, 1),
              ),
            ),
            focusedDay: _focusedDay,
            firstDay: kFirstDay,
            lastDay: kLastDay,
            calendarFormat: _calendarFormat,
            //선택한 날짜를 _selectedDay로 지정
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            //현재 달력에 출력된 달만 선택 가능하게 만드는 함수
            enabledDayPredicate: (DateTime day) {
              final now = _focusedDay;
              return day.month == _focusedDay.month &&
                  day.year == _focusedDay.year;
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(
                  () {
                    _calendarFormat = format;
                  },
                );
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          Text(formatDate(_focusedDay, 'yyyy/MM/dd')),
        ],
      ),
    );
  }
}

//DateTime을 문자열로 변환하는 함수
String formatDate(DateTime date, String format) {
  final DateFormat formatter = DateFormat(format);
  return formatter.format(date);
}

String formatToKoreaMonth(DateTime date) {
  String formattedDate = DateFormat('MMMM yyyy', 'ko_KR').format(date);
  return formattedDate;
}
