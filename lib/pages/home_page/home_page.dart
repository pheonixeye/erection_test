import 'package:erection_test/core/providers/px_disclaimer.dart';
import 'package:erection_test/core/providers/px_locale.dart';
import 'package:erection_test/core/providers/px_quiz.dart';
import 'package:erection_test/core/providers/px_theme.dart';
import 'package:erection_test/core/router/app_router.dart';
import 'package:erection_test/extensions/context_ext.dart';
import 'package:erection_test/widgets/neumorphic_btn.dart';
import 'package:erection_test/widgets/neumorphic_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer4<PxQuiz, PxDisclaimer, PxTheme, PxLocale>(
      builder: (context, q, _, t, l, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: NeumorphicCard(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text.rich(
                    TextSpan(text: context.loc.introText),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            NeumorphicButton(
              onTap: () {
                q.resetScore();
                GoRouter.of(context).goNamed(
                  AppRouter.test,
                  pathParameters: context.defaultPathParameters,
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.loc.beginTest,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: t.isDark ? Colors.black : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: const Icon(Icons.send_rounded),
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
