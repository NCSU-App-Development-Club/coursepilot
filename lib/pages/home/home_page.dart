import 'package:coursepilot/pages/home/components/section_bottom_sheet.dart';
import 'package:coursepilot/pages/home/views/calendar_view.dart';
import 'package:coursepilot/pages/home/views/course_list_view.dart';
import 'package:flutter/material.dart';

import 'components/debug_navigation_modal.dart';

enum View {
  calendar(Icons.list, CalendarView()),
  list(Icons.calendar_month, CourseListView());

  final IconData icon;
  final Widget view;

  const View(this.icon, this.view);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  View _currentView = View.calendar;

  void _onMenuButtonPressed() {
    // TODO: Implement menu button action
  }

  void _onToggleView() {
    switch (_currentView) {
      case View.calendar:
        setState(() {
          _currentView = View.list;
        });

        break;
      case View.list:
        setState(() {
          _currentView = View.calendar;
        });

        break;
    }
  }

  void _onAddButtonPressed() {
    // TODO: Implement add button action
  }

  void _onMoreButtonPressed() {
    // TODO: Implement more button action
  }

  void _onSectionPressed() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SectionBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: _onMenuButtonPressed,
          icon: const Icon(Icons.keyboard_arrow_down),
        ),

        title: const Text('Schedule'),

        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const DebugNavigationModal(),
              );
            },
            icon: const Icon(Icons.bug_report),
          ),
          IconButton(
            onPressed: _onSectionPressed,
            icon: Icon(Icons.bug_report),
          ),
          IconButton(onPressed: _onToggleView, icon: Icon(_currentView.icon)),
          IconButton(
            onPressed: _onMoreButtonPressed,
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),

      body: _currentView.view,

      floatingActionButton: FloatingActionButton(
        onPressed: _onAddButtonPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}
