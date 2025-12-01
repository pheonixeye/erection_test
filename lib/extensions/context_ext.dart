import 'package:erection_test/core/localization/app_localizations.dart';
import 'package:erection_test/core/providers/px_locale.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}

extension DefaultPathParameters on BuildContext {
  Map<String, String> get defaultPathParameters {
    final _lang = read<PxLocale>().lang;
    return {'lang': _lang};
  }
}
