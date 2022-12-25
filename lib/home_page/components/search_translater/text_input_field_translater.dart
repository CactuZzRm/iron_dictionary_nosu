import 'package:flutter/material.dart';
import 'package:iron_dictionary_nosu/home_page/components/search_result_page/search_result_page.dart';

class TextInputFieldTranslater extends StatelessWidget {
  TextInputFieldTranslater({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromARGB(255, 124, 148, 255), width: 1),
        ),
      ),
      child: TextField(
        textInputAction: TextInputAction.go,
        onSubmitted: (text) {
          //text.isNotEmpty ?  : {};
          if(text.isNotEmpty) {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchResultPage(searchWord: text)));
          }
        },
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
