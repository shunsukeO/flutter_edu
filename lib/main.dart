import 'package:flutter/material.dart';
import 'package:my_education/screen/splash.dart';
import 'package:my_education/screen/login.dart';
import 'package:my_education/screen/dashboard.dart';
import 'package:my_education/screen/base.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Navigation with routes',
    routes: <String, WidgetBuilder>{
      '/': (_) => new Splash(),
      '/login': (_) => new Login(),
      '/base': (_) => new BasePage(),
      '/dashboard': (_) => new Dashboard(),
      // '/bloc': (_) => new ArticleScreen(),
    },
  ));
}