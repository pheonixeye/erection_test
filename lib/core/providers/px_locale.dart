import 'package:erection_test/core/utils/shared_prefs.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier, Locale;

class PxLocale extends ChangeNotifier {
  static Locale _locale = const Locale("ar");
  Locale get locale => _locale;

  void setLocale() {
    _locale = Locale(_lang);
    notifyListeners();
    // print("PxLocale().setLocale($_locale)");
  }

  static String _lang = 'ar';
  String get lang => _lang;
  static String get langStatic => _lang;

  Future<void> setLang(String value) async {
    _lang = value;
    await asyncPrefs.setString('lang', _lang);
    notifyListeners();
  }

  Future<void> toggleLanguage() async {
    isEnglish ? await setLang('ar') : await setLang('en');
    setLocale();
  }

  bool get isEnglish => lang == 'en' && locale == const Locale("en");
}
