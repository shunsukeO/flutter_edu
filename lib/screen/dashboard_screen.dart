import 'package:flutter/material.dart';
// import 'package:my_education/bloc/dashboard_bloc.dart';
// import 'package:my_education/provider/dashboard_provider.dart';

class Dashboard extends StatelessWidget {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    final String accountId = ModalRoute.of(context).settings.arguments;
    print('アカウントID: $accountId');
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        title: Text(
          'ダッシュボード',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Center(
        child: Container(
          width: 300.0,
          height: 450.0,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    child: Text(
                      'ほげほげさんの最近の活動',
                      style: TextStyle(fontSize: 18)
                    ),
                    padding: EdgeInsets.all(10.0),
                  ),
                  Text('【更新情報】', style: TextStyle(fontSize: 18)),
                  Text('・問題「応用情報技術者試験問題集1」が新しく作成されました！'),
                  Padding(
                    child: Text(
                      '【最終問題解答日】',
                      style: TextStyle(fontSize: 18)
                    ),
                    padding: EdgeInsets.all(10.0),
                  ),
                  Text('14日前')
                ]
              )
            )
          )
        )
      )
    );
  }
}