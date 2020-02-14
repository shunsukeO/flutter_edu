import 'package:flutter/material.dart';
import 'package:my_education/blocs/dashboard_bloc.dart';

class DashboardProvider extends InheritedWidget {
  const DashboardProvider({ Key key, Widget child }) : super(key: key, child: child);

  DashboardBloc get bloc => DashboardBloc();

  @override
  bool updateShouldNotify(_) => true;

  static DashboardProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DashboardProvider>();
  }
}