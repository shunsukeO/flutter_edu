import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_education/blocs/question_bloc.dart';

class CreatedQuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider = blocのオブジェクトを受け取る
    return Provider<QuestionBloc> (
      // initStateのようなもの
      create: (_) => QuestionBloc(),
      child: _QuestionScreenTemplate(),
      dispose: (_, value) => value.dispose(),
    );
  }
}

class _QuestionScreenTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final QuestionBloc _bloc = Provider.of<QuestionBloc>(context);
    return Scaffold(
      backgroundColor: Colors.green[100],
      // Appbar
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        title: Text(
          '作成問題一覧',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Center(
        child: Icon(Icons.mode_edit),
      )
    );
  }
}
