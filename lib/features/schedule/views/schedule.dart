import 'package:coursepilot/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ScheduleView extends ConsumerStatefulWidget {
  const ScheduleView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ScheduleViewState();
}

class ScheduleViewState extends ConsumerState<ScheduleView> {
  final _eventController = EventController();
  final TextEditingController _titleController = TextEditingController();

  /// Helper function to retrieve TimeOfDay values from DateTime object
  TimeOfDay getTimeOfDay(DateTime dateTime) {
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }
  /// Helper function to format TimeOfDay object to 'hh:mm AM/PM'
  String formatTime(TimeOfDay time) {
    if (time.hour == 0) return '12:${time.minute.toString().padLeft(2, '0')} AM';
    return '${((time.hour <= 12) ? time.hour : time.hour - 12).toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} ${(time.hour < 12) ? 'AM' : 'PM'}';
  }

  /// Helper function to convert string formatted time to TimeOfDay obj
  /// String must be in proper format of 'hh:mm AM'/'hh:mm PM' exactly to convert properly
  TimeOfDay? toTimeOfDay(String formattedTime) {
    RegExp regExp = RegExp(r'(\d{2}):(\d{2}) (AM|PM)');
    Match? match = regExp.firstMatch(formattedTime);
    if (match != null) {
    int hours = int.parse(match.group(1)!); // Group 1 is hours (hh)
    int minutes = int.parse(match.group(2)!); // Group 2 is minutes (mm)
    String period = match.group(3)!; // Group 3 is AM/PM
    if (period == 'PM') hours += 12;
      return TimeOfDay(hour: hours, minute: minutes);
    } else {
      print("Invalid time format");
      return null;
    }
  }

  /// Helper function to convert TimeOfDay to a DateTime obj given date for the time of day
  DateTime toDateTime(DateTime date, TimeOfDay timeOfDay) {
    return DateTime(
      date.year,
      date.month,
      date.day,
      timeOfDay.hour,
      timeOfDay.minute
    );
  }
  /// Temporary edit event dialog to test adding events to schedule
  /// ...will be replaced by 'add-class' ui
  Future<void> _showEditEventDialog(BuildContext context, List<CalendarEventData<Object?>> events, DateTime date) async { 
    String title = events.map((e) => e.title,).join(', ');
    _titleController.text = title;
    DateTime selectedDate = date;
    String selectedStartTimeStr = events.map((e) => formatTime(getTimeOfDay(e.startTime!))).join(', ');
    String selectedEndTimeStr = events.map((e) => formatTime(getTimeOfDay(e.endTime!))).join(', ');
    
    CalendarEventData event = CalendarEventData(
      title: title, 
      date: date,
      startTime: toDateTime(date, toTimeOfDay(selectedStartTimeStr)!),
      endTime: toDateTime(date, toTimeOfDay(selectedEndTimeStr)!),
    );
    await showDialog(
      context: context,
      barrierColor: Color(0xAA21252B),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(
                'Event Details',
                style: TextStyle(
                  fontSize: 24
                )
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(
                        fontSize: 20
                      ),

                    ),
                    style: TextStyle(
                      fontSize: 20
                    )
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? datePicked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (datePicked != null && datePicked != selectedDate) {
                        setState(() {
                          selectedDate = datePicked;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColorsDark.primary,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Text(
                        'Date: ${DateFormat("MM/dd/yyy").format(selectedDate.toLocal()).toString()}',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColorsDark.dirtyWhite
                        ),
                      ),
                    )
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          TimeOfDay? startTimePicked = await showTimePicker(
                            context: context, 
                            initialTime: toTimeOfDay(selectedStartTimeStr)!,
                          );

                          if (startTimePicked != null && startTimePicked != toTimeOfDay(selectedStartTimeStr)) {
                            setState(() {
                              selectedStartTimeStr = formatTime(startTimePicked);
                              selectedEndTimeStr = formatTime(TimeOfDay(hour: (startTimePicked.hour + 1) % 24, minute: startTimePicked.minute));
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: AppColorsDark.tertiary,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text(
                            selectedStartTimeStr,
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColorsDark.dirtyWhite
                            ),
                          ),
                        ),
                      ),
                      Text('to'),
                      ElevatedButton(
                        onPressed: () async {
                          TimeOfDay? endTimePicked = await showTimePicker(
                            context: context, 
                            initialTime: toTimeOfDay(selectedEndTimeStr)!,
                          );

                          if (endTimePicked != null && endTimePicked != toTimeOfDay(selectedEndTimeStr)) {
                            setState(() {
                              selectedEndTimeStr = formatTime(endTimePicked);
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: AppColorsDark.tertiary,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text(
                            selectedEndTimeStr,
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColorsDark.dirtyWhite
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    removeEvent(event);
                    Navigator.of(context).pop(); // Close the dialog after saving
                  },
                  child: Text('Delete'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog without saving
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (_titleController.text.isNotEmpty) {
                      DateTime eventStart = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        toTimeOfDay(selectedStartTimeStr)!.hour,
                        toTimeOfDay(selectedStartTimeStr)!.minute
                      );
                      DateTime eventEnd = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        toTimeOfDay(selectedEndTimeStr)!.hour,
                        toTimeOfDay(selectedEndTimeStr)!.minute
                      );
                      editEvent(event, _titleController.text, eventStart, eventEnd);
                      Navigator.of(context).pop(); // Close the dialog after saving
                    } else { print('not saved');}
                  },
                  child: Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  /// Temporary add event dialog to test adding events to schedule
  /// ...will be replaced by 'add-class' ui
  Future<void> _showAddEventDialog(BuildContext context) async {
    _titleController.clear();
    DateTime selectedDate = DateTime.now(); // Default to current date.
    TimeOfDay selectedStartTime = TimeOfDay(hour: DateTime.now().add(Duration(hours: 1)).hour, minute: 0);
    TimeOfDay selectedEndTime = TimeOfDay(hour: DateTime.now().add(Duration(hours: 2)).hour, minute: 0);
    await showDialog(
      context: context,
      barrierColor: Color(0xAA21252B),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(
                'Event Details',
                style: TextStyle(
                  fontSize: 24
                )
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(
                        fontSize: 20
                      ),

                    ),
                    style: TextStyle(
                      fontSize: 20
                    )
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? datePicked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (datePicked != null && datePicked != selectedDate) {
                        setState(() {
                          selectedDate = datePicked;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColorsDark.primary,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Text(
                        'Date: ${DateFormat("MM/dd/yyy").format(selectedDate.toLocal()).toString()}',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColorsDark.dirtyWhite
                        ),
                      ),
                    )
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          TimeOfDay? startTimePicked = await showTimePicker(
                            context: context, 
                            initialTime: selectedStartTime,
                          );

                          if (startTimePicked != null && startTimePicked != selectedStartTime) {
                            setState(() {
                              selectedStartTime = startTimePicked;
                              selectedEndTime = TimeOfDay(hour: (startTimePicked.hour + 1) % 24, minute: startTimePicked.minute);
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: AppColorsDark.tertiary,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text(
                            formatTime(selectedStartTime),
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColorsDark.dirtyWhite
                            ),
                          ),
                        ),
                      ),
                      Text('to'),
                      ElevatedButton(
                        onPressed: () async {
                          TimeOfDay? endTimePicked = await showTimePicker(
                            context: context, 
                            initialTime: selectedEndTime,
                          );

                          if (endTimePicked != null && endTimePicked != selectedEndTime) {
                            setState(() {
                              selectedEndTime = endTimePicked;
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: AppColorsDark.tertiary,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text(
                            formatTime(selectedEndTime),
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColorsDark.dirtyWhite
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog without saving
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (_titleController.text.isNotEmpty) {
                      DateTime eventStart = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        selectedStartTime.hour,
                        selectedStartTime.minute
                      );
                      DateTime eventEnd = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        selectedEndTime.hour,
                        selectedEndTime.minute
                      );
                      addEvent(_titleController.text, eventStart, eventEnd);
                      Navigator.of(context).pop(); // Close the dialog after saving
                    } else { print('not saved');}
                  },
                  child: Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  addEvent(String eventTitle, DateTime eventStart, DateTime eventEnd) {
    final event = CalendarEventData(
      title: eventTitle,
      date: eventStart,
      startTime: eventStart,
      endTime: eventEnd
    );
    _eventController.add(event);
  }

  editEvent(CalendarEventData event, String eventTitle, DateTime eventStart, DateTime eventEnd) {
    final updated = CalendarEventData(
      title: eventTitle,
      date: eventStart,
      startTime: eventStart,
      endTime: eventEnd
    );
    _eventController.update(event, updated);
  }

  removeEvent(CalendarEventData event) {
    _eventController.remove(event);
  }

  @override
  Widget build(BuildContext context) {
    var dayView = DayView(
      controller: _eventController,
      eventTileBuilder: (date, events, boundry, start, end) {
        return Column(
          children: events.map((event) {
            return Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.blue,
                child: ListTile(
                  title: Row(
                    children: [
                      Text(
                        event.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${formatTime(getTimeOfDay(event.startTime!))}-${formatTime(getTimeOfDay(event.endTime!))}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                        ),
                      )
                    ],
                  ),
                  // subtitle: Text("Event Details"),
                )
              )
            );
          }).toList(),
        );
      },
      fullDayEventBuilder: (events, date) {
        // Return your widget to display full day event view.
        return Container();
      },
      onEventTap:(events, date) {
        // showDialog(
        //   context: context,
        //   builder: (context) => AlertDialog(
        //     title: Text('Event Details'),
        //     content: Text(
        //       'You tapped on events for ${date.toLocal()}. \nEvents: ${events.map((e) => e.title).join(", ")}',
        //     ),
        //     actions: [
        //       TextButton(
        //         onPressed: () => Navigator.of(context).pop(),
        //         child: Text('Close'),
        //       ),
        //     ],
        //   ),
        // );
        _showEditEventDialog(context, events, date);
      },
      startHour: 8,
      endHour: 22,
      heightPerMinute: 1,
      timeLineBuilder: (date) {
        if (date.hour < 12) {
          return Text(
            '${date.hour.toString()}am',
            style: TextStyle(
              color: AppColorsDark.dirtyWhite,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          );
        } else if (date.hour == 12) {
          return Text(
            '12pm',
            style: TextStyle(
              color: AppColorsDark.dirtyWhite,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          );
        } else {
          return Text(
            '${(date.hour - 12).toString()}pm',
            style: TextStyle(
              color: AppColorsDark.dirtyWhite,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          );
        }
      },
      hourIndicatorSettings: HourIndicatorSettings(
        color: AppColorsDark.background,
      ),
      backgroundColor: AppColorsDark.background,
      showVerticalLine: true,
      dateStringBuilder: (date, {secondaryDate}) {
        if (date.compareWithoutTime(DateTime.now())){
          return 'Today ▼';
        } else if (date.getDayDifference(DateTime.now()) == 1 && date.isBefore(DateTime.now())) {
          return 'Yesterday ▼';
        } else if (date.getDayDifference(DateTime.now()) == 1 && date.isAfter(DateTime.now())) {
          return 'Tomorrow ▼';
        } else {
          return '${date.month}/${date.day}/${date.year} ▼';
        }
      },
      headerStyle: HeaderStyle(
        headerPadding: EdgeInsets.only(left:30, top: 15),
        headerTextStyle: GoogleFonts.roboto(
          color: Colors.white,
          fontSize: 35,
          fontWeight: FontWeight.w500,
        ),
        decoration: BoxDecoration(
          color: AppColorsDark.background
        ),
        titleAlign: TextAlign.left,
        leftIconConfig: IconDataConfig(
          color: AppColorsDark.dirtyWhite,
          icon:(context) {
            return SizedBox.shrink();
          },
        ),
        rightIconConfig: IconDataConfig(
          color: AppColorsDark.dirtyWhite,
          icon:(context) {
            return SizedBox.shrink();
          },
        ),
      ),
    );
    return Stack(
      children: [
        dayView,
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColorsDark.primary,
              borderRadius: BorderRadius.circular(15)
            ),
            child: IconButton(
              onPressed: () {
                _showAddEventDialog(context);
              },
              icon: Icon(Icons.add),
              color: Colors.white,
              iconSize: 35,
            )
          )
        )
      ],
    );
  }
}
