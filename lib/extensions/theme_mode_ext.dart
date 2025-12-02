import 'package:flutter/material.dart';

extension FromString on ThemeMode {
  ThemeMode fromString(String? value) {
    return switch (value) {
      'light' => ThemeMode.light,
      _ => ThemeMode.dark,
    };
  }
}
