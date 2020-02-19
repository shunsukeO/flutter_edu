import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_education/blocs/question_bloc.dart';
import 'package:my_education/resources/models/question.dart';

class MyQuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;
    final Map<String, String> args = {'accountId': id};
    print('args=$args');
    final String accountId = args['accountId'];
    return Provider<QuestionBloc> (
      create: (_) => QuestionBloc(accountId: accountId),
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
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        title: Text(
          '作成問題一覧',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: _MyQuestionListComponent(),
    );
  }
}

// 作成問題一覧リスト
class _MyQuestionListComponent extends StatelessWidget {
  Question _question;
  var listItem = ["TOEIC850点問題集", "ドイツ語検定3級問題", "フランス語検定"];

  @override
  Widget build(BuildContext context) {
    final QuestionBloc _bloc = Provider.of<QuestionBloc>(context);
    _bloc.fetchQuestionStream.listen((data) {
      _question = data;
    });
    print('_question=$_question');
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  StreamBuilder(
                    stream: _bloc.fetchQuestionStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        _question = snapshot.data;
                        var _title = _question.title;
                        var _createdAt = _question.createdAt;
                        print('StreamBuilder question=$_question');
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget> [
                            Padding(
                              child: Text(
                                _title,
                                style: TextStyle(fontSize: 20),
                              ),
                              padding: EdgeInsets.all(30.0),
                            ),
                            Column(
                              children: <Widget> [
                                Padding(
                                  child: Text('作成日: $_createdAt'),
                                  padding: EdgeInsets.all(5),
                                ),
                                // Padding(
                                //   child: Text(
                                //     _title,
                                //     style: TextStyle(fontSize: 20),
                                //   ),
                                //   padding: EdgeInsets.all(30.0),
                                // ),
                                Padding(
                                  child: RaisedButton(
                                    child: Text('評価詳細'),
                                    color: Colors.orange,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      print('評価詳細ページへ');
                                    },
                                  ),
                                  padding: EdgeInsets.all(5.0),
                                ),
                              ]
                            ),
                          ]
                        );
                      }
                      else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: listItem.length,
      )
    );
  }
}

// class _questionRating extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//   }
// }