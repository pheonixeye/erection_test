import 'package:erection_test/models/constants.dart';
import 'package:flutter/material.dart';

Color categoryColor(int index, {bool isDark = false}) {
  if (QuestionnaireConstants.erectileFunctionIndexes.contains(index)) {
    return isDark ? Colors.red : Colors.red.shade50;
  }
  if (QuestionnaireConstants.orgasmicFunctionIndexes.contains(index)) {
    return isDark ? Colors.deepOrange : Colors.deepOrange.shade50;
  }
  if (QuestionnaireConstants.sexualDesireIndexes.contains(index)) {
    return isDark ? Colors.teal : Colors.teal.shade50;
  }
  if (QuestionnaireConstants.intercourseSatisfactionIndexes.contains(index)) {
    return isDark ? Colors.deepPurple : Colors.deepPurple.shade50;
  }
  if (QuestionnaireConstants.overallSatisfactionIndexes.contains(index)) {
    return isDark ? Colors.green : Colors.lightGreen.shade50;
  }
  return Colors.white;
}
