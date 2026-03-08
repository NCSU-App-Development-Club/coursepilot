import 'package:coursepilot/pages/search/views/lookup_course_view.dart';
import 'package:coursepilot/pages/search/views/search_courses_view.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Lookup'),
              Tab(text: 'Search'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [LookupCourseView(), SearchCoursesView()],
        ),
      ),
    );
  }
}
