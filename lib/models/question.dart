import 'package:equatable/equatable.dart';

import 'package:erection_test/models/answer.dart';

class Question extends Equatable {
  final int index;
  final String arabic_question;
  final String english_question;
  final List<Answer> answers;

  const Question({
    required this.index,
    required this.arabic_question,
    required this.english_question,
    required this.answers,
  });

  Question copyWith({
    int? index,
    String? arabic_question,
    String? english_question,
    List<Answer>? answers,
  }) {
    return Question(
      index: index ?? this.index,
      arabic_question: arabic_question ?? this.arabic_question,
      english_question: english_question ?? this.english_question,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'index': index,
      'arabic_question': arabic_question,
      'english_question': english_question,
      'answers': answers.map((x) => x.toJson()).toList(),
    };
  }

  factory Question.fromJson(Map<String, dynamic> map) {
    return Question(
      index: map['index'] as int,
      arabic_question: map['arabic_question'] as String,
      english_question: map['english_question'] as String,
      answers: List<Answer>.from(
        (map['answers'] as Map<String, dynamic>).entries.map<Answer>(
          (x) => Answer.fromJson(x),
        ),
      ),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
    index,
    arabic_question,
    english_question,
    answers,
  ];
}
