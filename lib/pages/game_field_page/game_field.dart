import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_guess_the_color/pages/game_field_page/widgets/game_item.dart';

import '../../bloc/memore_bloc_bloc.dart';
import '../../models/game_field_model.dart';

class GameField extends StatefulWidget {
  const GameField({
    super.key,
  });

  @override
  State<GameField> createState() => _GameFieldState();
}

class _GameFieldState extends State<GameField> {
  @override
  void initState() {
    super.initState();

    context.read<MemoryBlocBloc>().add(InitDataBlocEvent());

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: BlocBuilder<MemoryBlocBloc, MemoryBlocState>(
              builder: (context, state) {
                if (state.contentMatrix.isEmpty) {
                  return const CircularProgressIndicator.adaptive();
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.contentMatrix.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return RowItem(
                        listOfGameItem:
                            state.contentMatrix[index].listOfGameItem,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<MemoryBlocBloc>().add(InitDataBlocEvent());
              },
              child: const Text('play again')),
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
