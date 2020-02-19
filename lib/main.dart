import 'package:flutter/material.dart';
import 'package:my_education/screen/splash_screen.dart';
import 'package:my_education/screen/login_screen.dart';
import 'package:my_education/screen/dashboard_screen.dart';
import 'package:my_education/screen/home.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Navigation with routes',
    routes: <String, WidgetBuilder>{
      '/': (_) => new Splash(),
      '/login': (_) => new LoginScreen(),
      '/home': (_) => new Home(),
      '/dashboard': (_) => new Dashboard(),
      // '/bloc': (_) => new ArticleScreen(),
    },
  ));
}