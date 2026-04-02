import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late DateTime _currentWeekStart;
  late DateTime _selectedDay;

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
    _selectedDay = DateTime.now();
  }

  DateTime _getMonday(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  void _previousWeek() {
    setState(() {
      _currentWeekStart = _currentWeekStart.subtract(const Duration(days: 7));
    });
  }

  void _nextWeek() {
    setState(() {
      _currentWeekStart = _currentWeekStart.add(const Duration(days: 7));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _previousWeek,
                icon: const Icon(Icons.arrow_back),
              ),
              Text(
                'Week of ${_currentWeekStart.day} ${_getMonthName(_currentWeekStart.month)} ${_currentWeekStart.year}',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: _nextWeek,
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
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
                        onTap: () {
                          setState(() {
                            _selectedDay = day;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
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
                          DateTime day = _currentWeekStart.add(Duration(days: index));
                          bool isSelected = isSameDay(_selectedDay, day);
                          return Expanded(
                            child: Container(
                              height: 60,
                              margin: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.transparent,
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

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
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
