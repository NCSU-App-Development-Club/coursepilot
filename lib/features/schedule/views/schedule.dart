import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalender/kalender.dart';

/*
Important for whoever works on this!

For this we will be using a library called "kalender".
This gives us a very nice widget that can be heavily
customized for our needs.

For this example, I've simply taken the example from
the package website (linked below). It looks ugly right
now, but it the most simple example the package creator
has.

It will need to be adapted to fit the design from Figma. Note that the 
figma design is a general guiderail - it looks like
kalendar (the package) has some very nice usages that
fit our use case - remember that our use case is to
just show a nice calendar. Specifically, in the mockup
I've added the dropdown starting at "Today". That is
absolutely not needed, and if you can provide a good
user experience for selecting different terms (day,
week, or month), that is completely fine.

Check out the library here-
https://pub.dev/packages/kalender
 */

class ScheduleView extends ConsumerStatefulWidget {
  const ScheduleView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ScheduleViewState();
}

class ScheduleViewState extends ConsumerState<ScheduleView> {
  final eventsController = DefaultEventsController();
  final calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CalendarView(
        eventsController: eventsController,
        calendarController: calendarController,
        // The calender widget will automatically display the correct header & body widgets based on the viewConfiguration.
        viewConfiguration: MultiDayViewConfiguration.singleDay(),
        callbacks: CalendarCallbacks(
          onEventTapped:
              (event, renderBox) => calendarController.selectEvent(event),
          onEventCreate: (event) => event.copyWith(data: "Some data"),
          onEventCreated: (event) => eventsController.addEvent(event),
        ),
        header: CalendarHeader(),
        body: CalendarBody(),
      ),
    );
  }
}
