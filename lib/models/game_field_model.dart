import 'dart:ui';

class GameItemModel {
  final Color color;
  final int indexI;
  final int indexJ;
  bool isRemove;

  GameItemModel({
    required this.color,
    required this.indexI,
    required this.indexJ,
    this.isRemove = false,
  });
}

class RowModel {
  List<GameItemModel> listOfGameItem;

  RowModel(
    this.listOfGameItem,
  );
}

class GameFieldModel {
  List<RowModel> listOfRowModel;

  GameFieldModel(this.listOfRowModel);
}
