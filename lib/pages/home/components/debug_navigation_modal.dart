import 'package:coursepilot/models/models.dart';
import 'package:coursepilot/pages/course_info/course_info_page.dart';
import 'package:coursepilot/pages/search/search_page.dart';
import 'package:coursepilot/pages/section_info/section_info_page.dart';
import 'package:flutter/material.dart';

final _dummyCourse = CourseDetail(
  prefix: 'CSC',
  number: '216',
  name: 'Programming Concepts - Java',
  description:
      'The second course in computing. Emphasis on problem solving using '
      'the Java programming language. Coverage of data structures, '
      'object-oriented design, and software engineering principles.',
  units: 3,
  semesters: ['2025 Fall', '2026 Spring'],
);

final _dummySection = SectionDetail(
  coursePrefix: 'CSC',
  courseNumber: '216',
  number: '001',
  component: 'Lecture',
  availability: Availability(
    status: 'Open',
    openSeats: 15,
    maxSeats: 40,
    waitlisted: 0,
  ),
  schedule: Schedule(
    days: ['M', 'W', 'F'],
    beginTime: '10:15 AM',
    endTime: '11:05 AM',
  ),
  location: 'Engineering Building II 1025',
  instructors: ['John Doe'],
  begin: DateTime(2026, 1, 12),
  end: DateTime(2026, 5, 1),
  restrictions: [],
);

class DebugNavigationModal extends StatelessWidget {
  const DebugNavigationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Debug Navigation',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Search Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Course Info Page'),
            subtitle: Text(
              '${_dummyCourse.prefix} ${_dummyCourse.number} - ${_dummyCourse.name}',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CourseInfoPage(course: _dummyCourse),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.class_),
            title: const Text('Section Info Page'),
            subtitle: Text(
              '${_dummySection.coursePrefix} ${_dummySection.courseNumber} '
              'Section ${_dummySection.number}',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SectionInfoPage(section: _dummySection),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
