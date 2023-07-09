part of 'memory_bloc.dart';

class MemoryBlocState {
  List<RowModel> contentMatrix;

  MemoryBlocState({this.contentMatrix = const []});

  MemoryBlocState copyWith({List<RowModel>? newMatrix}) {
    return MemoryBlocState(
      contentMatrix: newMatrix ?? contentMatrix,
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
