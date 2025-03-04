import 'package:coursepilot/features/professors/views/search.dart';
import 'package:coursepilot/features/router/views/navigation_scope.dart';
import 'package:coursepilot/features/schedule/views/add_class.dart';
import 'package:coursepilot/features/schedule/views/schedule.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// controller for the app's router (defines pages and routes to them)
final routerController = GoRouter(
  initialLocation: '/schedule',
  routes: [
    ShellRoute(
      // makes it so we don't need to define a scaffold for each page
      builder: (context, state, child) {
        return SafeArea(
          child: Scaffold(body: NavigationScopeView(child: child)),
        );
      },
      routes: [
        GoRoute(path: '/', redirect: (_, __) => '/schedule'),
        GoRoute(path: '/schedule', builder: (context, state) => ScheduleView()),
        GoRoute(
          path: '/add-class',
          builder: (context, state) => AddClassView(),
        ),
        GoRoute(path: '/search', builder: (context, state) => SearchView()),
      ],
    ),
  ],
);

class NoTransitionPage<T> extends CustomTransitionPage<T> {
  NoTransitionPage({required super.child, super.key})
    : super(transitionsBuilder: (_, __, ___, child) => child);
}
