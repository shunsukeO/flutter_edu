import 'package:my_education/blocs/base_bloc.dart';
import 'package:my_education/repository/rate_repository.dart';
import 'package:rxdart/rxdart.dart';

class RateConfirmBloc extends BaseBloc {
  final _repository = RateRepository();
  final _fetchRateSummaryPublishSubject = PublishSubject<Map>();
  final _fetchRateListPublishSubject = PublishSubject<List<dynamic>>();

  RateConfirmBloc({questionId: String}) {
    fetchRateSummary(questionId);
    fetchRateList(questionId);
  }

  Stream<Map> get fetchRateSummaryStream => _fetchRateSummaryPublishSubject.stream;

  Stream<List<dynamic>> get fetchRateListStream => _fetchRateListPublishSubject.stream;

  void fetchRateSummary(String questionId) async {
    final Map questionAndRateSummary = await _repository.fetchRateSummary(questionId);
    _fetchRateSummaryPublishSubject.sink.add(questionAndRateSummary);
  }

  void fetchRateList(String questionId) async {
    final List<dynamic> rateList = await _repository.fetchRateList(questionId);
    _fetchRateListPublishSubject.sink.add(rateList);
  }

  @override
  void dispose() {
    _fetchRateSummaryPublishSubject.close();
    _fetchRateListPublishSubject.close();
  }
}
