import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now(); // Initialize _selectedDay to a default value
  int meditationCount = 0;
  int consecutiveDays = 0;
  Set<DateTime> markedDates = {};

  void updateMeditationCount() {
    if (isSameMonth(_selectedDay, DateTime.now()) && !markedDates.contains(_selectedDay)) {
      meditationCount++;
      consecutiveDays++;
      markedDates.add(_selectedDay);
    }
  }

  bool isSameMonth(DateTime day1, DateTime day2) {
    return day1.year == day2.year && day1.month == day2.month;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background1.jpg'), // Replace with your own image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 16.0, 16.0, 0.0),
                child: Text(
                  '내 수행일지',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: TableCalendar(
                      focusedDay: _focusedDay,
                      firstDay: DateTime.utc(2022, 1, 1),
                      lastDay: DateTime.now().add(Duration(days: 365)),
                      calendarFormat: _calendarFormat,
                      selectedDayPredicate: (day) {
                        return isSameMonth(_selectedDay, day) && markedDates.contains(day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                      onFormatChanged: (format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      },
                      calendarStyle: CalendarStyle(
                        defaultTextStyle: TextStyle(color: Colors.white),
                        selectedTextStyle: TextStyle(color: Colors.white),
                        todayTextStyle: TextStyle(color: Colors.white),
                        weekendTextStyle: TextStyle(color: Colors.white),
                        outsideTextStyle: TextStyle(color: Colors.white),
                        outsideDaysVisible: false,
                      ),
                      headerStyle: HeaderStyle(
                        titleTextStyle: TextStyle(color: Colors.white),
                        formatButtonDecoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        formatButtonTextStyle: TextStyle(color: Colors.white),
                        leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                        rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: ElevatedButton(
                  onPressed: markedDates.contains(DateTime.now()) ? null : () => setState(() => updateMeditationCount()),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey; // Disabled 버튼 배경색
                        }
                        return Colors.black.withOpacity(0.3); // Enabled 버튼 배경색
                      },
                    ),
                  ),
                  child: Text(
                    '오늘의 명상 완료',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: Text(
                  '이번달 명상 횟수: $meditationCount',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Center(
                child: Text(
                  '연속 명상 일수: $consecutiveDays',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ],
      ),
    );
  }
}
