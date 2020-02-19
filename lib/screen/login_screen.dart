import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_education/blocs/login_bloc.dart';
import 'package:my_education/resources/models/account.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<LoginBloc> (
      create: (_) => LoginBloc(),
      child: _Login(),
      dispose: (_, value) => value.dispose(),
    );
  }
}

class _Login extends StatelessWidget {
  String email = '';
  String password = '';
  final String nullError = '入力に誤りがあります';
  final String dbError = 'メールアドレスもしくはパスワードが違います';
  final _formKey = GlobalKey<FormState>();
  final emailfocus = FocusNode();
  final passwordfocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final LoginBloc bloc = Provider.of<LoginBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // emailフィールド
                const SizedBox(height: 24.0),
                emailField(context),
                // passwordフィールド
                const SizedBox(height: 24.0),
                passwordField(context),
                // ログインボタン
                const SizedBox(height: 24.0),
                StreamBuilder(
                  stream: bloc.loginStream,
                  builder: (context, snapshot) {
                    return Center(
                      child: RaisedButton.icon(
                        color: Colors.blue,
                        icon: Icon(Icons.lock_open, color: Colors.white),
                        label: Text('ログイン', style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          // バリデーションに引っかからなかった場合
                          if (_formKey.currentState.validate()) {
                            bloc.login(email, password);
                            bloc.loginStream.listen((data) {
                              print('data=$data');
                              if (data == 'Bad email or password.') {
                                data = dbError;
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(data, style: TextStyle(color: Colors.white),),
                                    backgroundColor: Colors.red,
                                  )
                                );
                              }
                              else {
                                Navigator.of(context).pushReplacementNamed('/home', arguments: data);
                              }
                            });
                          }
                          // バリデーションに引っかかった場合
                          else {
                            _formKey.currentState.save();
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text(nullError),
                                backgroundColor: Colors.red,
                              )
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ]
            )
          )
        )
      )
    );
  }

  TextFormField emailField(BuildContext context) {
    return TextFormField(
      // keyboardType: TextInputType.emailAddress,
      // 文字数制限
      maxLength: 64,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'メールアドレス',
        icon: Icon(Icons.email),
      ),
      focusNode: emailfocus,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(passwordfocus);
      },
      validator: (value) {
        if(value.isEmpty) {
          return '必須項目です';
        }
        email = value;
        return null;
      },
    );
  }

  TextFormField passwordField(BuildContext context) {
    return TextFormField(
      // keyboardType: TextInputType.number,
      maxLength: 10,
      // マスキング
      obscureText: true,
      textInputAction: TextInputAction.done,
      focusNode: passwordfocus,
      onFieldSubmitted: (v) {
        passwordfocus.unfocus();
      },
      validator: (value) {
        if(value.isEmpty) {
          return '必須項目です';
        }
        password = value;
        return null;
      },
      decoration: InputDecoration(
        labelText: 'パスワード',
        icon: Icon(Icons.lock),
        fillColor: Colors.white,
      ),
    );
  }
}