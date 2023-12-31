part of 'memory_bloc.dart';

@immutable
abstract class MemoryBlocEvent {}

class SelectGameElementEvent implements MemoryBlocEvent {
  final int i;
  final int j;
  final Color color;

  SelectGameElementEvent({
    required this.color,
    required this.i,
    required this.j,
  });

  (int, int) get getIndex => (i, j);
}

class InitialValueForGame implements MemoryBlocEvent {
  final String value;

  InitialValueForGame({required this.value});
}

class InitDataBlocEvent implements MemoryBlocEvent {}
