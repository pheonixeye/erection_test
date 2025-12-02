import 'package:erection_test/models/constants.dart';
import 'package:flutter/material.dart';

Color categoryColor(int index, {bool isDark = false}) {
  if (QuestionnaireConstants.erectileFunctionIndexes.contains(index)) {
    return isDark ? Colors.red.shade700 : Colors.red.shade50;
  }
  if (QuestionnaireConstants.orgasmicFunctionIndexes.contains(index)) {
    return isDark ? Colors.deepOrange.shade700 : Colors.deepOrange.shade50;
  }
  if (QuestionnaireConstants.sexualDesireIndexes.contains(index)) {
    return isDark ? Colors.teal.shade700 : Colors.teal.shade50;
  }
  if (QuestionnaireConstants.intercourseSatisfactionIndexes.contains(index)) {
    return isDark ? Colors.deepPurple.shade700 : Colors.deepPurple.shade50;
  }
  if (QuestionnaireConstants.overallSatisfactionIndexes.contains(index)) {
    return isDark ? Colors.indigo.shade700 : Colors.lightGreen.shade50;
  }
  return Colors.white;
}
