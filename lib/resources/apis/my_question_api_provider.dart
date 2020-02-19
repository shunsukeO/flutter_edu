import 'dart:async';
import 'dart:convert';
import 'package:my_education/resources/apis/base_api_provider.dart';
import 'package:my_education/resources/models/question.dart';

class MyQuestionApiProvider extends BaseApiProvider {
  Future<Question> fetchQuestion(accountId) async {
    String body = json.encode({
      'accountId': accountId,
    });
    var response = await super.postJson('/api/get_question', body: body);
    final parseJson = await json.decode(response.body);
    Question question = Question.fromJson(parseJson['data']);
    return question;
  }
}