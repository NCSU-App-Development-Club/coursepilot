import 'package:coursepilot/pages/home/home_page.dart';
import 'package:coursepilot/pages/search/search_page.dart';
import 'package:coursepilot/services/api_service.dart';
import 'package:coursepilot/services/schedule_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final scheduleBox = await Hive.openBox<String>('schedules');

  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<ScheduleService>(ScheduleService(scheduleBox));

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

      home: const HomePage(),
    );
  }
}
