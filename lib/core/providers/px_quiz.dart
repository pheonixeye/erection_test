import 'dart:convert';

import 'package:erection_test/assets/app_assets.dart';
import 'package:erection_test/models/constants.dart';
import 'package:erection_test/models/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PxQuiz extends ChangeNotifier {
  PxQuiz() {
    _init();
  }
  List<Question>? _questions;
  List<Question>? get questions => _questions;

  Future<void> _init() async {
    final _bundle = await rootBundle.loadString(AppAssets.questions);
    final _map = json.decode(_bundle) as List<dynamic>;
    _questions = _map.map((e) => Question.fromJson(e)).toList();
    notifyListeners();
    print(questions);
  }

  final Map<int, int?> _scores = {};
  Map<int, int?> get scores => _scores;

  void setQuestionScore(int index, int score) {
    _scores[index] = score;
    notifyListeners();
  }

  bool get isQuestionnaireValid =>
      _scores.keys.length == 15 &&
      _scores.entries.any(
        (entry) => entry.value != null,
      );

  final Map<int, int> _erectileFunctionScore = {};

  int get erectileFunctionScore =>
      _erectileFunctionScore.values.fold(0, (a, b) => a + b);

  final Map<int, int> _orgasmicFunctionScore = {};

  int get orgasmicFunctionScore =>
      _orgasmicFunctionScore.values.fold(0, (a, b) => a + b);

  final Map<int, int> _sexualDesireScore = {};

  int get sexualDesireScore =>
      _sexualDesireScore.values.fold(0, (a, b) => a + b);

  final Map<int, int> _intercourseSatisfactionScore = {};

  int get intercourseSatisfactionScore =>
      _intercourseSatisfactionScore.values.fold(0, (a, b) => a + b);

  final Map<int, int> _overallSatisfactionScore = {};

  int get overallSatisfactionScore =>
      _overallSatisfactionScore.values.fold(0, (a, b) => a + b);

  void calculateScore() {
    if (!isQuestionnaireValid) {
      return;
    }
    _scores.entries.map((entry) {
      if (erectileFunctionIndexes.contains(entry.key)) {
        _erectileFunctionScore[entry.key] = entry.value!;
      }
      if (orgasmicFunctionIndexes.contains(entry.key)) {
        _orgasmicFunctionScore[entry.key] = entry.value!;
      }
      if (sexualDesireIndexes.contains(entry.key)) {
        _sexualDesireScore[entry.key] = entry.value!;
      }
      if (overallSatisfactionIndexes.contains(entry.key)) {
        _overallSatisfactionScore[entry.key] = entry.value!;
      }
      if (intercourseSatisfactionIndexes.contains(entry.key)) {
        _intercourseSatisfactionScore[entry.key] = entry.value!;
      }
    }).toList();
    notifyListeners();
    print(
      '''erectile function score : $erectileFunctionScore / $erectileFunctionMaxScore,
orgasmic function score : $orgasmicFunctionScore / $orgasmicFunctionMaxScore,
sexual desire score : $sexualDesireScore / $sexualDesireMaxScore,
intercourse satisfaction score : $intercourseSatisfactionScore / $intercourseSatisfactionMaxScore,
overall satisfaction score : $overallSatisfactionScore / $overallSatisfactionMaxScore,''',
    );
  }
}
