import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_view/calendar_view.dart';

class ScheduleView extends ConsumerStatefulWidget {
  const ScheduleView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ScheduleViewState();
}

class ScheduleViewState extends ConsumerState<ScheduleView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: WeekView(
        controller: EventController(),
        eventTileBuilder: (date, events, boundry, start, end) {
          return Container();
        },
        heightPerMinute: 0.75,
        weekPageHeaderBuilder: WeekHeader.hidden,
        weekDays: [
          WeekDays.monday,
          WeekDays.tuesday,
          WeekDays.wednesday,
          WeekDays.thursday,
          WeekDays.friday,
        ],
      ),
    );
  }
}
