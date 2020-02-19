import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_education/resources/models/account.dart';
import 'package:my_education/resources/apis/base_api_provider.dart';

class LoginApiProvider extends BaseApiProvider {
  final String _baseUrl = 'http://18.220.196.14:3004/api';
  final Map<String, String> _headers = {'content-type': 'application/json'};

  Future<Account> fetchAccount(String accountId) async {
    final String url = '$_baseUrl/get_account';
    Account account;
    String body = json.encode({ 'account_id': accountId });
    var response = await http.post(url, headers: _headers, body: body);
    if (response.statusCode == 200) {
      final parseJson = json.decode(response.body);
      account = Account.fromJson(parseJson['data']);
    }
    else {
      throw Exception('Access failed url: $url');
    }
    return account;
  }
}