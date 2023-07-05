import 'package:game_of_guess_the_color/pages/game_field_page/widgets/game_item.dart';

class RowModel {
  final int i;
  List<GameItem> listOfGameItem;

  RowModel(this.listOfGameItem, {required this.i});
}

class GameFieldModel {
  List<RowModel> listOfRowModel;

  GameFieldModel(this.listOfRowModel);
}
