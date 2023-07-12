import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_guess_the_color/bloc/memory_bloc.dart';

import 'package:game_of_guess_the_color/widgets/play_button.dart';

const _sizesOfField = <String>[
  '2 x 2',
  '4 x 4',
  '5 x 6',
  '5 x 8',
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 222, 222),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              disabledColor: CupertinoColors.inactiveGray,
              onPressed: () => showCupertinoModalPopup(
                context: context,
                builder: (_) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    width: double.infinity,
                    child: CupertinoPicker(
                      backgroundColor: Colors.white,
                      scrollController: FixedExtentScrollController(
                        initialItem: _selectItem,
                      ),
                      itemExtent: 30,
                      onSelectedItemChanged: (int currentValue) {
                        setState(() {
                          _selectItem = currentValue;
                        });

                        context.read<MemoryBloc>().add(InitialValueForGame(
                            value: _sizesOfField[currentValue]));
                      },
                      children: _sizesOfField
                          .map((element) => Text(element))
                          .toList(),
                    ),
                  );
                },
              ),
              child: Text(
                _sizesOfField[_selectItem],
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const PlayButton(
                title: 'Play now',
                icon: Icon(Icons.play_arrow),
                routWay: '/game_field')
          ],
        ),
      ),
    );
  }
}
