import 'package:erection_test/core/providers/px_locale.dart';
import 'package:erection_test/core/providers/px_quiz.dart';
import 'package:erection_test/core/utils/shared_prefs.dart';
import 'package:erection_test/core/utils/utils_keys.dart';
import 'package:erection_test/pages/about_page/about_page.dart';
import 'package:erection_test/pages/home_page/home_page.dart';
import 'package:erection_test/pages/lang_page/lang_page.dart';
import 'package:erection_test/pages/loading_page/loading_page.dart';
import 'package:erection_test/pages/result_page/result_page.dart';
import 'package:erection_test/pages/test_page/test_page.dart';
import 'package:erection_test/widgets/shell_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRouter {
  const AppRouter();

  ///route names
  static const String loading = "/";
  static const String lang = ":lang";
  static const String home = "home";
  static const String about = "about";
  static const String test = "test";
  static const String result = "result";

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: UtilsKeys.navigatorKey,
    initialLocation: loading,
    redirect: (context, state) async {
      final _locale = context.read<PxLocale>();
      final _urlLang = state.pathParameters['lang'];
      if (_urlLang != null && _urlLang != _locale.lang) {
        try {
          await _locale.setLang(_urlLang);
          _locale.setLocale();
          return null;
        } catch (e) {
          return null;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: loading, // /
        name: loading,
        builder: (context, state) {
          return LoadingPage(
            key: state.pageKey,
          );
        },
        redirect: (context, state) async {
          if (state.fullPath == loading) {
            final _storedLanguage = await asyncPrefs.getString('lang');
            if (_storedLanguage != null) {
              return '/$_storedLanguage';
            } else {
              return '/ar';
            }
          }
          return null;
        },
        routes: [
          GoRoute(
            path: lang, // /:lang
            name: lang,
            builder: (context, state) {
              return LangPage(
                key: state.pageKey,
              );
            },
            redirect: (context, state) async {
              if (state.fullPath == '/:lang') {
                return '/${state.pathParameters['lang']}/$home';
              }
              if (state.fullPath != '/:lang') {
                return null;
              }
              return null;
            },
            routes: [
              ShellRoute(
                builder: (context, state, child) {
                  return ShellScaffold(child: child);
                },
                routes: [
                  GoRoute(
                    path: home,
                    name: home,
                    builder: (context, state) {
                      return HomePage(
                        key: state.pageKey,
                      );
                    },
                  ),
                  GoRoute(
                    path: about,
                    name: about,
                    builder: (context, state) {
                      return AboutPage(
                        key: state.pageKey,
                      );
                    },
                  ),
                  GoRoute(
                    path: test,
                    name: test,
                    builder: (context, state) {
                      return TestPage(
                        key: state.pageKey,
                      );
                    },
                    redirect: (context, state) {
                      context.read<PxQuiz>().resetScore();
                      return null;
                    },
                  ),
                  GoRoute(
                    path: result,
                    name: result,
                    builder: (context, state) {
                      return ResultPage(
                        key: state.pageKey,
                      );
                    },
                    redirect: (context, state) {
                      final _q = context.read<PxQuiz>();
                      if (!_q.isQuestionnaireValid) {
                        return '/${state.pathParameters['lang']}/$home';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
