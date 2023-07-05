import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_guess_the_color/pages/game_field_page/game_field.dart';

import 'bloc/memore_bloc_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MemoreBlocBloc bloc = MemoreBlocBloc();

    return MaterialApp(
      home: BlocProvider<MemoreBlocBloc>(
        create: (context) => MemoreBlocBloc(),
        child: GameField(bloc: bloc),
      ),
    );
  }
}
