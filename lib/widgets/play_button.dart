import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final String routWay;
  final String title;
  final Widget icon;

  const PlayButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.routWay});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, routWay);
      },
      style: ButtonStyle(
        shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        iconColor: const MaterialStatePropertyAll(Colors.black),
        overlayColor:
            const MaterialStatePropertyAll(Color.fromARGB(52, 143, 143, 143)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
        child: Column(
          children: [
            icon,
            Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
