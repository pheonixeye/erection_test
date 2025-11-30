import 'package:erection_test/core/utils/shared_prefs.dart';
import 'package:erection_test/extensions/theme_mode_ext.dart';
import 'package:flutter/material.dart';

class PxTheme extends ChangeNotifier {
  PxTheme() {
    _init();
  }

  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  Future<void> _init() async {
    final _stored = await asyncPrefs.getString('theme');
    _themeMode = _themeMode.fromString(_stored);
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _themeMode = _themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    await asyncPrefs.setString('theme', _themeMode.name.split('.').last);
    notifyListeners();
  }
}
