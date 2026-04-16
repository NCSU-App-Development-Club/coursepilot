import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late DateTime _currentWeekStart;

  final List<String> _times = [
    '8:00 AM',
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
  ];

  @override
  void initState() {
    super.initState();
    _currentWeekStart = _getMonday(DateTime.now());
  }

  DateTime _getMonday(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                width: 60,
                child: Text(
                  'Time',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Row(
                  children: List.generate(5, (index) {
                    DateTime day = _currentWeekStart.add(Duration(days: index));
                    return Expanded(
                      child: GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(0.0),
                          child: Text(
                            _getDayName(day.weekday),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: _times.map((time) {
                return Row(
                  children: [
                    SizedBox(
                      width: 60,
                      child: Text(time),
                    ),
                    Expanded(
                      child: Row(
                        children: List.generate(5, (index) {
                          return Expanded(
                            child: Container(
                              height: 60,
                              margin: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.transparent,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
        
      ),
    );
  }

  String _getDayName(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
    return days[weekday - 1];
  }
}

bool isSameDay(DateTime? a, DateTime? b) {
  if (a == null || b == null) return false;
  return a.year == b.year && a.month == b.month && a.day == b.day;
}
