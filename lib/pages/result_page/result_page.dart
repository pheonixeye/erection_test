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
        return ListView(
          children: [
            SizedBox(height: 10),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  context.loc.testResult,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: AlignmentDirectional.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ResultTable(
                  q: q,
                  t: t,
                  l: l,
                ),
              ),
            ),
            const Divider(),
            if (q.domainScore != null)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    q.domainScore?.name ?? '',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ResultGraph(
                t: t,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: MediaQuery.sizeOf(context).width * 0.3,
              ),
              child: NeumorphicButton(
                onTap: () {
                  GoRouter.of(context).goNamed(
                    AppRouter.home,
                    pathParameters: context.defaultPathParameters,
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<PxTheme>(
                      builder: (context, t, _) {
                        return Text(
                          context.loc.home,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
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
            ),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
