import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleView extends ConsumerStatefulWidget {
  const ScheduleView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ScheduleViewState();
}

class ScheduleViewState extends ConsumerState<ScheduleView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Schedule Page',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
