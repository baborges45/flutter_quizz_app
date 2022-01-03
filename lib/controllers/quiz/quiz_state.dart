import 'package:equatable/equatable.dart';

import 'package:flutter_quizz_app/controllers/quiz/quiz_enum.dart';
import 'package:flutter_quizz_app/models/question_model.dart';

class QuizState extends Equatable {
  final String selectedAnswer;
  final List<QuestionModel> correct;
  final List<QuestionModel> incorrect;
  final QuizStatus status;

  const QuizState(
    this.selectedAnswer,
    this.correct,
    this.incorrect,
    this.status,
  );

  bool get answered =>
      status == QuizStatus.incorrect || status == QuizStatus.correct;

  factory QuizState.initial() {
    return QuizState(
      '',
      const [],
      const [],
      QuizStatus.initial,
    );
  }

  @override
  List<Object> get props => [
        selectedAnswer,
        correct,
        incorrect,
        status,
      ];

  QuizState copyWith({
    String? selectedAnswer,
    List<QuestionModel>? correct,
    List<QuestionModel>? incorrect,
    QuizStatus? status,
  }) {
    return QuizState(
      selectedAnswer ?? this.selectedAnswer,
      correct ?? this.correct,
      incorrect ?? this.incorrect,
      status ?? this.status,
    );
  }
}
