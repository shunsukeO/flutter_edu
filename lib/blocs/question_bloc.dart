import 'package:rxdart/rxdart.dart';
import 'base_bloc.dart';
import 'package:my_education/repository/my_question_repository.dart';
import 'package:my_education/resources/models/question.dart';

class QuestionBloc extends BaseBloc {
  final _repository = Repository();
  final _fetchQuestionPublishSubject = PublishSubject<Question>();

  QuestionBloc({ accountId: String }) {
    fetchQuestion(accountId);
  }

  Stream<Question> get fetchQuestionStream => _fetchQuestionPublishSubject.stream;

  void fetchQuestion(String accountId) async {
    print('accountId: $accountId');
    if (accountId == null) {
      await Future.delayed(Duration(seconds: 0));
      _fetchQuestionPublishSubject.sink.add(Question());
    }
    else {
      print('accountId=$accountId');
      final Question question = await _repository.fetchQuestion(accountId);
      print('BLoCのquestion=$question');
      _fetchQuestionPublishSubject.sink.add(question);
    }
  }

  @override
  void dispose() {
    _fetchQuestionPublishSubject.close();
  }
}