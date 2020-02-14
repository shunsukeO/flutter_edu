import 'dart:async';
import 'dart:math' show Random;

class DashboardBloc {
  final _controller1 = StreamController<void>();
  final _controller2 = StreamController<int>();
  final _controller3 = StreamController<String>();
  final _controller4 = StreamController<bool>();

  Stream<int> get onTransition => _controller2.stream;
  Stream<String> get onTransitionStr => _controller3.stream;

  DashboardBloc() {
    
  }
}