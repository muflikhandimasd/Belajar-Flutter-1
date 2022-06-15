import 'package:meta/meta.dart';

@immutable
abstract class CounterEvent {}

class Counter extends CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}
