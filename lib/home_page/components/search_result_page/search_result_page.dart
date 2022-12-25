import 'package:flutter/material.dart';
import 'package:iron_dictionary_nosu/home_page/home_page_model.dart';
import 'package:provider/provider.dart';

import '../../../models/word_model.dart';
import '../../../widgets/separator.dart';

class SearchResultPage extends StatelessWidget {
  SearchResultPage({super.key, this.searchWord, this.word});

  String? searchWord;
  Word? word;
  String translateListToString = '';

  void getTranslateAndExampleListToString() {
    translateListToString = word!.translate[0];
    for (int i = 1; i < word!.translate.length; i++) {
      translateListToString += ', ${word!.translate[i]}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomePageModel>();

    if (searchWord != null && model.wordsListFromServer.where((word) => word.word == searchWord!).isEmpty) {
      word = null;
    } else if (word != null) {
      getTranslateAndExampleListToString();
    } else {
      word = model.wordsListFromServer.where((word) => word.word == searchWord!).toList()[0];
      getTranslateAndExampleListToString();
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 124, 148, 255),
          centerTitle: true,
          elevation: 0,
          title: const Text('Перевод'),
          actions: [
            word != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: InkWell(
                      onTap: () {
                        //model.addWordTofavourites(word!);
                        addToFavoriteDialog(context, word!, model);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(Icons.star, color: word!.isFavourite ? Colors.amber[200] : Colors.white),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        body: word != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 28),
                    Center(
                      child: Text(
                        word!.word,
                        style: TextStyle(fontSize: 32),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        translateListToString,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Separator(),
                    const SizedBox(height: 20),
                    const Text(
                      'Примеры:',
                      style: TextStyle(fontSize: 32),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: word!.example.length,
                        separatorBuilder: (BuildContext context, int index) => Separator(tbHeight: 12),
                        itemBuilder: (context, index) => Text(
                          word!.example[index],
                          style: const TextStyle(fontSize: 20),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Text('К сожалению, слово $searchWord не найдено'),
              ));
  }
}

Future addToFavoriteDialog(BuildContext context, Word word, HomePageModel model) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
            '${word.isFavourite ? 'Удалить' : 'Добавить'} слово: ${word.word} ${word.isFavourite ? 'из' : 'в'} список избранных?'),
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
              word.isFavourite ? 'Удалить' : 'Добавить',
              style: const TextStyle(
                color: Color.fromARGB(255, 124, 148, 255),
              ),
            ),
            onPressed: () {
              word.isFavourite ? model.removeWordFromfavourites(word) : model.addWordTofavourites(word);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
