import 'package:erection_test/core/providers/px_locale.dart';
import 'package:erection_test/core/providers/px_quiz.dart';
import 'package:erection_test/core/providers/px_theme.dart';
import 'package:erection_test/models/constants.dart';
import 'package:flutter/material.dart';

class ResultTable extends StatefulWidget {
  const ResultTable({
    super.key,
    required this.q,
    required this.t,
    required this.l,
  });
  final PxQuiz q;
  final PxTheme t;
  final PxLocale l;
  @override
  State<ResultTable> createState() => _ResultTableState();
}

class _ResultTableState extends State<ResultTable> {
  late final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final ValueNotifier<String?> _selectorString = ValueNotifier(null);

  Color? _dataRowColor(bool isSelected) {
    if (isSelected) {
      if (widget.t.isDark) {
        return Colors.amber.shade700;
      } else {
        return Colors.amber.shade50;
      }
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _controller,
      thumbVisibility: true,
      thickness: 8,
      scrollbarOrientation: ScrollbarOrientation.bottom,
      child: SingleChildScrollView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: WidgetStatePropertyAll(
            widget.t.isDark ? Colors.blueAccent : Colors.blue.shade50,
          ),
          dividerThickness: 2,
          border: TableBorder.all(),
          columns: [
            ...ResultTableHeaderRowItems.values.map((e) {
              return DataColumn(
                label: Text(
                  widget.l.isEnglish ? e.en : e.ar,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                headingRowAlignment: MainAxisAlignment.center,
              );
            }),
          ],
          rows: [
            ...DomainScore.scores(
              context,
              erectileFunctionScore: widget.q.erectileFunctionScore,
              orgasmicFunctionScore: widget.q.orgasmicFunctionScore,
              sexualDesireScore: widget.q.sexualDesireScore,
              intercourseSatisfactionScore:
                  widget.q.intercourseSatisfactionScore,
              overallSatisfactionScore: widget.q.overallSatisfactionScore,
            ).map((domainScore) {
              bool _isSelected = widget.q.domainScore == domainScore;
              return DataRow(
                selected: _isSelected,
                color: WidgetStatePropertyAll(_dataRowColor(_isSelected)),
                cells: [
                  ...domainScore.tableValues.entries.map((entry) {
                    final _isResultColumn =
                        entry.key == ResultTableHeaderRowItems.yourScore;
                    final _isResultGood =
                        _isResultColumn && domainScore.isResultGood;
                    final _isResultBad =
                        _isResultColumn && domainScore.isResultBad;
                    return DataCell(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${entry.value}',
                            style: _isResultColumn
                                ? TextStyle(
                                    color: _isResultGood
                                        ? Colors.green
                                        : Colors.red,
                                  )
                                : null,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: 4),

                          if (_isResultGood)
                            const Icon(
                              Icons.arrow_upward,
                              color: Colors.green,
                            ),
                          if (_isResultBad)
                            const Icon(
                              Icons.arrow_downward,
                              color: Colors.red,
                            ),
                        ],
                      ),
                      onTap: () {
                        _selectorString.value = domainScore.name;
                        widget.q.selectDomainForGraph(domainScore);
                      },
                    );
                  }),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
