import 'package:flutter/material.dart';

import '../models/word_model.dart';

class HomePageModel extends ChangeNotifier {
  bool isRussinaLanguage = false;

  bool isDictionary = true;

  List<Word> favouritesWordsList = [];

  List<Word> wordsListFromServer = [
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

  List<Word> wordsList = [];

  HomePageModel() {
    wordsList = wordsListFromServer;
  }

  void filterWords(String enteredText) {
    print('Сработала');
    if(enteredText.isNotEmpty) {
      wordsList = wordsListFromServer.where((word) => word.word.toLowerCase().contains(enteredText.toLowerCase())).toList();
    } else {
      wordsList = wordsListFromServer;
    }
    notifyListeners();
  }

  List<String> pageNames = [
    'Словарь',
    'Переводчик'
  ];

  void changePage() {
    isDictionary = !isDictionary;
    notifyListeners();
  } 

  void changeLanguage() {
    isRussinaLanguage = !isRussinaLanguage;
    notifyListeners();
  }

  void getFavouritesList() {
    favouritesWordsList = wordsListFromServer.where((word) => word.isFavourite == true).toList();
    notifyListeners();
  }

  void addWordTofavourites(Word word) {
    word.isFavourite = !word.isFavourite;
    favouritesWordsList.add(word);
    notifyListeners();
  }

  void removeWordFromfavourites(Word word) {
    word.isFavourite = !word.isFavourite;
    favouritesWordsList.removeWhere((element) => element.isFavourite == word.isFavourite);
    notifyListeners();
  }
}
