// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:erection_test/extensions/context_ext.dart';
import 'package:flutter/material.dart';

class QuestionnaireConstants {
  const QuestionnaireConstants();

  static const erectileFunctionIndexes = [1, 2, 3, 4, 5, 15];

  static const orgasmicFunctionIndexes = [9, 10];

  static const sexualDesireIndexes = [11, 12];

  static const intercourseSatisfactionIndexes = [6, 7, 8];

  static const overallSatisfactionIndexes = [13, 14];

  static const erectileFunctionMaxScore = 30.0;
  static const erectileFunctionAverageScore = 25.8;
  static const erectileFunctionPatientScore = 10.7;

  static const orgasmicFunctionMaxScore = 10.0;
  static const orgasmicFunctionAverageScore = 9.8;
  static const orgasmicFunctionPatientScore = 5.3;

  static const sexualDesireMaxScore = 10.0;
  static const sexualDesireAverageScore = 7.0;
  static const sexualDesirePatientScore = 6.3;

  static const intercourseSatisfactionMaxScore = 15.0;
  static const intercourseSatisfactionAverageScore = 10.6;
  static const intercourseSatisfactionPatientScore = 5.5;

  static const overallSatisfactionMaxScore = 10.0;
  static const overallSatisfactionAverageScore = 8.6;
  static const overallSatisfactionPatientScore = 4.4;
}

class DomainScore extends Equatable {
  final double max;
  final double average;
  final double patient;
  final double calculated;
  final String name;

  const DomainScore({
    required this.max,
    required this.average,
    required this.patient,
    required this.calculated,
    required this.name,
  });

  Map<ResultTableHeaderRowItems, dynamic> get arrangedValues => {
    ResultTableHeaderRowItems.domain: name,
    ResultTableHeaderRowItems.yourScore: calculated,
    ResultTableHeaderRowItems.averageScore: average,
    ResultTableHeaderRowItems.patientScore: patient,
    ResultTableHeaderRowItems.maxScore: max,
  };

  @override
  List<Object> get props => [
    max,
    average,
    patient,
    calculated,
    name,
  ];

  factory DomainScore.erectileFunction(
    BuildContext context,
    double calculated,
  ) {
    return DomainScore(
      max: QuestionnaireConstants.erectileFunctionMaxScore,
      average: QuestionnaireConstants.erectileFunctionAverageScore,
      patient: QuestionnaireConstants.erectileFunctionPatientScore,
      calculated: calculated,
      name: context.loc.domainOne,
    );
  }
  factory DomainScore.orgasmicFunction(
    BuildContext context,
    double calculated,
  ) {
    return DomainScore(
      max: QuestionnaireConstants.orgasmicFunctionMaxScore,
      average: QuestionnaireConstants.orgasmicFunctionAverageScore,
      patient: QuestionnaireConstants.orgasmicFunctionPatientScore,
      calculated: calculated,
      name: context.loc.domainTwo,
    );
  }
  factory DomainScore.sexualDesire(
    BuildContext context,
    double calculated,
  ) {
    return DomainScore(
      max: QuestionnaireConstants.sexualDesireMaxScore,
      average: QuestionnaireConstants.sexualDesireAverageScore,
      patient: QuestionnaireConstants.sexualDesirePatientScore,
      calculated: calculated,
      name: context.loc.domainThree,
    );
  }
  factory DomainScore.intercourseSatisfaction(
    BuildContext context,
    double calculated,
  ) {
    return DomainScore(
      max: QuestionnaireConstants.intercourseSatisfactionMaxScore,
      average: QuestionnaireConstants.intercourseSatisfactionAverageScore,
      patient: QuestionnaireConstants.intercourseSatisfactionPatientScore,
      calculated: calculated,
      name: context.loc.domainFour,
    );
  }
  factory DomainScore.overallSatisfaction(
    BuildContext context,
    double calculated,
  ) {
    return DomainScore(
      max: QuestionnaireConstants.overallSatisfactionMaxScore,
      average: QuestionnaireConstants.overallSatisfactionAverageScore,
      patient: QuestionnaireConstants.overallSatisfactionPatientScore,
      calculated: calculated,
      name: context.loc.domainFive,
    );
  }

  static List<DomainScore> scores(
    BuildContext context, {
    required double erectileFunctionScore,
    required double orgasmicFunctionScore,
    required double sexualDesireScore,
    required double intercourseSatisfactionScore,
    required double overallSatisfactionScore,
  }) => [
    DomainScore.erectileFunction(context, erectileFunctionScore),
    DomainScore.orgasmicFunction(context, orgasmicFunctionScore),
    DomainScore.sexualDesire(context, sexualDesireScore),
    DomainScore.intercourseSatisfaction(context, intercourseSatisfactionScore),
    DomainScore.overallSatisfaction(context, overallSatisfactionScore),
  ];
}

enum ResultTableHeaderRowItems {
  domain(en: 'Domain', ar: 'المجال'),
  yourScore(en: 'You', ar: 'نتيجتك'),
  averageScore(en: 'Average', ar: 'الحد المتوسط'),
  patientScore(en: 'Patient', ar: 'الحد المرضي'),
  maxScore(en: 'Max', ar: 'الحد الاقصي');

  final String en;
  final String ar;

  const ResultTableHeaderRowItems({
    required this.en,
    required this.ar,
  });
}
