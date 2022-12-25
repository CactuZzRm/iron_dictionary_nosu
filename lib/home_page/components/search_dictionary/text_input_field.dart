import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home_page_model.dart';

class TextInputField extends StatelessWidget {
  TextInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomePageModel>();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromARGB(255, 124, 148, 255), width: 1),
        ),
      ),
      child: TextField(
        onChanged: (text) => model.filterWords(text),
        cursorColor: Color.fromARGB(255, 124, 148, 255),
        decoration: const InputDecoration(
          hintText: 'Введите слово...',
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
        ),
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
