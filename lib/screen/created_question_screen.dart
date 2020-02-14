import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_education/blocs/question_bloc.dart';

class CreatedQuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<QuestionBloc> (
      create: (_) => QuestionBloc(),
      child: _QuestionScreenTemplate(),
      dispose: (_, value) => value.dispose(),
    );
    // return Scaffold(
    //   backgroundColor: Colors.green[100],
    //   // Appbar
    //   appBar: AppBar(
    //     backgroundColor: Colors.green[100],
    //     title: Text(
    //       '作成問題一覧',
    //       style: TextStyle(fontSize: 16),
    //     ),
    //   ),
    //   body: Center(
    //     child: Icon(Icons.mode_edit),
    //   )
    // );
  }
}

class _QuestionScreenTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  }
}
