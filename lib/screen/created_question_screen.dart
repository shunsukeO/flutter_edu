import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_education/blocs/question_bloc.dart';
import 'package:my_education/resources/models/question_test.dart';

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
      body: _CreatedQuestionListComponent(),
    );
  }
}

// 作成問題一覧リスト
class _CreatedQuestionListComponent extends StatelessWidget {
  Question _question;
  var listItem = ["TOEIC850点問題集", "ドイツ語検定3級問題", "フランス語検定"];

  @override
  Widget build(BuildContext context) {
    final QuestionBloc _bloc = Provider.of<QuestionBloc>(context);

    return Scaffold(
      backgroundColor: Colors.green[100],
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              child: Text(listItem[index], style: TextStyle(fontSize: 20),),
              padding: EdgeInsets.all(40.0),
            )
          );
        },
        itemCount: listItem.length,
      )
    );
  }
}