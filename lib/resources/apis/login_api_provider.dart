import 'dart:async';
import 'dart:convert';
import 'package:my_education/resources/apis/base_api_provider.dart';

class LoginApiProvider extends BaseApiProvider {

  Future<String> login(String email, String password) async {
    String body = json.encode({
      'email': email,
      'password': password,
    });
    var response = await super.postJson('/api/login', body: body);
    final parseJson = await json.decode(response.body);
    if (parseJson['exitCd'] == 0) {
      String result = parseJson['result']['account_id'].toString();
      return result;
    }
    else {
      String errMsg = parseJson['errMsg'];
      return errMsg;
    }
  }
}