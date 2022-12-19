import 'package:flutter/material.dart';

import '../models/word_model.dart';

class HomePageModel extends ChangeNotifier {
  bool isRussinaLanguage = false;

  List<Word> favoriteWordsList = [];

  List<Word> wordsList = [
    Word('Слово 1', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2'], false),
    Word('Слово 2', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2'], false),
    Word('Слово 3', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2'], false),
    Word('Слово 4', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2'], false),
    Word('Слово 5', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2'], false),
    Word('Слово 6', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2'], false),
    Word('Слово 7', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2'], false),
    Word('Слово 8', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2'], false),
    Word('Слово 9', ['Перевод 1', 'Перевод 2'], ['Пример 1', 'Пример 2'], false),
  ];

  void getFavoriteWords() {
    favoriteWordsList = wordsList.where((word) => word.isFavorite == true).toList();
    notifyListeners();
  }

  void changeLanguage() {
    isRussinaLanguage = !isRussinaLanguage;
    notifyListeners();
  }

  void addWordToFavorite(Word word) {
    word.isFavorite = !word.isFavorite;
    notifyListeners();
  }

  void removeWordFromFavorite(Word word) {
    word.isFavorite = !word.isFavorite;
    notifyListeners();
  }
}
