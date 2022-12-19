class Word {
  Word(this.word, this.translate, this.example, this.isFavorite);

  String word;
  List<String> translate;

  List<String> example;

  bool isFavorite;

  void addToFavorite() {
    isFavorite = !isFavorite;
  }
}