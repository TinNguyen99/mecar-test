import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

var brightnesss = SchedulerBinding.instance.window.platformBrightness;

class AppThemes {
  static final lightTheme = ThemeData(
    backgroundColor: const Color(0xFFE5E5E5),
    colorScheme: const ColorScheme.light(),
    primaryColor: const Color(0xFF0F1317),
  );

  static final darkTheme = ThemeData(
    backgroundColor: Colors.blue,
    colorScheme: const ColorScheme.dark(),
    primaryColor: Colors.grey,
  );
}

extension TNColorScheme on ColorScheme {}
