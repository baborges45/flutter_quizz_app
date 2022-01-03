import 'package:flutter_quizz_app/enum/difficulty.dart';
import 'package:flutter_quizz_app/models/question_model.dart';

abstract class BaseQuizRepository {
  Future<List<QuestionModel>> getQuestions({
    required int numQuestions,
    required int categoryId,
    required Difficulty difficulty,
  });
}
