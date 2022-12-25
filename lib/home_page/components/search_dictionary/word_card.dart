import 'package:flutter/material.dart';
import 'package:iron_dictionary_nosu/home_page/components/search_result_page/search_result_page.dart';
import 'package:provider/provider.dart';

import '../../../models/word_model.dart';
import '../../home_page_model.dart';

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
        //addToFavoriteDialog(context, word, model);
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchResultPage(word: word)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        color: word.isFavourite ? Color.fromARGB(69, 168, 183, 252) : Colors.white,
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