// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:equatable/equatable.dart';

class QuestionModel extends Equatable {
  final String category;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<String> answers;

  QuestionModel(
    this.category,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.answers,
  );

  @override
  List<Object> get props {
    return [
      category,
      difficulty,
      question,
      correctAnswer,
      answers,
    ];
  }

  QuestionModel copyWith({
    String? category,
    String? difficulty,
    String? question,
    String? correctAnswer,
    List<String>? answers,
  }) {
    return QuestionModel(
      category ?? this.category,
      difficulty ?? this.difficulty,
      question ?? this.question,
      correctAnswer ?? this.correctAnswer,
      answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'difficulty': difficulty,
      'question': question,
      'correct_answer': correctAnswer,
      'incorrect_answers': answers,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      map['category'] ?? '',
      map['difficulty'] ?? '',
      map['question'] ?? '',
      map['correct_answer'] ?? '',
      List<String>.from(map['incorrect_answers'] ?? [])
        ..add(map['correct_answer'] ?? '')
        ..shuffle(),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuestionModel(category: $category, difficulty: $difficulty, question: $question, correctAnswer: $correctAnswer, answers: $answers)';
  }
}
