import 'package:flutter/material.dart';
// import 'package:my_education/bloc/dashboard_bloc.dart';
// import 'package:my_education/provider/dashboard_provider.dart';

class Dashboard extends StatelessWidget {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    // Provider経由でBlocにアクセス
    // final bloc = DashboardProvider.of(context).bloc;

    return Scaffold(
      backgroundColor: Colors.green[100],
        // Appbar
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        title: Text(
          'ダッシュボード',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Center(
        child: Icon(Icons.home)
      )
      // bottomNavigationBar: BottomNavigationBar(
      //   // 初期選択されるタブを設定
      //   currentIndex: _index(bloc),
      //   items: const<BottomNavigationBarItem> [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.mode_edit),
      //       title: Text('作成問題一覧'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text('ダッシュボード'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.library_books),
      //       title: Text('問題一覧'),
      //     ),
      //   ],
      //   // onTap: (int index) {
      //   // }
      // ),
    );
  }

  // _index(DashboardBloc bloc) {
  //   return StreamBuilder<int> (
  //     stream: bloc.onTransition,
  //     builder: (context, snapshot) {
  //       return Text(
  //         snapshot.hasData ? snapshot.data : '1'
  //       );
  //     }
  //   );
  // }
}