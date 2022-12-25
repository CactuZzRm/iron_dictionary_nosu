import 'package:flutter/material.dart';
import 'package:iron_dictionary_nosu/home_page/home_page_model.dart';
import 'package:iron_dictionary_nosu/widgets/separator.dart';
import 'package:provider/provider.dart';

import '../../../models/word_model.dart';
import 'text_input_field.dart';
import 'word_card.dart';

class DictionaryPage extends StatelessWidget {
  DictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomePageModel>();
    List<Word> words = model.wordsList;

    return Column(
      children: [
        TextInputField(),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: words.length,
            separatorBuilder: (BuildContext context, int index) => Separator(),
            itemBuilder: (context, index) => WordCard(word: words[index]),
          ),
        ),
      ],
    );
  }
}
