import 'dart:math';

import 'package:erection_test/core/providers/px_locale.dart';
import 'package:erection_test/core/providers/px_quiz.dart';
import 'package:erection_test/core/providers/px_theme.dart';
import 'package:erection_test/core/utils/after_layout.dart';
import 'package:erection_test/models/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultGraph extends StatelessWidget {
  const ResultGraph({super.key, required this.t});
  final PxTheme t;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: t.isDark ? null : Colors.blue.shade100,
      elevation: 0,
      child: AspectRatio(
        aspectRatio: 1.6,
        child: ResultChart(),
      ),
    );
  }
}

class ResultChart extends StatefulWidget {
  const ResultChart({super.key});

  @override
  State<StatefulWidget> createState() => ResultChartState();
}

class ResultChartState extends State<ResultChart> with AfterLayoutMixin {
  final Duration animDuration = const Duration(milliseconds: 500);

  @override
  void afterFirstLayout(BuildContext context) {
    final _q = context.read<PxQuiz>();
    if (_q.domainScore == null) {
      _q.selectDomainForGraph(
        DomainScore.erectileFunction(context, _q.erectileFunctionScore),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Consumer3<PxQuiz, PxTheme, PxLocale>(
        builder: (context, q, t, l, _) {
          // final _data = DomainScore.scores(
          //   context,
          //   erectileFunctionScore: q.erectileFunctionScore,
          //   orgasmicFunctionScore: q.orgasmicFunctionScore,
          //   sexualDesireScore: q.sexualDesireScore,
          //   intercourseSatisfactionScore: q.intercourseSatisfactionScore,
          //   overallSatisfactionScore: q.overallSatisfactionScore,
          // );
          while (q.domainScore == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return BarChart(
            duration: animDuration,
            BarChartData(
              maxY: q.domainScore?.max,
              gridData: FlGridData(show: true),
              barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  getTooltipColor: (group) => Colors.transparent,
                  tooltipPadding: EdgeInsets.zero,
                  tooltipMargin: 8,
                  getTooltipItem:
                      (
                        BarChartGroupData group,
                        int groupIndex,
                        BarChartRodData rod,
                        int rodIndex,
                      ) {
                        if (groupIndex != 3) {
                          return BarTooltipItem(
                            rod.toY.round().toString(),
                            const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        return null;
                      },
                ),
              ),
              baselineY: 0,
              alignment: BarChartAlignment.spaceAround,
              titlesData: FlTitlesData(
                show: true,
                topTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return SideTitleWidget(
                        meta: meta,
                        child: SizedBox(),
                      );
                    },
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    reservedSize: 40,
                    showTitles: true,
                    interval: 5,
                    getTitlesWidget: (value, meta) {
                      return SideTitleWidget(
                        meta: meta,
                        child: (value % 5 == 0) ? Text('$value') : SizedBox(),
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 50,
                    getTitlesWidget: (value, meta) {
                      return SideTitleWidget(
                        meta: meta,
                        child: Transform.rotate(
                          angle: -pi / 9.0,
                          child: Text(switch (value) {
                            0 =>
                              l.isEnglish
                                  ? ResultTableHeaderRowItems.yourScore.en
                                  : ResultTableHeaderRowItems.yourScore.ar,
                            1 =>
                              l.isEnglish
                                  ? ResultTableHeaderRowItems.averageScore.en
                                  : ResultTableHeaderRowItems.averageScore.ar,
                            2 =>
                              l.isEnglish
                                  ? ResultTableHeaderRowItems.patientScore.en
                                  : ResultTableHeaderRowItems.patientScore.ar,
                            3 =>
                              l.isEnglish
                                  ? ResultTableHeaderRowItems.maxScore.en
                                  : ResultTableHeaderRowItems.maxScore.ar,

                            _ => '',
                          }),
                        ),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(),
              ),
              barGroups: [
                ...ResultTableHeaderRowItems.graphTitles.map((title) {
                  final _index = ResultTableHeaderRowItems.graphTitles.indexOf(
                    title,
                  );
                  final _ds = q.domainScore!;
                  return BarChartGroupData(
                    x: _index,
                    showingTooltipIndicators: [0, 1, 2, 3],
                    barRods: [
                      BarChartRodData(
                        toY: switch (title) {
                          ResultTableHeaderRowItems.domain => 0,
                          ResultTableHeaderRowItems.yourScore => _ds.calculated,
                          ResultTableHeaderRowItems.averageScore => _ds.average,
                          ResultTableHeaderRowItems.patientScore => _ds.patient,
                          ResultTableHeaderRowItems.maxScore => _ds.max,
                        },
                        borderRadius: BorderRadius.circular(8),
                        width: 20,
                        color: switch (title) {
                          ResultTableHeaderRowItems.domain =>
                            Colors.transparent,
                          ResultTableHeaderRowItems.yourScore =>
                            _ds.isResultGood
                                ? Colors.lightGreen
                                : _ds.isResultAverage
                                ? Colors.amber
                                : _ds.isResultMax
                                ? Colors.green
                                : Colors.red,
                          ResultTableHeaderRowItems.averageScore => Colors.blue,
                          ResultTableHeaderRowItems.patientScore => Colors.red,
                          ResultTableHeaderRowItems.maxScore => Colors.green,
                        },
                      ),
                    ],
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
