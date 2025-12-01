import 'package:erection_test/core/utils/utils_keys.dart';
import 'package:erection_test/widgets/disclaimer_card.dart';
import 'package:flutter/material.dart';

class PxDisclaimer extends ChangeNotifier {
  PxDisclaimer(this.context) {
    _toggleAfterVisit();
  }
  final BuildContext context;

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
    Overlay.of(
      UtilsKeys.navigatorKey.currentContext!,
    ).insert(_entry);

    _widget.onTap = () {
      _entry.remove();
    };
  }
}
