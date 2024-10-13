import 'package:bloc/bloc.dart';
import 'package:bloc_example/counter/counter_observer.dart';
import 'package:bloc_example/timer/timer_app.dart';
import 'package:flutter/material.dart';

import 'counter/counter_app.dart';
import 'infinite_list/infinite_list_app.dart';
import 'infinite_list/simple_bloc_observer.dart';

void main() {
  // Bloc.observer = const CounterObserver();
  Bloc.observer = const SimpleBlocObserver();

  runApp(const InfiniteListApp());
}
