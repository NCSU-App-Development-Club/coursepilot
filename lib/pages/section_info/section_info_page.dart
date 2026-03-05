import 'package:coursepilot/models/models.dart';
import 'package:flutter/material.dart';

class SectionInfoPage extends StatelessWidget {
  final SectionDetail section;

  const SectionInfoPage({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${section.coursePrefix} ${section.courseNumber} - ${section.number}',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Component: ${section.component}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text('Location: ${section.location}'),
            Text('Instructors: ${section.instructors.join(", ")}'),
            Text(
              'Schedule: ${section.schedule.days.join("")} '
              '${section.schedule.beginTime} - ${section.schedule.endTime}',
            ),
            const SizedBox(height: 8),
            Text(
              'Seats: ${section.availability.openSeats}/${section.availability.maxSeats} '
              '(${section.availability.status})',
            ),
            Text('Waitlisted: ${section.availability.waitlisted}'),
          ],
        ),
      ),
    );
  }
}
