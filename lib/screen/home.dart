import 'package:flutter/material.dart';
import 'my_question_screen.dart';
import 'question_screen.dart';
import 'dashboard_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            // indicatorColor: Colors.lime,
            tabs: [
              Tab(icon: Icon(Icons.mode_edit)),
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.library_books))
            ],
          ),
          // title: Text(''),
        ),
        body: TabBarView(
          children: <Widget> [
            MyQuestionScreen(),
            Dashboard(),
            QuestionScreen(),
          ]
        )
      )
    );
  }
}