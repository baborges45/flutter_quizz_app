import 'package:flutter_quizz_app/controllers/quiz/quiz_enum.dart';
import 'package:flutter_quizz_app/controllers/quiz/quiz_state.dart';
import 'package:flutter_quizz_app/models/question_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final quizControllerProvider =
    StateNotifierProvider.autoDispose<QuizController, QuizState>(
        (ref) => QuizController());

class QuizController extends StateNotifier<QuizState> {
  QuizController() : super(QuizState.initial());

  ///Function usada para determinar qual resposta vai ser escrita
  void submitAnswer(QuestionModel currentQuestion, String answer) {
    if (state.answered) return;
    if (currentQuestion.correctAnswer == answer) {
      state = state.copyWith(
        selectedAnswer: answer,
        correct: state.correct..add(currentQuestion),
        status: QuizStatus.correct,
      );
    } else {
      state = state.copyWith(
        selectedAnswer: answer,
        incorrect: state.incorrect..add(currentQuestion),
        status: QuizStatus.incorrect,
      );
    }
  }

  void nextQuestion(List<QuestionModel> question, int currentIndex) {
    state = state.copyWith(
      selectedAnswer: '',
      status: currentIndex + 1 < question.length
          ? QuizStatus.initial
          : QuizStatus.complete,
    );
  }
}
