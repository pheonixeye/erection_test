import 'package:erection_test/assets/app_assets.dart';
import 'package:erection_test/core/providers/px_locale.dart';
import 'package:erection_test/core/providers/px_quiz.dart';
import 'package:erection_test/core/providers/px_theme.dart';
import 'package:erection_test/core/router/app_router.dart';
import 'package:erection_test/core/utils/number_translator.dart';
import 'package:erection_test/extensions/context_ext.dart';
import 'package:erection_test/widgets/neumorphic_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ShellScaffold extends StatelessWidget {
  const ShellScaffold({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Consumer4<GoRouteInformationProvider, PxQuiz, PxTheme, PxLocale>(
      builder: (context, r, q, t, l, _) {
        final _path = r.value.uri.path;
        final _currentPath = r.value.uri.pathSegments.last;
        return SafeArea(
          child: Scaffold(
            drawer: Drawer(
              child: Builder(
                builder: (context) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      listTileTheme: ListTileThemeData(
                        selectedTileColor: t.isDark
                            ? Colors.amber.shade50
                            : Colors.amber,
                        selectedColor: t.isDark
                            ? Colors.blue
                            : Colors.blue.shade50,
                      ),
                    ),
                    child: Column(
                      spacing: 4,
                      children: [
                        DrawerHeader(
                          child: NeumorphicCard(
                            child: Image.asset(AppAssets.icon),
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          title: Text(context.loc.home),
                          leading: IconButton.outlined(
                            onPressed: null,
                            icon: const Icon(Icons.description),
                          ),
                          onTap: () {
                            GoRouter.of(context).goNamed(
                              AppRouter.home,
                              pathParameters: context.defaultPathParameters,
                            );
                            Scaffold.of(context).closeDrawer();
                          },
                          selected: _currentPath == 'home',
                        ),
                        ListTile(
                          title: Text(context.loc.test),
                          leading: IconButton.outlined(
                            onPressed: null,
                            icon: const Icon(Icons.edit_document),
                          ),
                          onTap: () {
                            GoRouter.of(context).goNamed(
                              AppRouter.test,
                              pathParameters: context.defaultPathParameters,
                            );

                            Scaffold.of(context).closeDrawer();
                          },
                          selected: _currentPath == 'test',
                        ),
                        ListTile(
                          title: Text(context.loc.about),
                          leading: IconButton.outlined(
                            onPressed: null,
                            icon: const Icon(Icons.info),
                          ),
                          onTap: () {
                            GoRouter.of(context).goNamed(
                              AppRouter.about,
                              pathParameters: context.defaultPathParameters,
                            );
                            Scaffold.of(context).closeDrawer();
                          },
                          selected: _currentPath == 'about',
                        ),

                        ListTile(
                          title: Text(context.loc.theme),
                          leading: IconButton.outlined(
                            onPressed: null,
                            icon: const Icon(Icons.dark_mode),
                          ),
                          onTap: () async {
                            await t.toggleTheme();
                            if (context.mounted) {
                              Scaffold.of(context).closeDrawer();
                            }
                          },
                        ),
                        ListTile(
                          title: Text(context.loc.language),
                          leading: IconButton.outlined(
                            onPressed: null,
                            icon: const Icon(Icons.language),
                          ),
                          onTap: () async {
                            l.toggleLanguage();
                            final _currentRoute = r.value.uri.pathSegments.last;
                            GoRouter.of(context).goNamed(
                              _currentRoute,
                              pathParameters: context.defaultPathParameters,
                            );
                            if (context.mounted) {
                              Scaffold.of(context).closeDrawer();
                            }
                          },
                        ),
                        const Spacer(),
                        Text.rich(
                          TextSpan(
                            text: context.loc.designedByKareemZaher,
                            children: [
                              TextSpan(text: '\n'),
                              TextSpan(text: context.loc.copyright),
                              TextSpan(text: '\n'),
                              TextSpan(
                                text: '@ ${DateTime.now().year}'.toArabicNumber(
                                  context,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 4),
                      ],
                    ),
                  );
                },
              ),
            ),
            appBar: AppBar(
              leading: Builder(
                builder: (context) {
                  return IconButton.outlined(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  );
                },
              ),
              title: Text.rich(
                TextSpan(
                  text: context.loc.erectionTest,
                  children: [
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: _path,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              automaticallyImplyLeading: false,
              actions: [
                if (_path.contains('test'))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      '${q.scores.keys.length} / 15'.toArabicNumber(context),
                    ),
                  ),
              ],
            ),
            body: child,
          ),
        );
      },
    );
  }
}
