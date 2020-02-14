import 'package:flutter/material.dart';
import 'createdQuestion.dart';
import 'question.dart';
import 'dashboard.dart';

class BasePage extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<BasePage> {
  int _index = 1;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(
      // 初期ページをBottomNavigationBarと同じにする
      initialPage: _index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget> [
            DrawerHeader(
              child: Text('Header'),
            ),
            ListTile(
              title: Text('プロフィール(実装予定)'),
              onTap: () {
                print('未実装');
              }
            ),
            ListTile(
              title: Text('ダッシュボード'),
              onTap: () {
                Navigator.of(context).pushNamed('/dashboard');
              }
            ),
            ListTile(
              title: Text('問題一覧'),
              onTap: () {
                Navigator.of(context).pushNamed('/my_education');
              }
            ),
            ListTile(
              title: Text('作成問題一覧'),
              onTap: () {
                Navigator.of(context).pushNamed('/dashboard');
              }
            )
          ]
        )
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            this._index = index;
          });
        },
        children: [
          CreatedQuestionScreen(),
          Dashboard(),
          QuestionScreen(),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 表示されるBottomNavigationBarItemを設定
        currentIndex: _index,
        items: const<BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.mode_edit),
            title: Text('作成問題一覧'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('ダッシュボード'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('問題一覧'),
          ),
        ],
        onTap: (int index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 10),
            curve: Curves.ease
          );
        }
      ),
    );
  }
}