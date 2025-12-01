import 'package:erection_test/core/providers/px_locale.dart';
import 'package:erection_test/core/providers/px_quiz.dart';
import 'package:erection_test/core/utils/random_curved_animation.dart';
import 'package:erection_test/extensions/loc_ext.dart';
import 'package:erection_test/widgets/snackbar_.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ItemScrollController itemScrollController = ItemScrollController();
  final ValueNotifier<int> _index = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer2<PxQuiz, PxLocale>(
          builder: (context, q, l, _) {
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
                  flex: 8,
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
                          child: Card.outlined(
                            elevation: 6,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 2,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width - 100,
                                    child: ListTile(
                                      title: Text(
                                        l.isEnglish
                                            ? _question.english_question
                                            : _question.arabic_question,
                                        textAlign: TextAlign.center,
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
                                            MediaQuery.sizeOf(context).width -
                                            100,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: RadioListTile<int>(
                                            title: Text(
                                              l.isEnglish
                                                  ? answer.en
                                                  : answer.ar,
                                            ),
                                            selected:
                                                answer.score ==
                                                q.scores[_question.index],
                                            selectedTileColor:
                                                Colors.amber.shade100,
                                            value: answer.score,
                                            groupValue:
                                                q.scores[_question.index],
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
                                                  curve:
                                                      RandomCurver.indexedCurve(
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
                      ElevatedButton(
                        onPressed: () {
                          if (!q.isQuestionnaireValid) {
                            showIsnackbar(
                              context.loc.questionnaireIncomplete,
                            );
                            return;
                          }
                          q.calculateScore();
                        },
                        child: Text(context.loc.calculateScore),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
