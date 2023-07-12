part of 'memory_bloc.dart';

class MemoryBlocState {
  List<RowModel> contentMatrix;
  int indexI;
  int indexJ;

  MemoryBlocState({
    this.contentMatrix = const [],
    this.indexI = 2,
    this.indexJ = 2,
  });

  (int, int) get getIndex => (indexI, indexJ);

  MemoryBlocState copyWith({List<RowModel>? newMatrix, int? i, int? j}) {
    return MemoryBlocState(
      contentMatrix: newMatrix ?? contentMatrix,
      indexI: i ?? indexI,
      indexJ: j ?? indexJ,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is MemoryBlocState &&
      runtimeType == other.runtimeType &&
      contentMatrix == other.contentMatrix &&
      indexI == other.indexI &&
      indexJ == indexJ;

  @override
  int get hashCode => contentMatrix.hashCode;

  @override
  String toString() {
    return 'MemoryBlocState: $contentMatrix';
  }
}
