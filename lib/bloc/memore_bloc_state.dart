part of 'memore_bloc_bloc.dart';

class MemoryBlocState {
  List<RowModel> contentMatrix;
  ShowColorMemoryBlocEvent? prevEvent;

  MemoryBlocState({this.contentMatrix = const [], this.prevEvent});

  MemoryBlocState copyWith(
      {List<RowModel>? newMatrix, ShowColorMemoryBlocEvent? newEvent}) {
    return MemoryBlocState(
      contentMatrix: newMatrix ?? contentMatrix,
      prevEvent: newEvent ?? prevEvent,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is MemoryBlocState &&
      runtimeType == other.runtimeType &&
      contentMatrix == other.contentMatrix;

  @override
  int get hashCode => contentMatrix.hashCode;

  @override
  String toString() {
    return 'MemoryBlocState: $contentMatrix';
  }
}
