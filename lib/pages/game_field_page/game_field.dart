import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_guess_the_color/pages/game_field_page/widgets/game_item.dart';

import '../../bloc/memory_bloc.dart';
import '../../models/game_field_model.dart';

class GameField extends StatefulWidget {
  const GameField({
    super.key,
  });

  @override
  State<GameField> createState() => _GameFieldState();
}

class _GameFieldState extends State<GameField> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 222, 222),
      body: Column(
        children: [
          Center(
            child: BlocBuilder<MemoryBloc, MemoryBlocState>(
              buildWhen: (previous, current) =>
                  previous.contentMatrix != current.contentMatrix,
              builder: (context, state) {
                if (state.contentMatrix.isEmpty) {
                  return const CircularProgressIndicator.adaptive();
                }

                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.contentMatrix.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RowItem(
                      listOfGameItem: state.contentMatrix[index].listOfGameItem,
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<MemoryBloc>().add(InitDataBlocEvent());
              //runApp(const GameField());
            },
            style: ButtonStyle(
              shadowColor: const MaterialStatePropertyAll(Colors.transparent),
              backgroundColor:
                  const MaterialStatePropertyAll(Colors.transparent),
              iconColor: const MaterialStatePropertyAll(Colors.black),
              overlayColor: const MaterialStatePropertyAll(
                  Color.fromARGB(52, 143, 143, 143)),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
              child: Column(
                children: [
                  Icon(Icons.replay_outlined),
                  Text(
                    'play again',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final List<GameItemModel> listOfGameItem;

  const RowItem({
    required this.listOfGameItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Center(
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: listOfGameItem.length,
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            return GameItem(
              color: listOfGameItem[index].color,
              i: listOfGameItem[index].indexI,
              j: listOfGameItem[index].indexJ,
              isRemove: listOfGameItem[index].isRemove,
            );
          },
        ),
      ),
    );
  }
}
