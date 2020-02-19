import 'package:my_education/resources/apis/rate_confirm_api_provider.dart';
import 'package:my_education/resources/models/rate.dart';

class RateRepository {
  final _rateConfirmApiProvider = RateConfirmApiProvider();

  Future<Map> fetchRateSummary(String questionId) =>
      _rateConfirmApiProvider.fetchRateSummary(questionId);

  Future<List<dynamic>> fetchRateList(String questionId) =>
      _rateConfirmApiProvider.fetchRateList(questionId);
}
