import 'package:calendar_view/calendar_view.dart';
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
  // if we weren't using Riverpod we call Coursepilot directly
  // here in runApp.
  runApp(const ProviderScope(child: Coursepilot()));
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

    // this is entirely optional, but has some nice stuff
    // specifically, this prevents your phone from adding
    // stuff under the navigation UI
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarContrastEnforced: false,
      ),
    );

    /*
    Flutter has a really cool thing where it will generate a theme
    for you from a color. You can set the seed to whatever you want
    (try it!), and the entire app will sort of change in tint. This
    also means that (for the most part), if you use a combination of colors
    (say Theme.of(context).colorScheme.onSurface) on top of other colors (like 
    colorScheme.surface), no matter if it's dark or light theme, this
    combination will always contain the same amount of legibility.

    It does mean that it's impossible to mock up colors exactly in Figma,
    but for the sake of this sort of app this is completely fine.
    */

    final lightColorScheme = ColorScheme.fromSeed(
      seedColor: Color.fromARGB(255, 84, 143, 205),
      brightness: Brightness.light,
    );

    final darkColorScheme = ColorScheme.fromSeed(
      seedColor: Color.fromARGB(255, 84, 143, 205),
      brightness: Brightness.dark,
      // surface: Colors.black,
    );

    // integrate MaterialApp with custom router
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp.router(
        title: 'Coursepilot',
        theme: ThemeData(colorScheme: lightColorScheme),
        darkTheme: ThemeData(colorScheme: darkColorScheme),
        routerConfig: routerController,
      ),
    );
  }
}
