import 'dart:async';
import 'dart:convert';

import 'package:my_education/resources/apis/base_api_provider.dart';
import 'package:my_education/resources/models/question.dart';

class RateConfirmApiProvider extends BaseApiProvider {
  Future<Map> fetchRateSummary(questionId) async {
    String body = json.encode({
      'questionId': questionId,
    });
    var response = await super.postJson('/api/get_rate_summary', body: body);
    final parseJson = await json.decode(response.body);
    Question question = Question.fromJson(parseJson['data']['question']);
    Map res = {
      'question': question,
      'rateSummary': parseJson['data']['rateSummary'],
    };
    return res;
  }

  Future<List<dynamic>> fetchRateList(questionId) async {
    String body = json.encode({
      'questionId': questionId,
    });
    var response = await super.postJson('/api/get_rate_list', body: body);
    final parseJson = await json.decode(response.body);
    return parseJson['data'];
  }
}
