import 'package:coursepilot/pages/home/home_page.dart';
import 'package:coursepilot/pages/course_info/course_info_page.dart';
import 'package:coursepilot/pages/search/search_page.dart';
import 'package:coursepilot/pages/section_info/section_info_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'coursepilot',

      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: .fromSeed(seedColor: Colors.red),
      ),

      // These are the pages of your application
      routes: {
        "/": (context) => const HomePage(),
        "/search": (context) => const SearchPage(),
        "/course_info": (context) => const CourseInfoPage(),
        "/section_info": (context) => const SectionInfoPage(),
      },
      initialRoute: "/",
    );
  }
}
