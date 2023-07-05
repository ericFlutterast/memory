import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_guess_the_color/pages/game_field_page/widgets/game_item.dart';

import '../../bloc/memore_bloc_bloc.dart';

class GameField extends StatefulWidget {
  final MemoreBlocBloc bloc;

  const GameField({
    super.key,
    required this.bloc,
  });

  @override
  State<GameField> createState() => _GameFieldState();
}

class _GameFieldState extends State<GameField> {
  @override
  void initState() {
    super.initState();

    widget.bloc.add(InitDataBlocEvent());

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MemoreBlocBloc, MemoryBlocInitial>(
        bloc: widget.bloc,
        builder: (context, state) {
          print(state.contentMatrix.length);

          if (state.contentMatrix.isEmpty) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          return ListView.separated(
            shrinkWrap: true,
            itemCount: state.contentMatrix.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return RowItem(
                  listOfGameItem: state.contentMatrix[index].listOfGameItem);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          );
        },
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final List<GameItem> listOfGameItem;

  const RowItem({
    required this.listOfGameItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: listOfGameItem,
    );
  }
}
