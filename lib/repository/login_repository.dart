import 'package:my_education/resources/apis/login_api_provider.dart';
import 'package:my_education/resources/models/account.dart';

class LoginRepository {
  final _loginApiProvider = LoginApiProvider();

  Future<String> login(String email, String password) => _loginApiProvider.login(email, password);
}