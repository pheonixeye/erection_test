import 'package:erection_test/core/providers/px_locale.dart';
import 'package:erection_test/core/providers/px_quiz.dart';
import 'package:erection_test/core/providers/px_theme.dart';
import 'package:erection_test/core/utils/number_translator.dart';
import 'package:erection_test/core/utils/random_curved_animation.dart';
import 'package:erection_test/extensions/category_color.dart';
import 'package:erection_test/extensions/context_ext.dart';
import 'package:erection_test/widgets/neumorphic_btn.dart';
import 'package:erection_test/widgets/neumorphic_card.dart';
import 'package:erection_test/widgets/snackbar_.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TestPage extends StatelessWidget {
  TestPage({super.key});

  final ItemScrollController itemScrollController = ItemScrollController();
  final ValueNotifier<int> _index = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Consumer3<PxQuiz, PxTheme, PxLocale>(
      builder: (context, q, t, l, _) {
        while (q.questions == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final _questions = q.questions!;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 12,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: ScrollablePositionedList.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: !l.isEnglish,
                  itemCount: _questions.length,
                  itemScrollController: itemScrollController,
                  itemBuilder: (context, index) {
                    final _question = _questions[index];
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: NeumorphicCard(
                        color: categoryColor(
                          _question.index,
                          isDark: t.isDark,
                        ),
                        // elevation: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 2,
                            children: [
                              CircleAvatar(
                                child: Text(
                                  '${_question.index}'.toArabicNumber(context),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width - 100,
                                  child: Text(
                                    l.isEnglish
                                        ? _question.english_question
                                        : _question.arabic_question,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleLarge,
                                  ),
                                ),
                              ),
                              ..._question.answers.map((answer) {
                                return Directionality(
                                  textDirection: l.isEnglish
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width - 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RadioListTile<int>(
                                        title: Text(
                                          l.isEnglish ? answer.en : answer.ar,
                                        ),
                                        selected:
                                            answer.score ==
                                            q.scores[_question.index],
                                        selectedTileColor:
                                            Colors.amber.shade100,
                                        value: answer.score,
                                        groupValue: q.scores[_question.index],
                                        onChanged: (value) {
                                          if (value != null) {
                                            q.setQuestionScore(
                                              _question.index,
                                              value,
                                            );

                                            itemScrollController.scrollTo(
                                              index: index + 1,
                                              duration: const Duration(
                                                milliseconds: 600,
                                              ),
                                              curve: RandomCurver.indexedCurve(
                                                index,
                                              ),
                                            );
                                            _index.value = index + 1;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Spacer(),

            if (q.isQuestionnaireValid) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NeumorphicButton(
                    onTap: () {
                      if (!q.isQuestionnaireValid) {
                        showIsnackbar(
                          context.loc.questionnaireIncomplete,
                        );
                        return;
                      }
                      q.calculateScore();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          context.loc.calculateScore,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: t.isDark ? Colors.black : null,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: const Icon(Icons.calculate_rounded),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  NeumorphicButton(
                    onTap: () {
                      showIsnackbar(
                        context.loc.questionnaireReset,
                      );

                      q.resetScore();

                      itemScrollController.scrollTo(
                        index: 0,
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        curve: RandomCurver.indexedCurve(0),
                      );
                      _index.value = 1;
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          context.loc.retakeTest,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: t.isDark ? Colors.black : null,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: const Icon(Icons.refresh),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ],
        );
      },
    );
  }
}
