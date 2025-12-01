import 'package:erection_test/core/localization/app_localizations.dart';
import 'package:erection_test/core/providers/_main.dart';
import 'package:erection_test/core/providers/px_locale.dart';
import 'package:erection_test/core/providers/px_theme.dart';
import 'package:erection_test/core/router/app_router.dart';
import 'package:erection_test/core/utils/app_theme.dart';
import 'package:erection_test/core/utils/shared_prefs.dart';
import 'package:erection_test/core/utils/utils_keys.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  initAsyncPrefs();
  await initializeDateFormatting('ar');
  await initializeDateFormatting('en');
  runApp(const AppProvider());
}

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<PxLocale, PxTheme>(
      builder: (context, l, t, _) {
        return MaterialApp.router(
          scaffoldMessengerKey: UtilsKeys.scaffoldMessengerKey,
          // title: context.loc.erectionTest,
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          locale: l.locale,
          darkTheme: AppTheme.darkTheme(context, !l.isEnglish),
          theme: AppTheme.lightTheme(context, !l.isEnglish),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          themeMode: t.themeMode,
          //TODO: make themes
          builder: (context, child) {
            return Overlay(
              initialEntries: [
                OverlayEntry(
                  builder: (context) => child!,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
