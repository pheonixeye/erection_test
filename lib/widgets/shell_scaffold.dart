import 'package:erection_test/assets/app_assets.dart';
import 'package:erection_test/core/providers/px_locale.dart';
import 'package:erection_test/core/providers/px_quiz.dart';
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
    return Consumer3<GoRouteInformationProvider, PxQuiz, PxLocale>(
      builder: (context, r, q, l, _) {
        final _path = r.value.uri.path;
        return SafeArea(
          child: Scaffold(
            drawer: Drawer(
              child: Builder(
                builder: (context) {
                  return Column(
                    spacing: 4,
                    children: [
                      DrawerHeader(
                        child: NeumorphicCard(
                          child: Image.asset(AppAssets.icon),
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        title: Text('Home'),
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
                      ),
                      ListTile(
                        title: Text('Test'),
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
                      ),
                      ListTile(
                        title: Text('About'),
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
                      ),
                      ListTile(
                        title: Text('Settings'),
                        leading: IconButton.outlined(
                          onPressed: null,
                          icon: const Icon(Icons.settings),
                        ),
                        onTap: () {
                          GoRouter.of(context).goNamed(
                            AppRouter.settings,
                            pathParameters: context.defaultPathParameters,
                          );
                          Scaffold.of(context).closeDrawer();
                        },
                      ),
                    ],
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
                ),
              ),
              automaticallyImplyLeading: false,
              actions: [
                //TODO: Change later
                if (_path.contains('home'))
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
