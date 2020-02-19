import 'package:rxdart/rxdart.dart';
import 'base_bloc.dart';
import 'package:my_education/repository/login_repository.dart';
import 'package:my_education/resources/models/account.dart';

class LoginBloc extends BaseBloc {
  final _repository = LoginRepository();
  final _loginPublishSubject = PublishSubject<String>();
  Stream<String> get loginStream => _loginPublishSubject.stream;

  void login(String email, String password) async {
    final String result = await _repository.login(email, password);
    _loginPublishSubject.sink.add(result);
  }

  void dispose() {
    _loginPublishSubject.close();
  }
}