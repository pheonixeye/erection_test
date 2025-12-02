import 'package:erection_test/core/providers/px_locale.dart';
import 'package:erection_test/core/providers/px_quiz.dart';
import 'package:erection_test/core/providers/px_theme.dart';
import 'package:erection_test/core/router/app_router.dart';
import 'package:erection_test/extensions/context_ext.dart';
import 'package:erection_test/pages/result_page/widgets/result_graph.dart';
import 'package:erection_test/pages/result_page/widgets/result_table.dart';
import 'package:erection_test/widgets/neumorphic_btn.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer3<PxQuiz, PxTheme, PxLocale>(
      builder: (context, q, t, l, _) {
        return Column(
          children: [
            SizedBox(height: 10),
            Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                context.loc.testResult,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(height: 10),
            ResultTable(
              q: q,
              t: t,
              l: l,
            ),
            const Divider(),
            ResultGraph(
              t: t,
            ),
            SizedBox(height: 10),
            NeumorphicButton(
              onTap: () {
                GoRouter.of(context).goNamed(
                  AppRouter.home,
                  pathParameters: context.defaultPathParameters,
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Consumer<PxTheme>(
                    builder: (context, t, _) {
                      return Text(
                        context.loc.home,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: t.isDark ? Colors.black : null,
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: const Icon(Icons.home),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
