import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  Separator({this.tbHeight, super.key});

  double? tbHeight; // tob-bottom height

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: tbHeight ?? 0),
        Container(height: 0.5, width: double.infinity, color: const Color.fromARGB(255, 120, 148, 255)),
        SizedBox(height: tbHeight ?? 0),
      ],
    );
  }
}