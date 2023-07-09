// ignore: depend_on_referenced_packages

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../models/game_field_model.dart';

part 'memory_bloc_event.dart';
part 'memory_bloc_state.dart';

class MemoryBloc extends Bloc<MemoryBlocEvent, MemoryBlocState> {
  SelectGameElementEvent? prevEvent;

  MemoryBloc() : super(MemoryBlocState()) {
    on<SelectGameElementEvent>(_snowColor);
    on<InitDataBlocEvent>(_initState);
  }

  void _snowColor(
      SelectGameElementEvent event, Emitter<MemoryBlocState> emit) async {
    if (prevEvent == null || prevEvent!.color != event.color) {
      prevEvent = event;
    } else if (prevEvent!.color == event.color &&
        prevEvent!.getIndex != event.getIndex) {
      List<RowModel> newState = [...state.contentMatrix];

      newState[event.i].listOfGameItem[event.j].isRemove = true;
      newState[prevEvent!.i].listOfGameItem[prevEvent!.j].isRemove = true;

      prevEvent = null;

      print('equals');
      emit(state.copyWith(newMatrix: newState));
    }
  }

  void _initState(
      InitDataBlocEvent event, Emitter<MemoryBlocState> emit) async {
    prevEvent = null;

    final List<_ColorCounter> listOfColors =
        List.generate(20, (index) => _ColorCounter(color: _generateColor()));

    final List<RowModel> newMatrix = List.generate(
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

    emit(state.copyWith(newMatrix: newMatrix));
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
