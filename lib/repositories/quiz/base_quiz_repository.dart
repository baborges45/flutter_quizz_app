import 'package:flutter_quizz_app/enum/difficulty.dart';
import 'package:flutter_quizz_app/models/question_model.dart';

abstract class BaseQuizRepository {
  Future<List<QuestionModel>> getQuestions({
    int numQuestions,
    int categoryId,
    Difficulty difficulty,
  });
}
