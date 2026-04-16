import 'package:coursepilot/models/models.dart';
import 'package:flutter/material.dart';

// Mock data — replace with ApiService.getCoursesByPrefix() when implemented
final _kMockResults = [
  _CourseResult(
    course: CourseListing(
      prefix: 'CSC',
      number: '316',
      name: 'Data Structures and Algorithms',
    ),
    openSections: 2,
    totalSections: 3,
  ),
  _CourseResult(
    course: CourseListing(
      prefix: 'CSC',
      number: '230',
      name: 'C and Software Tools',
    ),
    openSections: 1,
    totalSections: 3,
  ),
  _CourseResult(
    course: CourseListing(
      prefix: 'CSC',
      number: '226',
      name: 'Discrete Mathematics',
    ),
    openSections: 3,
    totalSections: 4,
  ),
];

class _CourseResult {
  const _CourseResult({
    required this.course,
    required this.openSections,
    required this.totalSections,
  });

  final CourseListing course;
  final int openSections;
  final int totalSections;
}

class SearchCoursesView extends StatefulWidget {
  const SearchCoursesView({super.key});

  @override
  State<SearchCoursesView> createState() => _SearchCoursesViewState();
}

class _SearchCoursesViewState extends State<SearchCoursesView> {
  final _searchController = TextEditingController();
  String _query = '';

  List<_CourseResult> get _results {
    if (_query.isEmpty) return [];
    final q = _query.toLowerCase();
    return _kMockResults
        .where(
          (r) =>
              r.course.name.toLowerCase().contains(q) ||
              r.course.prefix.toLowerCase().contains(q) ||
              r.course.number.contains(q),
        )
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onCoursePressed(_CourseResult result) {
    // TODO: Navigate to CourseInfoPage
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final results = _results;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: SearchBar(
            controller: _searchController,
            hintText: 'Search courses…',
            trailing: const [Icon(Icons.search)],
            onChanged: (value) => setState(() => _query = value),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
        if (_query.isNotEmpty && results.isEmpty)
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 48,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.35),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'No courses found',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(
                        alpha: 0.55,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        else if (results.isNotEmpty)
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: results.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 16, endIndent: 16),
              itemBuilder: (context, index) => _CourseResultTile(
                result: results[index],
                onTap: _onCoursePressed,
              ),
            ),
          ),
      ],
    );
  }
}

class _CourseResultTile extends StatelessWidget {
  const _CourseResultTile({required this.result, required this.onTap});

  final _CourseResult result;
  final ValueChanged<_CourseResult> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final allOpen = result.openSections == result.totalSections;
    final noneOpen = result.openSections == 0;
    final sectionColor = noneOpen
        ? theme.colorScheme.error
        : allOpen
        ? Colors.green.shade700
        : theme.colorScheme.primary;

    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
      onTap: () => onTap(result),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${result.course.prefix} ${result.course.number}',
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            result.course.name,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Row(
          children: [
            Icon(Icons.task_alt, size: 16, color: sectionColor),
            const SizedBox(width: 6),
            Text(
              '${result.openSections}/${result.totalSections} Sections Open',
              style: theme.textTheme.bodyMedium?.copyWith(color: sectionColor),
            ),
          ],
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        size: 28,
        color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
      ),
    );
  }
}
