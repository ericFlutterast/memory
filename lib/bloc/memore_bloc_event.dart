part of 'memore_bloc_bloc.dart';

@immutable
abstract class MemoreBlocEvent {}

class ShowColorMemoreBlocEvent implements MemoreBlocEvent {
  final int i;
  final int j;
  final Color color;

  ShowColorMemoreBlocEvent({
    required this.color,
    required this.i,
    required this.j,
  });

  (int, int) get getIndex {
    return (i, j);
  }
}

class InitDataBlocEvent implements MemoreBlocEvent {}
