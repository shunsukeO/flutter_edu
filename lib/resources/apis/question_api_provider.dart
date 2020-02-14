import 'dart:async';
import 'dart:convert';
import 'package:my_education/resources/models/question_test.dart';
import 'package:http/http.dart' as http;

class QuestionApiProvider {
  final String _baseUrl = '';

  // クエリ
  Future<Question> fetchQuestion(String questionId) async {
    final String url = '$_baseUrl/~~';
    Question question;
    question = Question(
      questionId: '1',
      userId: '1',
      title: 'TOEIC800点目指そう！'
    );
    await Future.delayed(Duration(seconds: 1));
    return null;
    return question;
  }
}