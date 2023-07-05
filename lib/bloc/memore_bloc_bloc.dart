// ignore: depend_on_referenced_packages

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:game_of_guess_the_color/pages/game_field_page/widgets/game_item.dart';

import '../models/game_field_model.dart';

part 'memore_bloc_event.dart';
part 'memore_bloc_state.dart';

class MemoreBlocBloc extends Bloc<MemoreBlocEvent, MemoryBlocInitial> {
  //Color? _prevColor;

  MemoreBlocBloc() : super(MemoryBlocInitial()) {
    on<ShowColorMemoreBlocEvent>(_snowColor);
    on<InitDataBlocEvent>(_initState);
  }

  void _snowColor(
      ShowColorMemoreBlocEvent event, Emitter<MemoryBlocInitial> emit) {
    // if (_prevColor == null) {
    //   _prevColor = event.color;
    // } else {
    //   if (_prevColor == event.color) {
    //     _prevColor = null;
    //     print('equals');
    //   }
    // }

    print('${event.color}, ${event.i}, ${event.j}');
  }

  void _initState(
      InitDataBlocEvent event, Emitter<MemoryBlocInitial> emit) async {
    final List<ColorCounter> listOfColors =
        List.generate(20, (index) => ColorCounter(color: _generateColor()));

    const int i = 8;
    const int j = 5;

    final List<RowModel> matrixContent = List.generate(
        i,
        (index) => RowModel(
            i: i - 1,
            List.generate(
              j,
              (index) {
                int index = Random().nextInt(listOfColors.length);
                if (listOfColors[index].counter == 2) {
                  listOfColors.removeAt(index);
                  index = Random().nextInt(listOfColors.length);
                }

                listOfColors[index].counter++;

                return GameItem(
                  color: listOfColors[index].color,
                  i: i - 1,
                  j: j - 1,
                );
              },
            )));

    emit(state.copyWith(newState: matrixContent));
  }

  Color _generateColor() {
    return Color.fromRGBO(
        Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);
  }
}

class ColorCounter {
  final Color color;
  int counter;

  ColorCounter({
    required this.color,
    this.counter = 0,
  });
}
