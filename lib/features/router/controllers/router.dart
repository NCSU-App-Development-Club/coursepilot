import 'package:coursepilot/features/router/views/navigation_scope.dart';
import 'package:coursepilot/features/schedule/views/schedule.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final routerController = GoRouter(
  initialLocation: '/schedule',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(body: NavigationScopeView(child: child));
      },
      routes: [
        GoRoute(path: '/', redirect: (_, __) => '/schedule'),
        GoRoute(path: '/schedule', builder: (context, state) => ScheduleView()),
      ],
    ),
  ],
);

class NoTransitionPage<T> extends CustomTransitionPage<T> {
  NoTransitionPage({required super.child, super.key})
    : super(transitionsBuilder: (_, __, ___, child) => child);
}
