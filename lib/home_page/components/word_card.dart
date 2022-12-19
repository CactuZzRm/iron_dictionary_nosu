import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/word_model.dart';
import '../home_page_model.dart';

class WordCard extends StatelessWidget {
  WordCard({super.key, required this.word});

  Word word;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomePageModel>();
    return InkWell(
      splashColor: Color.fromARGB(255, 168, 184, 252),
      highlightColor: Color.fromARGB(255, 221, 227, 255),
      onTap: () {
        addToFavoriteDialog(context, word, model);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        color: word.isFavorite ? Colors.amber[100] : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                word.word,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: Text(
                word.translate[0],
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future addToFavoriteDialog(BuildContext context, Word word, HomePageModel model) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
            '${word.isFavorite ? 'Удалить' : 'Добавить'} слово: ${word.word} ${word.isFavorite ? 'из' : 'в'} список избранных?'),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Отмена',
              style: TextStyle(
                color: Color.fromARGB(255, 124, 148, 255),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              word.isFavorite ? 'Удалить' : 'Добавить',
              style: const TextStyle(
                color: Color.fromARGB(255, 124, 148, 255),
              ),
            ),
            onPressed: () {
              model.addWordToFavorite(word);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
