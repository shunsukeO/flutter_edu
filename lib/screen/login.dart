import 'package:flutter/material.dart';

// Login
class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  // ユニークキーを設定（普段はあまり使わない方が良い?）
  // 何に設定している？
  final _formKey = GlobalKey<FormState>();
  final emailfocus = FocusNode();
  final passwordfocus = FocusNode();
  var _yourEmail = '';
  var _yourPassword = '';

  void _updateEmail(String email) {
    setState(() {
      _yourEmail = email;
    });
  }

  void _updatePassword(String password) {
    setState(() {
      _yourPassword = password;
    });
  }

  @override
  // buildメソッド -> setState()がcallされるたびに呼ばれる
  Widget build(BuildContext context) {
    // WidgetをScaffoldで囲うのはお決まり（アプリページの土台）
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Login'),
      ),
      body: new Center(
        child: new Form(
          // 
          key: _formKey,
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
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
                new Center(
                  child: new RaisedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      // バリデーションに引っかからなかった場合
                      if (_formKey.currentState.validate()) {
                        // StatefulWidget（スプラッシュやログイン画面など一方向の画面遷移）の場合使用 -> ログイン後は/homeがスタックのルート画面になる
                        Navigator.of(context).pushReplacementNamed('/base');
                      }
                      // バリデーションに引っかかった場合
                      else {
                        _formKey.currentState.save();
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                      }
                    },
                  )
                ),
                // Text(_yourEmail),
                // Text(_yourPassword)
              ]
            )
          )
        )
      )
    );
  }

  TextFormField emailField(BuildContext context) {
    return TextFormField(
      // 文字数制限
      maxLength: 64,
      textInputAction: TextInputAction.next,
      // 初期画面でテキストフィールドにフォーカスが合った状態になる
      // autofocus: true,
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
        return null;
      },
      onSaved: (String value) {
        _updateEmail(value);
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
        return null;
      },
      decoration: InputDecoration(
        labelText: 'パスワード',
        icon: Icon(Icons.lock),
        fillColor: Colors.white,
        // border: const UnderlineInputBorder(),
      ),
      onSaved: (String value) {
        _updatePassword(value);
      }
    );
  }
}