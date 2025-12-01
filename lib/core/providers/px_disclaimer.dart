import 'package:erection_test/core/utils/utils_keys.dart';
import 'package:erection_test/widgets/disclaimer_card.dart';
import 'package:flutter/material.dart';

class PxDisclaimer extends ChangeNotifier {
  PxDisclaimer() {
    _toggleAfterVisit();
  }

  static bool _isFirstVisit = true;
  bool get isFirstVisit => _isFirstVisit;

  void _toggleAfterVisit() async {
    if (_isFirstVisit) {
      await Future.delayed(const Duration(seconds: 1));
      _isFirstVisit = false;
      _showDisclaimer();
    }
  }

  void _showDisclaimer() async {
    final _widget = DisclaimerCard();

    final _entry = OverlayEntry(
      builder: (context) {
        return _widget;
      },
    );

    _widget.onTap = () {
      _entry.remove();
    };

    if (UtilsKeys.isNavKeyContextNotNull) {
      Overlay.of(
        UtilsKeys.navigatorKey.currentContext!,
      ).insert(_entry);
    }
  }
}
