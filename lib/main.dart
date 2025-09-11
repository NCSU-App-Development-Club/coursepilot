import 'package:coursepilot/features/router/controllers/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // ensure the widgets binding is initialized before changing system ui settings
  WidgetsFlutterBinding.ensureInitialized();

  // manually set system ui settings
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.top],
  );

  // run the app with a provider scope (lets us use Riverpod)
  runApp(const ProviderScope(child: MaterialApp(home: Coursepilot())));
}

class Coursepilot extends ConsumerStatefulWidget {
  const Coursepilot({super.key});

  @override
  ConsumerState<Coursepilot> createState() => _CourseFireAppState();
}

class _CourseFireAppState extends ConsumerState<Coursepilot> {
  @override
  Widget build(BuildContext context) {
    // set status bar and navigation bar colors
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarContrastEnforced: false,
      ),
    );

    final seedColor = Color.fromARGB(255, 242, 249, 255);

    final lightColorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
      primary: Color(0xFFCC0000), 
    );

    final darkColorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
      surface: Color.fromARGB(0, 255, 0, 230),
      surfaceContainer: Color(0xFF21252B),
      primary: Color(0xFFCC0000), // Wolfpack Red
      onPrimary: Color(0xFF990000) // Reynolds Red
    );

    // integrate MaterialApp with custom router
    return MaterialApp.router(
      title: 'Coursepilot',
      theme: ThemeData(
            colorScheme: darkColorScheme.copyWith(),
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme.copyWith(),
          ),
      routerConfig: routerController,
    );
  }
}
