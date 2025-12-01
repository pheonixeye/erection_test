import 'package:erection_test/core/utils/utils_keys.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
SnackBar Isnackbar(String message) {
  return SnackBar(
    action: SnackBarAction(
      label: 'X',
      onPressed: () {
        UtilsKeys.scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
      },
    ),
    duration: const Duration(seconds: 5),
    content: Text(message),
    behavior: SnackBarBehavior.floating,
  );
}

void showIsnackbar(String message) {
  UtilsKeys.scaffoldMessengerKey.currentState?.showSnackBar(Isnackbar(message));
}
