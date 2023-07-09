part of 'memore_bloc_bloc.dart';

@immutable
abstract class MemoreBlocEvent {}

class ShowColorMemoryBlocEvent implements MemoreBlocEvent {
  final int i;
  final int j;
  final Color color;

  ShowColorMemoryBlocEvent({
    required this.color,
    required this.i,
    required this.j,
  });

  (int, int) get getIndex => (i, j);
}

class InitDataBlocEvent implements MemoreBlocEvent {}
