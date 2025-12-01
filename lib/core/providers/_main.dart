import 'package:erection_test/core/providers/px_disclaimer.dart';
import 'package:erection_test/core/providers/px_locale.dart';
import 'package:erection_test/core/providers/px_quiz.dart';
import 'package:erection_test/core/providers/px_theme.dart';
import 'package:erection_test/core/router/app_router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider.value(
    value: AppRouter.router.routeInformationProvider,
  ),
  ChangeNotifierProvider(
    create: (context) => PxLocale(),
  ),
  ChangeNotifierProvider(
    create: (context) => PxTheme(),
  ),
  ChangeNotifierProvider(
    create: (context) => PxQuiz(),
  ),
  ChangeNotifierProvider(
    create: (context) => PxDisclaimer(),
  ),
];
