import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

var brightnesss = SchedulerBinding.instance.window.platformBrightness;

class AppThemes {
  static final lightTheme = ThemeData(
    backgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    primaryColor: Colors.blue,
  );

  static final darkTheme = ThemeData(
    backgroundColor: Colors.blue,
    colorScheme: const ColorScheme.dark(),
    primaryColor: Colors.grey,
  );
}

extension TNColorScheme on ColorScheme {
  Color get success =>
      brightness == Brightness.dark ? Color(0xFF28a745) : Colors.amber;
  Color get info => const Color(0xFF17a2b8);
  Color get warning => const Color(0xFFffc107);
  Color get danger => const Color(0xFFdc3545);
}
