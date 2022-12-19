import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromARGB(255, 175, 175, 175), width: 1),
        ),
      ),
      child: const TextField(
        cursorColor: Color.fromARGB(255, 124, 148, 255),
        decoration: InputDecoration(
          hintText: 'Введите слово...',
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
        ),
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
