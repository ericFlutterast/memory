// ignore: depend_on_referenced_packages

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../models/game_field_model.dart';

part 'memore_bloc_event.dart';
part 'memore_bloc_state.dart';

class MemoryBlocBloc extends Bloc<MemoreBlocEvent, MemoryBlocState> {
  MemoryBlocBloc() : super(MemoryBlocState()) {
    on<ShowColorMemoryBlocEvent>(_snowColor);
    on<InitDataBlocEvent>(_initState);
  }

  void _snowColor(
      ShowColorMemoryBlocEvent event, Emitter<MemoryBlocState> emit) {
    List<RowModel> matrix = state.contentMatrix;

    matrix[0].listOfGameItem[0].isRemove = true;
    emit(state.copyWith(newMatrix: matrix));

    // if (state.prevEvent == null) {
    //   emit(state.copyWith(newEvent: event));
    // } else if (state.prevEvent!.color == event.color) {
    //   matrix[state.prevEvent!.i].listOfGameItem[state.prevEvent!.j].isRemove =
    //       false;
    //   matrix[event.i].listOfGameItem[event.j].isRemove = false;
    //   emit(state.copyWith(newMatrix: matrix, newEvent: null));
    // }
  }

  void _initState(
      InitDataBlocEvent event, Emitter<MemoryBlocState> emit) async {
    final List<_ColorCounter> listOfColors =
        List.generate(20, (index) => _ColorCounter(color: _generateColor()));

    final List<RowModel> matrixContent = List.generate(
        8,
        (indexI) => RowModel(List.generate(
              5,
              (indexJ) {
                Color targetColor = Colors.white;
                int index = Random().nextInt(listOfColors.length);

                if (listOfColors[index].counter < 2) {
                  targetColor = listOfColors[index].color;
                  listOfColors[index].counter++;
                  if (listOfColors[index].counter == 2) {
                    listOfColors.removeAt(index);
                  }
                }

                return GameItemModel(
                  color: targetColor,
                  indexI: indexI,
                  indexJ: indexJ,
                );
              },
            )));

    emit(state.copyWith(newMatrix: matrixContent));
  }

  Color _generateColor() {
    return Color.fromRGBO(
        Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);
  }
}

class _ColorCounter {
  final Color color;
  int counter = 0;

  _ColorCounter({
    required this.color,
  });
}
