class Word {
  Word(this.word, this.translate, this.example, this.isFavourite);

  String word;
  List<String> translate;

  List<String> example;

  bool isFavourite;

  void addTofavourite() {
    isFavourite = !isFavourite;
  }
}