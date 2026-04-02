import 'package:coursepilot/models/models.dart';
import 'package:flutter/material.dart';

class CourseListView extends StatelessWidget {
  const CourseListView({super.key});

  static final _courses = [
    _CourseSectionEntry(
      course: CourseDetail(
        prefix: 'CSC',
        number: '474',
        name: 'Network Security',
        description: 'Introduces core concepts in network security.',
        units: 3,
        semesters: ['Fall 2026'],
      ),
      section: SectionDetail(
        coursePrefix: 'CSC',
        courseNumber: '474',
        number: '003',
        component: 'Lecture',
        availability: Availability(
          status: 'Open',
          openSeats: 12,
          maxSeats: 100,
          waitlisted: 0,
        ),
        schedule: Schedule(
          days: ['M', 'T', 'W', 'R', 'F'],
          beginTime: '10:30 AM',
          endTime: '11:30 AM',
        ),
        location: 'Centennial Campus',
        instructors: ['Jamie Jennings'],
        begin: DateTime(2026, 8, 18),
        end: DateTime(2026, 12, 4),
        restrictions: [],
      ),
    ),
    _CourseSectionEntry(
      course: CourseDetail(
        prefix: 'CSC',
        number: '505',
        name: 'Algorithms',
        description: 'Graduate study of algorithm design and analysis.',
        units: 3,
        semesters: ['Fall 2026'],
      ),
      section: SectionDetail(
        coursePrefix: 'CSC',
        courseNumber: '505',
        number: '001',
        component: 'Lab',
        availability: Availability(
          status: 'Waitlisted',
          openSeats: 0,
          maxSeats: 40,
          waitlisted: 2,
        ),
        schedule: Schedule(
          days: ['T', 'R'],
          beginTime: '1:30 PM',
          endTime: '2:45 PM',
        ),
        location: 'North Campus',
        instructors: ['Sarah Earp'],
        begin: DateTime(2026, 8, 18),
        end: DateTime(2026, 12, 4),
        restrictions: [],
      ),
    ),
    _CourseSectionEntry(
      course: CourseDetail(
        prefix: 'CSC',
        number: '510',
        name: 'Software Engineering',
        description: 'Covers software process, design, and team delivery.',
        units: 3,
        semesters: ['Fall 2026'],
      ),
      section: SectionDetail(
        coursePrefix: 'CSC',
        courseNumber: '510',
        number: '002',
        component: 'Lecture',
        availability: Availability(
          status: 'Closed',
          openSeats: 0,
          maxSeats: 60,
          waitlisted: 1,
        ),
        schedule: Schedule(
          days: ['M', 'W', 'F'],
          beginTime: '3:00 PM',
          endTime: '4:00 PM',
        ),
        location: 'Centennial Campus',
        instructors: ['Michael Lee'],
        begin: DateTime(2026, 8, 18),
        end: DateTime(2026, 12, 4),
        restrictions: [],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _courses.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final course = _courses[index];
        return _CourseListTile(course: course);
      },
    );
  }
}

class _CourseListTile extends StatelessWidget {
  const _CourseListTile({required this.course});

  final _CourseSectionEntry course;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 14, 12, 12),
      minVerticalPadding: 0,
      titleAlignment: ListTileTitleAlignment.top,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '${course.course.prefix} ${course.course.number} (${course.section.number}) · ${course.section.component}',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 12),
          _SeatCountBadge(availability: course.section.availability),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.person, size: 16),
              const SizedBox(width: 4),
              Text(
                course.section.instructors.join(', '),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.schedule, size: 16),
              const SizedBox(width: 4),
              Expanded(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 6,
                  children: [
                    _WeekdayStrip(days: course.section.schedule.days),
                    Text(
                      '· ${course.section.schedule.beginTime} / ${course.section.schedule.endTime}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            course.section.location,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
      trailing: const Padding(
        padding: EdgeInsets.only(top: 28),
        child: Icon(Icons.chevron_right, size: 32),
      ),
    );
  }
}

class _SeatCountBadge extends StatelessWidget {
  const _SeatCountBadge({required this.availability});

  final Availability availability;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final badgeStyle = _AvailabilityBadgeStyle.resolve(theme, availability);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: badgeStyle.backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(badgeStyle.icon, size: 18, color: badgeStyle.foregroundColor),
          const SizedBox(width: 8),
          Text(
            badgeStyle.countText,
            style: theme.textTheme.titleSmall?.copyWith(
              color: badgeStyle.foregroundColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _AvailabilityBadgeStyle {
  static const _openGreen = Color(0xFF2E7D32);
  static const _waitlistYellow = Color(0xFFF9A825);

  const _AvailabilityBadgeStyle({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
    required this.countText,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final IconData icon;
  final String countText;

  static _AvailabilityBadgeStyle resolve(
    ThemeData theme,
    Availability availability,
  ) {
    final normalizedStatus = availability.status.trim().toLowerCase();

    if (normalizedStatus == 'closed') {
      return _AvailabilityBadgeStyle(
        backgroundColor: theme.colorScheme.error,
        foregroundColor: theme.colorScheme.onError,
        icon: Icons.block,
        countText: '0/${availability.maxSeats}',
      );
    }

    if (normalizedStatus == 'waitlisted' || availability.waitlisted > 0) {
      return _AvailabilityBadgeStyle(
        backgroundColor: _waitlistYellow,
        foregroundColor: Colors.black87,
        icon: Icons.hourglass_top,
        countText:
            '(${availability.waitlisted}) ${availability.openSeats}/${availability.maxSeats}',
      );
    }

    return _AvailabilityBadgeStyle(
      backgroundColor: _openGreen,
      foregroundColor: Colors.white,
      icon: Icons.person_outline,
      countText: '${availability.openSeats}/${availability.maxSeats}',
    );
  }
}

class _WeekdayStrip extends StatelessWidget {
  const _WeekdayStrip({required this.days});

  static const _weekdayOrder = ['M', 'T', 'W', 'R', 'F'];
  static const _weekdayLabels = ['M', 'T', 'W', 'T', 'F'];

  final List<String> days;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeDays = days.map(_normalizeDay).toSet();
    final activeColor = theme.colorScheme.onSurface;
    final inactiveColor = theme.colorScheme.onSurface.withValues(alpha: 0.35);

    return RichText(
      text: TextSpan(
        style: theme.textTheme.titleMedium,
        children: [
          for (var index = 0; index < _weekdayOrder.length; index++) ...[
            TextSpan(
              text: _weekdayLabels[index],
              style: TextStyle(
                color: activeDays.contains(_weekdayOrder[index])
                    ? activeColor
                    : inactiveColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (index != _weekdayOrder.length - 1)
              TextSpan(
                text: ' ',
                style: TextStyle(color: theme.colorScheme.onSurface),
              ),
          ],
        ],
      ),
    );
  }

  String _normalizeDay(String day) {
    switch (day.trim().toUpperCase()) {
      case 'TH':
      case 'R':
        return 'R';
      case 'TU':
      case 'T':
        return 'T';
      default:
        return day.trim().toUpperCase();
    }
  }
}

class _CourseSectionEntry {
  const _CourseSectionEntry({required this.course, required this.section});

  final CourseDetail course;
  final SectionDetail section;
}
