import 'package:erection_test/models/constants.dart';
import 'package:flutter/material.dart';

Color categoryColor(int index) {
  if (QuestionnaireConstants.erectileFunctionIndexes.contains(index)) {
    return Colors.red.shade50;
  }
  if (QuestionnaireConstants.orgasmicFunctionIndexes.contains(index)) {
    return Colors.orange.shade50;
  }
  if (QuestionnaireConstants.sexualDesireIndexes.contains(index)) {
    return Colors.blue.shade50;
  }
  if (QuestionnaireConstants.intercourseSatisfactionIndexes.contains(index)) {
    return Colors.deepPurple.shade50;
  }
  if (QuestionnaireConstants.overallSatisfactionIndexes.contains(index)) {
    return Colors.lightGreen.shade50;
  }
  return Colors.white;
}
