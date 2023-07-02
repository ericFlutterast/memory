import 'package:flutter/material.dart';
import 'package:game_of_guess_the_color/game_field_page/widgets/game_item.dart';

class GameField extends StatefulWidget {
  const GameField({super.key});

  @override
  State<GameField> createState() => _GameFieldState();
}

class _GameFieldState extends State<GameField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 9,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GameItem(color: Colors.green),
              GameItem(color: Colors.black),
              GameItem(color: Colors.purple),
              GameItem(color: Colors.red),
              GameItem(color: Colors.indigo),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
      ),
    );
  }
}
