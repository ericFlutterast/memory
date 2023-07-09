import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_guess_the_color/bloc/memory_bloc.dart';

class GameItem extends StatefulWidget {
  final int i;
  final int j;
  final Color color;
  final bool isRemove;

  const GameItem({
    super.key,
    required this.color,
    required this.i,
    required this.j,
    required this.isRemove,
  });

  @override
  State<GameItem> createState() => _GameItemState();
}

class _GameItemState extends State<GameItem> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _collapsesValue;
  late Animation<double> _reversValue;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _collapsesValue =
        Tween<double>(begin: 1, end: 0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });

    _reversValue = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  Future<void> runAnimation() async {
    _animationController.forward();

    await Future.delayed(const Duration(milliseconds: 1500));

    if (!widget.isRemove) {
      _animationController.reverse();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          double angle = _reversValue.value * -pi;

          Matrix4 revers = Matrix4.identity()..scale(_collapsesValue.value);
          Matrix4 collapse = Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle);

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform(
                  transform: widget.isRemove ? revers : collapse,
                  alignment: FractionalOffset.center,
                  child: InkWell(
                    onTap: () {
                      runAnimation();
                      context.read<MemoryBloc>().add(
                            SelectGameElementEvent(
                              color: widget.color,
                              i: widget.i,
                              j: widget.j,
                            ),
                          );
                      //setState(() {});
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.width / 6,
                      width: MediaQuery.of(context).size.width / 6,
                      decoration: BoxDecoration(
                        color: _reversValue.value > 0.5
                            ? widget.color
                            : Colors.orange,
                        border: Border.all(
                          color: const Color.fromARGB(71, 73, 73, 73),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
}
