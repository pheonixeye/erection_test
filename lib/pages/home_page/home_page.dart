import 'package:erection_test/core/providers/px_locale.dart';
import 'package:erection_test/core/providers/px_quiz.dart';
import 'package:erection_test/extensions/loc_ext.dart';
import 'package:erection_test/widgets/snackbar_.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<PxQuiz, PxLocale>(
        builder: (context, q, l, _) {
          while (q.questions == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final _questions = q.questions;
          return ListView.builder(
            itemCount: _questions?.length,
            itemBuilder: (context, index) {
              final _question = _questions![index];
              return ListTile(
                title: Text(
                  l.isEnglish
                      ? _question.english_question
                      : _question.arabic_question,
                ),
                subtitle: Column(
                  children: [
                    ..._question.answers.map((answer) {
                      return RadioListTile<int>(
                        title: Text(
                          l.isEnglish ? answer.en : answer.ar,
                        ),
                        value: answer.score,
                        groupValue: q.scores[_question.index],
                        onChanged: (value) {
                          if (value != null) {
                            q.setQuestionScore(_question.index, value);
                          }
                        },
                      );
                    }),
                    if (index == 14)
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
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
