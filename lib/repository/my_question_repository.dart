import 'package:my_education/resources/apis/my_question_api_provider.dart';
import 'package:my_education/resources/models/question.dart';

class Repository {
  final _questionApiProvider = MyQuestionApiProvider();

  Future<Question> fetchQuestion(String accountId) => _questionApiProvider.fetchQuestion(accountId);
}