import 'package:coursepilot/features/router/controllers/router.dart';
import 'package:coursepilot/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.top],
  );

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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarContrastEnforced: false,
      ),
    );
    return MaterialApp.router(
      title: 'Coursepilot',
      theme: ref.read(darkThemeProvider),
      darkTheme: ref.read(darkThemeProvider),
      routerConfig: routerController,
    );
  }
}
