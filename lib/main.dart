import 'package:calendar_view/calendar_view.dart';
import 'package:coursepilot/features/router/controllers/router.dart';
import 'package:coursepilot/theme/theme.dart';
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

    // integrate MaterialApp with custom router
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp.router(
        title: 'Coursepilot',
        theme: ref.read(darkThemeProvider),
        darkTheme: ref.read(darkThemeProvider),
        routerConfig: routerController,
      ),
    );
  }
}
