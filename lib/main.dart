import 'package:bus_schedule/di/di_locator.dart' as di_locator;
import 'package:bus_schedule/features/launch_page/presentation/ui/launch_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget screen = const LaunchPage();
  await di_locator.initLocator();

  runApp(
    BusScheduleApp(screen: screen),
  );
}

class BusScheduleApp extends StatelessWidget {
  const BusScheduleApp({
    super.key,
    required this.screen,
  });

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: screen,
    );
  }
}
