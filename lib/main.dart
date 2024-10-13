import 'package:bloc/bloc.dart';
import 'package:bloc_example/counter/counter_observer.dart';
import 'package:bloc_example/timer/timer_app.dart';
import 'package:flutter/material.dart';

import 'counter/counter_app.dart';

void main() {
  Bloc.observer = const CounterObserver();

  runApp(const TimerApp());
}
