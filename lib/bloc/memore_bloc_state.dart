part of 'memore_bloc_bloc.dart';

class MemoryBlocInitial {
  final List<RowModel> contentMatrix;

  MemoryBlocInitial({this.contentMatrix = const []});

  MemoryBlocInitial copyWith({List<RowModel>? newState}) {
    return MemoryBlocInitial(
      contentMatrix: newState ?? contentMatrix,
    );
  }
}
