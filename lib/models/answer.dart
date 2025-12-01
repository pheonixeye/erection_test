import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final int score;
  final String en;
  final String ar;

  const Answer({
    required this.score,
    required this.en,
    required this.ar,
  });

  Answer copyWith({
    int? score,
    String? en,
    String? ar,
  }) {
    return Answer(
      score: score ?? this.score,
      en: en ?? this.en,
      ar: ar ?? this.ar,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'score': score,
      'en': en,
      'ar': ar,
    };
  }

  factory Answer.fromJson(MapEntry<String, dynamic> map) {
    return Answer(
      score: int.parse(map.key),
      en: map.value['en'] as String,
      ar: map.value['ar'] as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [score, en, ar];
}
