import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_guess_the_color/bloc/memory_bloc.dart';
import 'package:game_of_guess_the_color/pages/game_field_page/game_field.dart';

import 'package:game_of_guess_the_color/pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MemoryBloc(),
      child: MaterialApp(
        routes: {
          '/home_page': (context) => const HomePage(),
          '/game_field': (context) => const GameField(),
        },
        initialRoute: '/home_page',
      ),
    );
  }
}
