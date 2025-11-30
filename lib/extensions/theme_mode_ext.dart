import 'package:flutter/material.dart';

extension FromString on ThemeMode {
  ThemeMode fromString(String? value) {
    return switch (value) {
      'dark' => ThemeMode.dark,
      _ => ThemeMode.light,
    };
  }
}
