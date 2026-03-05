import 'package:coursepilot/models/models.dart';
import 'package:flutter/material.dart';

class CourseInfoPage extends StatelessWidget {
  final CourseDetail course;

  const CourseInfoPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${course.prefix} ${course.number}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(course.name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('${course.units} units'),
            const SizedBox(height: 8),
            Text(course.description),
            const SizedBox(height: 8),
            Text('Semesters: ${course.semesters.join(", ")}'),
          ],
        ),
      ),
    );
  }
}
